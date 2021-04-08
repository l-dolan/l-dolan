class Notes {

  ArrayList<Note> notes;
  String allNotes;
  String[] allNotesArray;

  Notes() {

    initialise();
  }

  void printNotes() {

    for (Note n : notes) {
      print(n.name(), "\n");
    }
  }

  void initialise() {

    int idx = 0;
    notes = new ArrayList<Note>();
    allNotes  = "A,A#,B,C,C#,D,D#,E,F,F#,G,G#";
    allNotesArray = allNotes.split(",");
    for (String s : allNotesArray) {
      Note n = new Note(s);
      n.setId(idx);
      notes.add(n);
      idx++;
    }
  }

  ArrayList<Note> getNotes() {

    return notes;
  }

  Note getNote(String notename) {

    Note note = new Note(notename);

    for (Note n : notes) {

      if (n.name().equals(notename)) {

        note = new Note(notename);
        note.setId(n.getId());
      }
    }
    return note;
  }

  String[] getNoteArray() {

    return allNotesArray;
  }
}
