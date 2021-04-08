class Frets {

  ArrayList<Fret> frets;
  PVector start;
  int noFrets, maxFrets, noStrings;
  float fretHeight, fretWidth;
  Tuning tuning;

  Frets() {

    noFrets = maxFrets;
    frets = new ArrayList();
    start = new PVector();
    tuning = new Tuning();
  }

  void build() {

    setTuning();

    int idx = 0;
    for (int i = 0; i < noFrets; i++) {

      print("          Fret" + (i + 1) + ": Buit", "\n");

      Fret f = new Fret(i, fretWidth, fretHeight);
      frets.add(f);
    }

    print("        Setting Notes...", "\n");

    for (Fret f : frets) {

      f.setNoStrings(noStrings);
      print("          Layering notes...", "\n");
      f.setNotes(tuning.getNoteArray(f.id + 1));
      f.setStart(start.x + (f.id * fretWidth), start.y);
      f.build();
      idx++;

      print("        Setting up Fret: " + (idx + 1) + "...", "\n");
    }

    print("      Finished Building Frets", "\n");
  }

  void update(Tuning tuning) {

    for (Fret f : frets) {

      f.setNotes(tuning.getNoteArray(f.id + 1));
      f.build();
    }
  }

  void setFrets(int frets_) {

    noFrets = frets_;
  }

  void setNoStrings(int noStrings_) {

    noStrings = noStrings_;
  }

  void setStart(float x, float y) {

    start.set(x, y);
  }

  void setFretWidth(float fretWidth_) {

    fretWidth = fretWidth_;
  }

  void setFretHeight(float fretHeight_) {

    fretHeight = fretHeight_;
  }

  void setTuning() {

    tuning.setTuning(config.getObject("TUNING").toString());
  }

  void printFrets() {

    print(frets.size());
  }
}
