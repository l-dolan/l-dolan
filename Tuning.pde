class Tuning {

  String tuning;
  String[] noteArray;
  ArrayList<Note> notes;
  int noFrets;
  Notes allNotes;

  final String E_STANDARD = "E STANDARD";
  final String E_FLAT = "E FLAT";

  ArrayList<String> tunings;

  Tuning() {

    notes = new ArrayList();
    allNotes = new Notes();
    tunings = new ArrayList();
  }

  void initialise() {

    notes = new ArrayList();

    tunings.add(E_STANDARD);
    tunings.add(E_FLAT);

    if (tuning == E_STANDARD) {

      String notelist = "E,A,D,G,B,E"; 
      noteArray = notelist.split(",");

      for (String s : noteArray) {

        notes.add(new Note(s));
      }
    } else if (tuning == E_FLAT) {

      String notelist = "D#,G#,C#,F#,A#,D#";
      noteArray = notelist.split(",");

      for (String s : noteArray) {

        notes.add(new Note(s));
      }
    }
  }

  void setTuning(String tuning_) {

    tuning = tuning_;
    initialise();
  }

  String getTuning() {

    return tuning;
  }

  void showNotes() {

    float x, y;
    fill(0);
    stroke(0);
    String str = "|  NOTES: ";
    x = (3*width)/4;
    x = (4*width)/6;
    y = 15;
    text("TUNING: " + tuning, x, y);
    int idx = 0;
    int idxmax = notes.size();

    for (Note n : notes) {

      if (idx < (idxmax - 1)) {

        str += n.name() + ",";
      } else {

        str += n.name();
      }
      idx++;
    }
    if (tuning.equals("E FLAT")) {
      text(str, x + 100, y);
    } else {
      text(str, x + 140, y);
    }
  }

  String[] getNoteArray() {

    return noteArray;
  }


  void setNoFrets(int frets_) {

    noFrets = frets_;
  }

  String[] getNoteArray(int fretId) {

    // We want to store 1 note per string
    int strings = 6;
    String[] idNotes = new String[strings];

    // Check tuning
    if (config.getObject("TUNING").toString() == E_STANDARD) {
    }

    int x = 0;
    // Get all musical notes
    ArrayList<Note> a = allNotes.getNotes();
    // For each note name in our noteArray
    for (String s : noteArray) {

      // Find index against each note
      for (int i = 0; i < allNotes.notes.size(); i++) {

        // Check if note index = currentnote
        if (a.get(i).name().equals(s)) {

          int m = i+fretId;

          // Set m based on index against allNotes
          if (m > allNotes.notes.size() - 1) {

            m = m - allNotes.notes.size();
          }

          // Make sure note in allNotes is not null
          if (a.get(m) != null) {

            String c = a.get(m).name();
            idNotes[x] = c;
            continue;
          }

          continue;
        }
      }
      x++;
      if (x > strings - 1) {
        x = 0;
      }
    }

    print("  Finished layer notes.", "\n");

    return idNotes;
  }
}
