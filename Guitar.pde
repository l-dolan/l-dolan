class Guitar {

  Neck neck;

  Tuning tuning;

  GStrings strings;

  float neckLength, neckHeight, fretWidth, nutWidth, sep;

  float[] frets, cells;

  int noStrings;

  String stringTuning;

  PVector pos;


  Guitar() {

    pos = new PVector();

    neck = new Neck();

    strings = new GStrings();

    tuning = new Tuning();
  }

  void build() {

    print("  Calculating Fret Width...", "\n");
    fretWidth = neckLength / frets.length;
    print("    " + fretWidth, "\n");

    print("  Calculating nutWidth...", "\n");
    nutWidth = fretWidth / 2;
    print("    " + nutWidth, "\n");

    tuning.setTuning(stringTuning);

    tuning.setNoFrets(frets.length);
    config.addObject("TUNING_OBJ", tuning);

    print("  Inilialising Neck...", "\n");
    neck.setPos(pos.x, pos.y);

    neck.setLen(neckLength);
    neck.setFretWidth(fretWidth);
    neck.setFretHeight(neckHeight);
    neck.setNutWidth(nutWidth);

    neck.setNoFrets(frets.length);

    neck.setNoStrings(noStrings);

    print("  Neck Initialised", "\n");

    print("  Building Neck...", "\n");   
    neck.build();

    config.addObject("NECK", neck);

    print("  Initialising Strings...", "\n");    

    strings.setNoStrings(noStrings);

    print("    Setting String Length: " + (neckLength + nutWidth), "\n");
    strings.setLen(neckLength + nutWidth);

    sep = 7.0;
    print("    Setting Sting Separation: " + sep, "\n");
    strings.setSep(sep);

    strings.setHeight(neckHeight);

    strings.setStart(pos.x - (neckLength/2) - nutWidth, pos.y + (neckHeight / 2));

    print("  Creating Strings...", "\n");
    strings.build();
    strings.initialise();

    config.addObject("GSTRINGS", strings);

    //neck.setScale((Scale) config.getObject("SCALE"));

    neck.setChord((Chord) config.getObject("CHORD"));

    print("  Guitar Build Complete.", "\n");
  }

  void render() {

    neck.render();

    for (GString s : strings.gStrings) {
      s.render();
    }

    tuning.showNotes();
  }

  void setTuning(String tuning_) {

    stringTuning = tuning_;
  }

  void setFrets(int frets_) {

    frets = new float[frets_];
  }

  void setNoStrings(int noStrings_) {

    noStrings = noStrings_;
  }

  void setLen(float len) {

    neckLength = len;
  }

  void setPos(float x, float y) {

    pos.set(x, y);
  }

  void setNeckHeight(float h) {

    neckHeight = h;
  }
}
