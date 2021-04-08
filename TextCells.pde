class TextCells {

  ArrayList<TextCell> cells;

  TextCell currentCell;

  int idx;

  TextCells() {

    cells = new ArrayList();
    idx = 0;
  }

  void addCell(TextCell tc) {

    tc.setId(idx);

    cells.add(tc);

    idx++;
  }

  ArrayList<TextCell> getCells() {

    return cells;
  }

  TextCell getCell(int id) {

    return cells.get(id);
  }

  TextCell getCell(String name) {

    int id = 0;
    for (TextCell tc : cells) {

      if (tc.text.equals(name)) {

        id = tc.getId();
      }
    }
    return cells.get(id);
  }

  void reset() {

    cells = new ArrayList();
  }

  TextCell getCurrentCell() {

    return currentCell;
  }

  void resetCurrentCell() {

    if (currentCell != null) {

      cells.get(currentCell.getId()).setCurrentCell(false);
    }
  }
}
