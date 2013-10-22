import de.bezier.data.sql.*;
import de.bezier.data.sql.mapper.*;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

PShape s;

void setup() {
  size(700, 700);
  // The file "bot.svg" must be in the data folder
  // of the current sketch to load successfully
  s = loadShape("open-streets-dc.svg");
}

void draw() {
  shape(s, 10, 10, 80, 80);
}
