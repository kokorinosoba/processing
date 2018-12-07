#!/usr/bin/env python
# coding: utf-8

# # Twitter APIを使う

# ## 初期設定

# In[ ]:


from requests_oauthlib import OAuth1Session
import requests
import json
import pandas as pd
from datetime import datetime, timedelta
from dateutil import parser
import os
import sys


# In[ ]:


# jupyter-notebookの設定(.pyとして保存するときには消す)
#__file__ = os.path.abspath("getTweets.ipynb")


# In[ ]:


# TWITTER API KEYS
CONSUMER_KEY = "3butuXSsI3D8ekK92Rh0NLn0i"
CONSUMER_SECRET = "o9w4gkXI9nvgPCFVctnypUlIszMk0Y7DuzxmGjVFyO4mwuJPHu"
ACCESS_TOKEN = "807962421683884032-MtVZ8NEIGizZ3K2Cg1Au0wg17gYIO8K"
ACCESS_TOKEN_SECRET = "u1SzoI5AYWiXyXShUIOqomYvTRaRZSEpujeTI350NzgNz"


# In[ ]:


twitter = OAuth1Session(CONSUMER_KEY, CONSUMER_SECRET, ACCESS_TOKEN, ACCESS_TOKEN_SECRET)


# ## 関数群

# ### APIへのアクセス関連

# In[ ]:


def lists_create(name):
    url = 'https://api.twitter.com/1.1/lists/create.json'
    param = {"name": name}
    result = twitter.post(url, params=param)
    print(result)


# In[ ]:


def statuses_home_timeline(number):
    url = "https://api.twitter.com/1.1/statuses/home_timeline.json"
    param = {"count": number}
    result = twitter.get(url, params=param)
    print(result)
    return result


# In[ ]:


def statuses_update(text):
    url = "https://api.twitter.com/1.1/statuses/update.json"
    param = {"status": text}
    result = twitter.post(url, params=param)
    print(result)


# In[ ]:


def statuses_user_timeline(screen_name="OMtB0XiogH5Repl", count=15):
    url = "https://api.twitter.com/1.1/statuses/user_timeline.json?tweet_mode=extended"
    param = {"screen_name": screen_name, "count": count}
    result = twitter.get(url, params=param)
    print("statuses_user_timeline", result)
    return result


# In[ ]:


def search_tweets(text, n_tweets=1, result_type="recent", until=str(datetime.now().strftime("%Y-%m-%d")), include_entities="true"):
    url = "https://api.twitter.com/1.1/search/tweets.json?tweet_mode=extended"
    param = {"q": text, "count": n_tweets, "lang": "ja", "result_type": result_type, "include_entities": include_entities}
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

# In[ ]:


def remove_tagurl(tweet):
    text = tweet["full_text"]
    if not tweet["entities"]["hashtags"] == []:
        for tag in tweet["entities"]["hashtags"]:
            text = text.replace("#"+tag["text"], "")
            text = text.replace("＃"+tag["text"], "")
    if not tweet["entities"]["urls"] == []:
        for urls in tweet["entities"]["urls"]:
            text = text.replace(urls["url"], "")
    if "media" in tweet["entities"].keys():
        text = text.replace(tweet["entities"]["media"][0]["url"], "")
    return text


# In[ ]:


def save_to_df(result):
    filename = os.path.join(os.path.dirname(os.path.abspath(__file__)), "output.csv")
    df = pd.read_csv(filename)
    tweets_json = json.loads(result.text)
    tweets_json = tweets_json["statuses"] if type(tweets_json) == dict else tweets_json
    now_t = datetime.now().strftime('%Y-%m-%d_%H:%M:%S')
    for tweet in tweets_json:
        text = remove_tagurl(tweet)
        # elementsに一行分のデータを入れる
        elements = [now_t, tweet["id"], parser.parse(tweet["created_at"]).strftime('%Y-%m-%d_%H:%M:%S'), text, tweet["user"]["name"], tweet["user"]["screen_name"], tweet["user"]["profile_image_url"], tweet["retweet_count"], tweet["favorite_count"]]
        # retweetであれば追加しない、追加しようとするツイートのidがすでにcsvファイルに入ってたら追加しない、リプライであれば追加しない
        if not "retweeted_status" in tweet.keys() and not tweet["id"] in df["id"].values and tweet["in_reply_to_status_id"] == None: # 条件式を考える
            series = pd.Series(elements, index=df.columns).replace("\n", "", regex=True)
            df = df.append(series, ignore_index=True)
    df = df.sort_values(by="created_at", ascending=False)
    df.to_csv(filename, index=False)


# In[ ]:


def join_search_words(search_words):
    search_words = ['"'+word+'"' for word in search_words]
    return "+OR+".join(search_words)


# In[ ]:


def execute(search_words, until=str(datetime.now().strftime("%Y-%m-%d"))):
    #if len(search_words) > 1 and type(search_words) == list:
    search_words = join_search_words(search_words)
    result = search_tweets(search_words, n_tweets=100, until=until)
    save_to_df(result)
    result = statuses_user_timeline(count=100)
    save_to_df(result)


# ## ここで実行

# In[ ]:


search_words = ["ハナテラス", "#ハナテラス"]


# In[ ]:


execute(search_words)


# ## 作業用
