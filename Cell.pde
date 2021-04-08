class Cell {

  float fret;
  String string;
  
  Note note;

  Cell(float fret_, String string_) {

    fret = fret_;
    string = string_;
    note = new Note();
  }
  
  
}
