class TweetSelector {
  ArrayList<String> tweets;
  int tweetIndex;
  Table csv;

  TweetSelector() {
    tweets = new ArrayList<String>();
    tweetIndex = 0;
    loadTweetFromCSV();
  }

  String getTweet() {
    return tweets.get(tweetIndex);
  }

  void indexIncrement() {
    tweetIndex++;
    if (tweetIndex >= tweets.size()) {
      tweetIndex = 0;
    }
  }

  void loadTweetFromCSV() {
    tweets.clear();
    csv = loadTable("output.csv", "header");
    for (int i = 0; i < csv.getRowCount(); i++) {
      tweets.add(csv.getString(i, 3));
      // println(tweets.get(i));
    }
    // println(tweets.size());
  }
}
