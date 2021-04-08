class Note {

  String note;
  int id;

  Note() {
  }

  Note(String note_) {
    note = note_;
  }

  Note(String note_, int id_) {
    note = note_;
    id = id_;
  }

  String name() {

    return note;
  }

  void setId(int id_) {

    id = id_;
  }

  int getId() {

    return id;
  }
}
