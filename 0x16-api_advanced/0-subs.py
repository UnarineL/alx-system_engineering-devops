#!/usr/bin/python3
"""
number of subscribers for subreddit
"""

from requests import get

def number_of_subscribers(subreddit):
    if subreddit is None or not isinstance(subreddit, str):
        return 0

    usr_agent = {'User-agent': 'Google Chrome Version 81.0.4044.129'}
    url = 'https://www.reddit.com/r/{}/about.json'.format(subreddit)
    response = get(url, headers=usr_agent)
    results = response.json()

    try:
        return results.get('data').get('subscribers')
    except Exception:
        return 0
