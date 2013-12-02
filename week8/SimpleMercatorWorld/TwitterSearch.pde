/*

   Just a simple Processing and Twitter thingy majiggy

   RobotGrrl.com

   Code licensed under:
   CC-BY

 */



class TwitterSearch {

  ArrayList<String> messages;
  ArrayList<User> users;
  RequestToken requestToken;
  // This is where you enter your Oauth info
  String OAuthConsumerKey = "lfWsUElOsrk59DRojRdHA";
  String OAuthConsumerSecret = "jp6ERtNz7bNUxQthKPi7JyjC8r3P2BaU1843Oc";

  // This is where you enter your Access Token info
  String AccessToken = "1919167711-tYWAbjsC77Kp634AA9NODUHZUScsLNIBhlKE5lo";
  String AccessTokenSecret = "opQaqnToWSKcwczFJ7pRbLb6wzacgKbIBlArIeAnBM";

  Twitter twitter;

  TwitterSearch() {
    messages = new ArrayList();
    users = new ArrayList();
    twitter = new TwitterFactory().getInstance();
    connectTwitter();
  }

  // Initial connection
  void connectTwitter() {
    twitter.setOAuthConsumer(OAuthConsumerKey, OAuthConsumerSecret);
    AccessToken accessToken = loadAccessToken();
    twitter.setOAuthAccessToken(accessToken);
  }


  // Loading up the access token
  AccessToken loadAccessToken(){
    return new AccessToken(AccessToken, AccessTokenSecret);
  }

  // Search for tweets
  void getSearchTweets(String queryStr, int total) {

    try {
      messages.clear();
      users.clear();
      Query query = new Query(queryStr);
      query.setCount(total); // Get 10 of the 100 search results
      QueryResult result = twitter.search(query);
      ArrayList tweets = (ArrayList) result.getTweets();
      
      
      for (int i=0; i<tweets.size(); i++) {
        Status t = (Status) tweets.get(i);
        messages.add(t.getText());
        //users.add(t.getUser());
         User u = t.getUser();
         println("Location - "+u.getLocation() + "                  /Tweet Loc - "+ t.getGeoLocation());
      }

    } catch (TwitterException e) {
      println("Search tweets: " + e);
    }

  }
}
