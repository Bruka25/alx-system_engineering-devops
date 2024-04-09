#!/usr/bin/python3
"""This module queries the Reddit API, parses the title of all hot articles
   and prints a sorted count of given keywords
"""

import re
import requests


def count_words(subreddit, word_list):
    """
    GET the word count for each word in word_list
    Print results in descending order by the count, not the title
    If no posts match or subreddit is invalid, print a newline
    If a word has no matches, skip and do not print it
    """
    store = {word.lower(): 0 for word in word_list}
    url = "https://www.reddit.com/r/{}/hot.json".format(subreddit)
    headers = {'user-agent': 'bruka request'}

    req = requests.get(url, headers=headers)
    if (req.status_code == 404 or 'data' not in req.json()):
        return None
    else:
        while (1):
            req = req.json()
            for post in req['data']['children']:
                tmp = post['data']['title'].split()
                for word in tmp:
                    if word.lower() in store.keys():
                        store[word.lower()] += 1

            after = req['data']['after']
            if (after is None):
                break
            req = requests.get("{}?after={}".format(url, after), headers=headers)

    store = [(k, store[k]) for k in
               sorted(store, key=store.get, reverse=True)]

    if len(store) == 0:
        print("")
    else:
        for k, v in store:
            if (v > 0):
                print("{}: {:d}".format(k, v))
