class Neck {


  int noFrets, maxfrets, noStrings;

  float fretWidth, fretHeight, nutWidth, len, sep;

  PVector pos;

  //Tuning tuning;

  Frets frets;

  Nut nut;

  //Scale scale;

  Chord chord;

  Neck() {

    pos = new PVector();
    //tuning = new Tuning();
    nut = new Nut();
    frets = new Frets();

    maxfrets = 24;
    noFrets = maxfrets;
  }

  void build() {

    //setTuning();

    if (len == 0) {
      len = fretWidth * noFrets;
    } else {
      fretWidth = len / noFrets;
    }
    print("    Initialising Frets...", "\n");
    frets.setFrets(noFrets);
    frets.setFretHeight(fretHeight);
    frets.setFretWidth(fretWidth);
    frets.setNoStrings(noStrings);
    frets.setStart(pos.x - (len/2), pos.y + (fretHeight/2));

    print("        Creating Frets...", "\n");
    frets.build();

    config.addObject("FRETS", frets);

    print("    Initialising Nut...", "\n");
    nut.setPos(pos.x - (len/2), pos.y);
    nut.setWidth(nutWidth);
    nut.setHeight(fretHeight);
    nut.setNoStrings(noStrings);
    nut.setNotes(((Tuning) config.getObject("TUNING_OBJ")).getNoteArray());
    print("      Creating Nut...", "\n");
    nut.build();

    config.addObject("NUT", nut);
  }

  void reset() {
  }

  void update() {

    //setTuning();
    nut.setNotes(((Tuning) config.getObject("TUNING_OBJ")).getNoteArray());
  }

  void render() {

    renderNeck();
    renderFrets();
    renderNut();
  }

  void renderNeck() {

    float [] neckColour = (float[]) config.getObject("NECK_COLOUR");
    fill(neckColour[0], neckColour[1], neckColour[2]);
    stroke(0);

    rect(pos.x - (len / 2), pos.y - (fretHeight /2), len, fretHeight);

    for (int i = 0; i < noFrets; i++) {
      stroke(0);
      line((pos.x-(len/2)) + (i * fretWidth), pos.y - (fretHeight/2), (pos.x-(len/2)) + (i * fretWidth), pos.y + (fretHeight/2));
    }
  }

  void renderNut() {

    nut.render();
    nut.showNut();
  }

  void renderFrets() {

    for (Fret f : frets.frets) {

      f.showFretNo();
      f.render();
    }
  }

  void setLen(float l) {
    len = l;
  }

  void setNoFrets(int frets_) {

    noFrets = frets_;
  }

  void setNoStrings(int s) {

    noStrings = s;
  }

  void setPos(float x, float y) {

    pos.set(x, y);
  }

  void setFretHeight(float fretHeight_) {

    fretHeight = fretHeight_;
  }

  void setFretWidth(float fretWidth_) {

    fretWidth = fretWidth_;
  }

  void setNutWidth(float nutWidth_) {

    nutWidth = nutWidth_;
  }

  //void setTuning() {

  //  tuning.setTuning(((Tuning) config.getObject("TUNING_OBJ")).getTuning());
  //}

  float getLength() {

    return len;
  }

  //void setScale(Scale s) {

  //  scale = s;
  //}

  void setChord(Chord c) {

    chord = c;
  }
}
