#!/usr/bin/env python
# coding: utf-8

# # Twitter APIを使う

# ## 初期設定

from requests_oauthlib import OAuth1Session
import requests
import json
import pandas as pd
from datetime import datetime, timedelta
from dateutil import parser

# TWITTER API KEYS
CONSUMER_KEY = "3butuXSsI3D8ekK92Rh0NLn0i"
CONSUMER_SECRET = "o9w4gkXI9nvgPCFVctnypUlIszMk0Y7DuzxmGjVFyO4mwuJPHu"
ACCESS_TOKEN = "807962421683884032-MtVZ8NEIGizZ3K2Cg1Au0wg17gYIO8K"
ACCESS_TOKEN_SECRET = "u1SzoI5AYWiXyXShUIOqomYvTRaRZSEpujeTI350NzgNz"

twitter = OAuth1Session(CONSUMER_KEY, CONSUMER_SECRET, ACCESS_TOKEN, ACCESS_TOKEN_SECRET)

# ## 関数群

# ### APIへのアクセス関連

def lists_create(name):
    url = 'https://api.twitter.com/1.1/lists/create.json'
    param = {"name": name}
    result = twitter.post(url, params=param)
    print(result)

def statuses_home_timeline(number):
    url = "https://api.twitter.com/1.1/statuses/home_timeline.json"
    param = {"count": number}
    result = twitter.get(url, params=param)
    print(result)
    return result

def statuses_update(text):
    url = "https://api.twitter.com/1.1/statuses/update.json"
    param = {"status": text}
    result = twitter.post(url, params=param)
    print(result)

def statuses_user_timeline(screen_name="winetourism01", count=15):
    url = "https://api.twitter.com/1.1/statuses/user_timeline.json"
    param = {"screen_name": screen_name, "count": count}
    result = twitter.get(url, params=param)
    print("statuses_user_timeline", result)
    return result

def search_tweets(text, n_tweets=1, result_type="recent", until=str(datetime.now().strftime("%Y-%m-%d"))):
    url = "https://api.twitter.com/1.1/search/tweets.json"
    param = {"q": text, "count": n_tweets, "lang": "ja", "result_type": result_type}
    result = twitter.get(url, params=param)
    print("search_tweets", result)
    return result

# ### CSVへの保存など

# 使う項目
# * id
# * created_at
# * text
# * user
#     * name
#     * screen name
#     * profile_image_url
# * retweet_count
# * favorite_count

def save_to_df(result):
    df = pd.read_csv("output.csv")
    tweets_json = json.loads(result.text)
    tweets_json = tweets_json["statuses"] if type(tweets_json) == dict else tweets_json
    now_t = datetime.now().strftime('%Y-%m-%d_%H:%M:%S')
    for tweet in tweets_json:
        elements = [now_t, tweet["id"], parser.parse(tweet["created_at"]).strftime('%Y-%m-%d_%H:%M:%S'), tweet["text"], tweet["user"]["name"], tweet["user"]["screen_name"], tweet["user"]["profile_image_url"], tweet["retweet_count"], tweet["favorite_count"]]
        if not "retweeted_status" in tweet.keys() and not tweet["id"] in df["id"].values and tweet["in_reply_to_status_id"] == None: # 条件式を考える
            series = pd.Series(elements, index=df.columns).replace("\n", "", regex=True)
            df = df.append(series, ignore_index=True)
    df = df.sort_values(by="created_at", ascending=False)
    df.to_csv("output.csv", index=False)

def join_search_words(search_words):
    return "+OR+".join(search_words)

def execute(search_words, until=str(datetime.now().strftime("%Y-%m-%d"))):
    if len(search_words) > 1 and type(search_words) == list:
        search_words = join_search_words(search_words)
    result = search_tweets(search_words, n_tweets=100, until=until)
    save_to_df(result)
    result = statuses_user_timeline(count=100)
    save_to_df(result)

# join_search_wordsを使わない場合（キーワード毎にAPIを叩くので効率が悪い）

#    for word in search_words:
#        result = search_tweets(word, 100)
#        save_to_df(result)

# ## ここで実行

search_words = ['"ワインツーリズムやまなし"', '"ワインツーリズム山梨"', '"#ワインツーリズムやまなし"', '"#ワインツーリズム山梨"']

execute(search_words)

# ## 作業用

# for i, tweet in enumerate(json.loads(search_tweets("#ワインツーリズムやまなし").text)["statuses"]):
#     print("-"*80)
#     print(i, tweet["text"])