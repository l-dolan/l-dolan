class Chords {

  ArrayList<String> majorChords;
  ArrayList<String> minorChords;
  ArrayList<String> sus2Chords;
  ArrayList<String> sus4Chords;
  ArrayList<String> types;

  Notes allNotes;

  HashMap<String, NoteSet> allChords;

  final String major = "MAJOR";
  final String minor = "MINOR";
  final String sus2 = "SUS2";
  final String sus4 = "SUS4";
  final String none = "NONE";

  Chords() {

    allNotes = new Notes();
    majorChords = new ArrayList();
    minorChords = new ArrayList();
    sus2Chords = new ArrayList();
    sus4Chords = new ArrayList();
    allChords = new HashMap();
  }

  void build() {

    initliaise();
  }

  NoteSet getChordNotes(String chordName) {

    return allChords.get(chordName);
  }

  HashMap<String, NoteSet> getAllChords() {

    return allChords;
  }

  void initliaise() {

    setTypes();

    allChords = new HashMap();
    Note root, second, minorthird, majorthird, fourth, fifth;

    // Initialise major/minor chords
    for (Note note : allNotes.notes) {

      root = note;

      Chord majorc = new Chord();
      Chord minorc = new Chord();
      Chord sus2c = new Chord();
      Chord sus4c = new Chord();

      // Add roots
      majorc.addNote(root);
      minorc.addNote(root);
      sus2c.addNote(root);
      sus4c.addNote(root);

      // Store steps
      int w = Integer.parseInt(((HashMap) config.getObject("STEPS")).get("W").toString());
      int h = Integer.parseInt(((HashMap) config.getObject("STEPS")).get("H").toString());
      int ww = Integer.parseInt(((HashMap) config.getObject("STEPS")).get("WW").toString());
      int wh = Integer.parseInt(((HashMap) config.getObject("STEPS")).get("WH").toString());

      // Get second
      int id = root.id + w;
      if (id > allNotes.notes.size() - 1) {

        id -= allNotes.notes.size();
      }
      second = allNotes.notes.get(id);
      sus2c.addNote(second);

      // Step towards minor third
      id = second.getId() + h;
      if (id > allNotes.notes.size() - 1) {
        id -= allNotes.notes.size();
      }
      minorthird = allNotes.notes.get(id);
      minorc.addNote(minorthird);

      // Step towards minor third
      id = minorthird.getId() + h;
      if (id > allNotes.notes.size() - 1) {
        id -= allNotes.notes.size();
      }
      majorthird = allNotes.notes.get(id);
      majorc.addNote(majorthird);

      // Step towards fourth
      id = majorthird.getId() + h;
      if (id > allNotes.notes.size() - 1) {
        id -= allNotes.notes.size();
      }
      fourth = allNotes.notes.get(id);
      sus4c.addNote(fourth);

      // Step towards perfect fifth
      id = fourth.getId() + w;
      if (id > allNotes.notes.size() - 1) {
        id -= allNotes.notes.size();
      }

      fifth = allNotes.notes.get(id);
      majorc.addNote(fifth);
      minorc.addNote(fifth);
      sus2c.addNote(fifth);
      sus4c.addNote(fifth);

      String majorcname, minorcname, sus2name, sus4name;
      majorcname = note.name();
      minorcname = note.name() + "m";
      sus2name = note.name() + "sus2";
      sus4name = note.name() + "sus4";

      print("Adding sus2/minor/major/sus4 chords:", sus2name, minorcname, majorcname, sus4name, "\n");
      allChords.put(majorcname, majorc.getNotes());
      allChords.put(minorcname, minorc.getNotes());
      allChords.put(sus2name, sus2c.getNotes());
      allChords.put(sus4name, sus4c.getNotes());
    }

    config.addObject("ALL_CHORDS", allChords);
  }

  void setTypes() {

    types = new ArrayList();
    types.add(major);
    types.add(minor);
    types.add(sus2);
    types.add(sus4);
    types.add(none);
  }

  ArrayList<String> getTypes() {

    return types;
  }
}
