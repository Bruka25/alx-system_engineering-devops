#!/usr/bin/python3
"""This module  queries the Reddit API and returns a list containing
    the titles of all hot articles for a given subreddit recursively
"""
import requests


def recurse(subreddit, hot_list=[], after=""):
    """
    Fubtion that stores results in hot_list provided as default to method
    Requires recursive request stores.
    """
    if (after is None):
        return hot_list

    if (len(hot_list) == 0):
        url = "https://www.reddit.com/r/{}/hot.json".format(subreddit)
    else:
        url = "https://www.reddit.com/r/{}/hot.json?after={}".format(
            subreddit, after)
    headers = {'user-agent': 'bruka request'}

    req = requests.get(url, headers=headers)
    if (req.status_code == 404):
        return None
    elif 'data' not in req.json():
        return None
    else:
        req = req.json()
        for post in req['data']['children']:
            hot_list.append(post['data']['title'])

    after = req['data']['after']
    return recurse(subreddit, hot_list, after)
