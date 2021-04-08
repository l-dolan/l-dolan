class NoteSet {

  ArrayList<Note> notes;

  NoteSet() {

    notes = new ArrayList();
  }

  void addNote(Note n) {

    notes.add(n);
  }

  void showNotes() {

    for (Note n : notes) {
      print(n.name(), "\n");
    }
  }

  void reset() {

    notes = new ArrayList<Note>();
  }
}
