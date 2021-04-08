class GStrings {

  Tuning tuning;
  ArrayList<GString> gStrings;
  PVector start, end;
  int idx, noStrings;
  float l, h, sep;

  GStrings() {

    gStrings = new ArrayList();
    tuning = new Tuning();
    start = new PVector();
    end = new PVector();
  }

  void build() {

    setTuning();
  }

  void setNoStrings(int noStrings_) {

    noStrings = noStrings_;
  }

  void addString(GString s) {

    gStrings.add(s);
    idx++;
  }

  void setLen(float l_) {

    l = l_;
  }

  void setHeight(float h_) {

    h = h_;
  }

  void setStart(float x, float y) {

    start.set(x, y);
    setEnd(x + l, y);
  }

  void setEnd(float x, float y) {

    end.set(x, y);
  }

  void setTuning() {

    tuning.setTuning((config.getObject("TUNING")).toString());
  }

  void setSep(float sep_) {

    sep = sep_;
  }

  void initialise() {

    for (int i = 0; i < noStrings; i++) {

      GString str = new GString(tuning.getNoteArray()[i], l);
      str.setHeight(h);
      str.setStart(start.x, start.y - sep - (i*(h / noStrings)));
      str.setIdx(i);
      gStrings.add(str);
      print("    String: " + (i + 1), "\n");
    }
  }
}
