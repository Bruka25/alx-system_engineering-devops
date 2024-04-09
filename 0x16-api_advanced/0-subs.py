#!/usr/bin/python3
"""This module queries the Reddit API and returns the
   number of subscribers
"""
import requests


def number_of_subscribers(subreddit):
    """ Function that GETS subscriber count of a given subreddit """
    url = "http://www.reddit.com/r/{}/about.json".format(subreddit)
    headers = {'user-agent': 'philsrequest'}
    req = requests.get(url, headers=headers)
    if (req.status_code == 302 or req.status_code == 404):
        return 0
    req = req.json()
    if ('error' in req):
        return 0
    elif ('subscribers' in req['data']):
        return req['data']['subscribers']
    else:
        return 0
