class Guardian{
  
   String apiKey ;
 String baseURL;
  
 Guardian(){
 
 
   apiKey = "3a37jt68uwz5tmthpu2fgq2u";
   baseURL = "http://api.nytimes.com/svc/search/v2/articlesearch,json?q=";
 
 
 } 
  
  
  //JSONArray getAllArticles(String searchText) {
  processing.data.JSONArray getAllArticles(String searchText) {
 
  //String request = baseURL + "Pakistan+drone&from-date=2013-08-01&to-date=2013-11-03&api-key=" + apiKey;
  String request = baseURL + searchText + "&api-key="+ apiKey;
  // Here you can start to actually dig into the data
  try {
    
    // Load the search results into a JSONObject so Processing can parse the JSON data structure
    processing.data.JSONObject nytData = loadJSONObject(request);
    int results = nytData.getJSONObject("response").getInt("pages");
    
    // Get the "total" result number and store is an integer
    println ("There were " + results + " occurences of the term Pakistan + drone in the last 3 days");
    
    return nytData.getJSONObject("response").getJSONArray("results");
  }
  catch (Exception e) {
    println ("There was an error parsing the JSONObject.");
  }
    return new processing.data.JSONArray();
}
  
}
