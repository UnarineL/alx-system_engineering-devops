#!/usr/bin/python3

"""
prints title of first 10 host post listed
"""

from requests import get

def top_ten(subreddit):
    if subreddit is None or not isinstance(subreddit, str):
        print("None")

    usr_agent = {'User-agent': 'Google Chrome Version 81.0.4044.129'}
    prmeter = {'limit': 10}
    url = 'https://www.reddit.com/r/{}/hot/.json'.format(subreddit)
    response = get(url, headers=usr_agent, prmeter=prmeter)
    results - response.json()

    try:
        data = results.get('data').get('children')

        for i in data:
            print(i.get('data').get('chldren'))

    except Exception:
        print("None")
