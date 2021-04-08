class GString {

  Note note;

  float len, h, thickness, sep;

  int idx;

  PVector start, end;
  
  Gauge gauge;

  GString(String notename, float l_) {

    note = new Note(notename);
    len = l_;
    start = new PVector();
    end = new PVector();
    
    gauge = new Gauge();
  }

  void setThickness(float t) {

    thickness = t;
  }

  void setStart(float x, float y) {
    start.set(x, y);
    setEnd(x+len, y);
  }

  void setEnd(float x, float y) {
    end.set(x, y);
  }

  void setIdx(int idx_) {

    idx = idx_;
  }

  void setSep(float sep_) {

    sep = sep_;
  }

  void setHeight(float h_) {

    h = h_;
  }

  void render() {

    if (len > 0) {
      stroke(128, 128, 0);
      line(start.x, start.y, end.x, end.y);
    }
  }
}
