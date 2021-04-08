class Chord {

  NoteSet notes;

  String name;

  String type;

  ArrayList<String> types;

  Chord() {

    notes = new NoteSet();
    types = new ArrayList();
  }

  void build() {

    if (type.equals("MINOR")) if (!name.endsWith("m")) name += "m";

    if (type.equals("MAJOR")) if (name.endsWith("m")) name = name.replace("m", "");
  }

  void changeName(String name_) {

    name = name_;
  }

  String name() {

    return name;
  }

  void setType(String type_) {

    type = type_;
  }

  String getType() {

    return type;
  }

  ArrayList<String> getTypes() {

    return types;
  }

  void addNote(Note n) {

    notes.addNote(n);
  }

  void addNotes(NoteSet nt) {

    for (Note n : nt.notes) {

      notes.addNote(n);
    }
  }

  void setNotes(NoteSet nt) {

    notes = new NoteSet();
    for (Note n : nt.notes) {
      notes.addNote(n);
    }
  }

  void update() {

    build();
  }

  void resetNotes() {

    notes = new NoteSet();
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

  void highlightNotes() {

    fill(128, 128, 128);
    stroke(128, 128, 128);

    float d, x, y;
    d = (4*width/6);
    x = d;
    y = 45;
    String t = "|  CHORD: ";
    String st = "   ";

    if ((Scale) config.getObject("SCALE") == null) {
      x = d;
      t = "CHORD: ";
      st = "";
    } else if (((Scale) config.getObject("SCALE")).getType() == ((Pattern) config.getObject("PATTERN")).majorPentatonic) {
      x = d + 210;
    } else if (((Scale) config.getObject("SCALE")).getType() == ((Pattern) config.getObject("PATTERN")).minorPentatonic) {
      x = d + 210;
    } else if (((Scale) config.getObject("SCALE")).getType() == ((Pattern) config.getObject("PATTERN")).melodicMinor) {
      x = d + 180;
    } else if (((Scale) config.getObject("SCALE")).getType() == ((Pattern) config.getObject("PATTERN")).wholeTone) {
      x = d + 170;
    } else {
      x = d + 140;
    }
    text(t + name + " (" + type + ")", x, y);
    String str = "";

    for (Note n : notes.notes) {

      str += st + n.name() + "\n";
    }
    y = 60;
    text(str, x, y);
  }
}
