class Fret {

  int id, noStrings;
  float fretWidth, fretHeight, diff;
  NoteSet notes;
  PVector start;

  Fret(int id_, float fretWidth_, float fretHeight_) {

    id = id_;
    fretWidth = fretWidth_;
    fretHeight = fretHeight_;
    notes = new NoteSet();
    start = new PVector();
  }

  void build() {

    print("          Final touches on Fret:" + (id + 1), "\n");
    diff = fretHeight / noStrings;
  }

  void setStart(float x, float y) {

    start = new PVector(x, y);
  }

  void setNoStrings(int noStrings_) {

    noStrings = noStrings_;
  }

  void setNotes(String[] notes_) {

    notes = new NoteSet();
    for (String s : notes_) {
      notes.addNote(new Note(s));
    }
  }

  void render() {
    stroke(0);
    noFill();
    for (int i = 0; i < noStrings; i++) {

      line(start.x + 1, start.y - ((i+1) * diff), start.x-1 + fretWidth, start.y - ((i+1) * diff));
    }
  }

  void showNotes() {

    fill(255);
    stroke(0);
    int idx = 0;
    for (Note n : notes.notes) {

      text(n.name(), start.x + (fretWidth/2), start.y - (idx * diff) - (diff / 4));
      idx++;
    }
  }

  int getId() {

    return id;
  }

  void showFretNo() {

    fill(0);
    stroke(0);
    text(id + 1, start.x + (fretWidth - 4), start.y + 11);
    text(id + 1, start.x + (fretWidth - 4), start.y - fretHeight - 1);
  }

  void highlightNote(String notename, float[] colour) {

    fill(colour[0], colour[1], colour[2]);
    stroke(0);
    int idx = 0;
    for (Note n : notes.notes) {

      if (n.name().equals(notename)) {

        ellipse(start.x + (fretWidth/2), start.y - (idx * (fretHeight/noStrings)) - (fretHeight/noStrings)/2, (fretHeight/noStrings), (fretHeight/noStrings));
      }
      idx++;
    }
  }

  void highlightNotes(NoteSet notes_, float[] colour) {

    fill(colour[0], colour[1], colour[2]);
    stroke(0);
    for (Note notename : notes_.notes) {

      int idx = 0;
      for (Note n : notes.notes) {

        if (n.name().equals(notename.name())) {

          ellipse(start.x + (fretWidth/2), start.y - (idx * (fretHeight/noStrings)) - (fretHeight/noStrings)/2, (fretHeight/noStrings), (fretHeight/noStrings));
        }
        idx++;
      }
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

          ellipse(start.x + (fretWidth/2), start.y - (idx * (fretHeight/noStrings)) - (fretHeight/noStrings)/2, (fretHeight/noStrings), (fretHeight/noStrings));
        }
        idx++;
      }
      idx = 0;
    }
  }

  void highlightScale(Scale s, float[] colour) {

    int idx = 0;
    stroke(0);
    fill(colour[0], colour[1], colour[2]);

    for (Note n : s.getNotes().notes) {

      String notename = n.name();
      for (Note note : notes.notes) {

        if (note.name().equals(notename)) {

          stroke(0);
          ellipse(start.x + (fretWidth/2), start.y - (idx * (fretHeight/noStrings)) - (fretHeight/noStrings)/2, (fretHeight/noStrings), (fretHeight/noStrings));
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
          ellipse(start.x + (fretWidth/2), start.y - (idx * (fretHeight/noStrings)) - (fretHeight/noStrings)/2, (fretHeight/noStrings), (fretHeight/noStrings));
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
          ellipse(start.x + (fretWidth/2), start.y - (idx * (fretHeight/noStrings)) - (fretHeight/noStrings)/2, (fretHeight/noStrings), (fretHeight/noStrings));
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
              ellipse(start.x + (fretWidth/2), start.y - (idx * (fretHeight/noStrings)) - (fretHeight/noStrings)/2, (fretHeight/noStrings), (fretHeight/noStrings));
            }
            idx++;
          }
          idx = 0;
        }
      }
    }
  }
}
