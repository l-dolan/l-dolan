class Nut {

  NoteSet notes;

  Tuning tuning;

  PVector pos, start;

  float w, h, sep, diff;

  int noStrings;

  Nut() {

    notes = new NoteSet();
    tuning = new Tuning();
    pos = new PVector();
    start = new PVector();
    sep = 7;
  }

  void build() {

    setTuning();
    diff = h / noStrings;

    print("      Nut created successfully", "\n");
  }

  void update(Tuning tuning_) {

    setNotes(tuning_.getNoteArray());
  }

  void setPos(float x, float y) {

    pos.set(x, y);
  }

  void setHeight(float h_) {

    h = h_;
  }

  void setWidth(float w_) {

    w = w_;
  }

  void setNoStrings(int noStrings_) {

    noStrings = noStrings_;
  }

  void setSep(float sep_) {

    sep = sep_;
  }

  void setTuning() {

    tuning.setTuning(config.getObject("TUNING").toString());
    //print(tuning.getTuning());
  }

  void setNotes(String[] notes_) {

    notes = new NoteSet();
    for (String n : notes_) {
      notes.addNote(new Note(n));
    }
  }

  void render() {

    float [] nutColour = (float[]) config.getObject("NUT_COLOUR");
    fill(nutColour[0], nutColour[1], nutColour[2]);
    stroke(0);
    rect(pos.x - w, pos.y - (h / 2), w, h);
    for (int i = 0; i < noStrings; i++) {
      fill(255);
      stroke(0);
      line(pos.x, pos.y + (h / 2) - sep - (i*(h/noStrings)), pos.x-w, pos.y + (h / 2) - sep - (i*(h/noStrings)));
    }
  }

  void showNotes() {

    fill(255);
    stroke(0);
    int idx = 0;
    for (Note n : notes.notes) {

      text(n.name(), pos.x - ((3*w)/4), pos.y + h/2 - (idx * diff) - (diff / 4));
      idx++;
    }
  }

  void showNut() {

    fill(0);
    stroke(0);
    text("NUT", pos.x - (w/3), pos.y + h/2 + 11);
    text("NUT", pos.x - (w/3), pos.y - h/2 - 1);
    //text("NUT", pos.x, pos.y);
  }

  void highlightScale(Scale s, float[] colour) {

    int idx = 0;
    fill(colour[0], colour[1], colour[2]);
    stroke(0);

    for (Note n : s.notes.notes) {

      String notename = n.name();
      for (Note note : notes.notes) {

        if (note.name().equals(notename)) {

          rect(pos.x - w, pos.y + (h/2) - (idx * diff), w, -diff);
        }

        idx++;
      }

      idx = 0;
    }
  }

  void highlightChord(Chord c, float[] colour) {

    int idx = 0;
    fill(colour[0], colour[1], colour[2]);
    stroke(0);

    for (Note n : c.notes.notes) {

      String notename = n.name();
      for (Note note : notes.notes) {

        if (note.name().equals(notename)) {

          rect(pos.x - w, pos.y + (h/2) - (idx * diff), w, -diff);
        }

        idx++;
      }

      idx = 0;
    }
  }

  void highlightScaleChord(Scale s, Chord c, float[] colour) {

    int idx = 0;
    //fill(colour[0], colour[1], colour[2]); 
    stroke(0);
    for (Note n : s.notes.notes) { 

      String notename = n.name(); 
      for (Note note : notes.notes) {

        if (note.name().equals(notename)) {

          fill(255, 0, 0);
          rect(pos.x - w, pos.y + (h/2) - (idx * diff), w, -diff);
        }

        idx++;
      }

      idx = 0;
    }

    for (Note n : c.notes.notes) {

      String notename = n.name();
      for (Note note : notes.notes) {

        if (note.name().equals(notename)) {

          fill(0, 0, 255);
          rect(pos.x - w, pos.y + (h/2) - (idx * diff), w, -diff);
        }

        idx++;
      }

      idx = 0;
    }

    for (Note n : c.notes.notes) {

      String notename = n.name();

      for (Note nt : s.notes.notes) {
        if (notename.equals(nt.name())) {

          for (Note note : notes.notes) {

            if (note.name().equals(notename)) {

              fill(0, 128, 0);            
              rect(pos.x - w, pos.y + (h/2) - (idx * diff), w, -diff);
            }

            idx++;
          }
          idx = 0;
        }
      }
    }
  }
}
