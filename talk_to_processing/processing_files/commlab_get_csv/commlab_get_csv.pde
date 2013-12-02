/*
Get CSV file from a URL

CSV looks something like:

230,rectangle,judy
463,rectangle,andrew

*/
void setup() {
  size(480, 480);
  noFill();
  strokeWeight(2);
  String rows[] = loadStrings("http://itp.robynoverstreet.com/week5/simple_csv_output.php");
  println("there are " + rows.length + " lines");
  // loop through each record
  for (int i = 0 ; i < rows.length; i++) {
      String[] fields = split(rows[i], ',');
      String shape_type = fields[1];
      int shape_size = Integer.parseInt(fields[0]);
      
      if (shape_type.equals("square")){
        rect(10 * i, 20 * i, shape_size, shape_size);
      } else if (shape_type.equals("circle")){
        ellipse(10 * i, 20 * i, shape_size, shape_size);
      } else {
        println("incompatible shape");
      }
      
  }
}

