void setup() {
  size(480, 480);
  /*
  Change title and body to unique values to test
  To check to see if your insert worked here: http://itp.robynoverstreet.com/week5/blog_check.php
  */
  String title = "Hi";
  String body = "Howdy";
  String url = "http://itp.robynoverstreet.com/week5/insert_via_url.php?title="+title+"&body="+body;
  String rows[] = loadStrings(url);
  
  String result = rows[0];
  
  if (result.equals("success")){
    println("Added new record to DB!");
  } else {
    println("Could not add new record. Result: " + result); 
  }
}
