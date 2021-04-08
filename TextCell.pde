class TextCell {

  boolean tuningCell, chordCell, chordTypeCell, scaleCell, scaleTypeCell, currentCell, checked = false;

  float x, y, y2, sep;

  int id;

  String text, option;

  float colour;

  TextCell() {
  }

  TextCell(float x_, float y_, String text_, float y2_, String option_, float sep_) {

    x = x_;
    y = y_;
    y2 = y2_;
    text = text_;
    option = option_;
    sep = sep_;
  }

  TextCell(float x_, float y_, String text_, float y2_, String option_, float sep_, float colour_) {

    x = x_;
    y = y_;
    y2 = y2_;
    text = text_;
    option = option_;
    sep = sep_;
    colour = colour_;
  }

  void show() {

    if (currentCell) {

      stroke(0, 255, 0);
      noFill();
      if (text.length() > 2) {

        //rect(x, y, sep, y2);
      } else {

        //rect(x - 9, y, sep, y2);
      }
      fill(0);
      stroke(0);
      text(text, x, y);
    } else {

      fill(128, 128, 128);
      stroke(0);
      text(text, x, y);
    }
  }

  void setColour(float colour_) {

    colour = colour_;
  }

  void setAsCurrentCell() {

    currentCell = true;
  }

  void setCurrentCell(boolean con) {

    currentCell = con;
  }

  void setId(int id_) {

    id = id_;
  }

  int getId() {

    return id;
  }
}
