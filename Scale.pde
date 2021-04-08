class Scale {

  Pattern pattern;

  NoteSet notes;

  Note root, currentNote, nextNote;

  Notes allNotes;

  String type;

  Scale() {

    notes = new NoteSet();
    allNotes = new Notes();
  }

  void build() {

    notes.reset();
    //print("        Building Pattern...", "\n");
    if (type != null) {

      pattern = (Pattern) config.getObject("PATTERN");
      pattern.setType(type);
      pattern.build();
    } 
    //print("        Pattern Built", "\n");

    currentNote = allNotes.getNote(root.name());
    notes.addNote(currentNote);
    int rootId = allNotes.getNote(root.name()).getId();
    int move;
    int currentPos = rootId;

    //print("        Setting Notes...", "\n");
    for (String step : pattern.getPattern()) {

      print(pattern.steps.get(step), "\n");
      int dist = pattern.steps.get(step);

      move = currentPos + dist;

      if (move > allNotes.notes.size() - 1) {
        move -= allNotes.notes.size();
      }

      nextNote = allNotes.getNotes().get(move);
      //print(currentNote.name(), nextNote.name(), dist, step, move, "\n");

      Note note = allNotes.getNote(nextNote.name());
      notes.addNote(note);

      currentNote = nextNote;
      currentPos = move;
    }
    //print("        Notes set.", "\n");
  }

  void setPatternType(String pattern_) {

    type = pattern_;
    //pattern.setType(type);
  }

  void setRoot(String root_) {

    root = new Note(root_);
  }

  Note getRoot() {

    return root;
  }

  NoteSet getNotes() {

    return notes;
  }

  String[] getNoteArray() {

    String[] n = new String[notes.notes.size()];

    int idx = 0;
    for (Note nt : notes.notes) {
      n[idx] = nt.name();
      idx++;
    }
    return n;
  }

  String getType() {

    return type;
  }

  void highlightNotes() {

    float x, y;

    x = (4*width)/6;
    y = 45;

    fill(128, 128, 128);
    stroke(128, 128, 128);

    if (root != null && type != null) {

      text("SCALE: " + root.name() + " (" + type + ")", x, y);
    } else if (root != null || type != null) {

      if (root != null) {

        text("SCALE: " + root.name(), x, y);
      } 
      if (type != null) {

        text("SCALE: " + type, x, y);
      }
    }

    String str = "";

    for (Note n : notes.notes) {

      str += n.name() + "\n";
    }
    y = 60;
    text(str, x, y);
  }
}
