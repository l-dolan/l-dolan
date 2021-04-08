class Overlay {

  Tuning tuning;

  Pattern pattern;

  Neck neck;

  Nut nut;

  Frets frets;

  GStrings strings;

  Scale scale;

  Chords chords;

  Chord chord;

  Notes allNotes;

  NoteSet notes;

  Legend legend;

  TextCells textCells;

  TextCell currentTuningCell, 
    currentChordCell, 
    currentChordTypeCell, 
    currentScaleCell, 
    currentScaleTypeCell;

  Overlay() {

    tuning = (Tuning) config.getObject("TUNING_OBJ");
    pattern = (Pattern) config.getObject("PATTERN");
    neck = (Neck) config.getObject("Neck");
    nut = (Nut) config.getObject("NUT");
    frets = (Frets) config.getObject("FRETS");
    strings = (GStrings) config.getObject("STRINGS");
    scale = (Scale) config.getObject("SCALE");
    chord = (Chord) config.getObject("CHORD");

    chords = new Chords();
    chords.build();
    allNotes = new Notes();
    legend = new Legend();
    textCells = new TextCells();
  }

  void build() {

    //setTuning();

    int idx = 0;

    idx = setupTuningOptions(idx);
    idx = setupChordOptions(idx);
    idx = setupScaleOptions(idx);

    for (TextCell tc : textCells.cells) {

      if (tc.option.equals("TUNING OPTIONS") && tc.text.equals(tuning.getTuning())) {

        tc.tuningCell = true;
        tc.setAsCurrentCell();
        currentTuningCell = tc;
      } 
      if (chord != null) {

        if (tc.option.equals("CHORD OPTIONS") && tc.text.equals(chord.name())) {

          tc.chordCell = true;
          tc.setAsCurrentCell();
          currentChordCell = tc;
        }
      }
      if (tc.option.equals("CHORD OPTIONS") && tc.text.equals(pattern.getType())) {

        tc.chordTypeCell = true;
        tc.setAsCurrentCell();
        currentChordTypeCell = tc;
      } 
      if (scale != null) {

        if (tc.option.equals("SCALE OPTIONS") && tc.text.equals(scale.getRoot().name())) {

          tc.scaleCell = true;
          tc.setAsCurrentCell();
          currentScaleCell = tc;
        }
      }
      if (tc.option.equals("SCALE OPTIONS") && tc.text.equals(pattern.getType())) {

        tc.scaleTypeCell = true;
        tc.setAsCurrentCell();
        currentScaleTypeCell = tc;
      }
    }
  }

  // RETGION: Render Overlay
  void render() {

    update();

    legend.display();

    int idx = 0;

    idx = renderTuningOptions(idx);
    idx = renderChordOptions(idx);
    idx = renderScaleOptions(idx);

    renderNutNotes();
    renderFretNotes();

    PVector mouse = new PVector(mouseX, mouseY);
    for (TextCell tc : textCells.cells) {

      tc.show();

      checkTextBoundaries(tc, mouse);
    }
  }

  void update() {

    tuning = (Tuning) config.getObject("TUNING_OBJ");
    pattern = (Pattern) config.getObject("PATTERN");
    neck = (Neck) config.getObject("NECK");
    nut = (Nut) config.getObject("NUT");
    frets = (Frets) config.getObject("FRETS");
    strings = (GStrings) config.getObject("STRINGS");
    scale = (Scale) config.getObject("SCALE");
    chord = (Chord) config.getObject("CHORD");
  }

  int renderTuningOptions(int idx) {

    PVector mouse = new PVector(mouseX, mouseY);
    fill(0);
    ellipse(mouse.x, mouse.y, 8, 8);

    String option = "";

    float x, y, dist;
    dist = 15;

    //x = (3*width)/4;
    x = 10;
    y = dist + 2*(idx*dist);

    // REGION: tuning options
    option = "TUNING OPTIONS";
    text(option + ":", x, y);
    idx++;
    Tuning ts = new Tuning();
    ts.setTuning(tuning.getTuning());
    //idx += tuning.tunings.size();
    for (String t : ts.tunings) {
      idx++;
    }
    //END REGION: tuning options
    return idx;
  }

  int setupTuningOptions(int idx) {

    PVector mouse = new PVector(mouseX, mouseY);
    fill(0);
    ellipse(mouse.x, mouse.y, 8, 8);

    String option = "";

    float x, y, h, dist, sep;
    dist = 15;
    sep = 100.0;
    h = 13;

    x = 10;
    y = dist + 2*(idx*dist);

    //x = (3*width)/4;
    //y = dist + 2*(idx*dist);

    // REGION: tuning options
    option = "TUNING OPTIONS";
    text(option + ":", x, y);
    idx++;
    Tuning ts = new Tuning();
    ts.setTuning(tuning.getTuning());
    for (String t : ts.tunings) {

      y = dist + 2*(idx*dist);
      text(t, x, y);
      TextCell tc = new TextCell(x, y, t, -h, option, sep);
      textCells.addCell(tc);
      idx++;
    }
    //END REGION: tuning options

    return idx;
  }

  int renderChordOptions(int idx) {

    PVector mouse = new PVector(mouseX, mouseY);
    fill(0);
    ellipse(mouse.x, mouse.y, 8, 8);

    String option = "";

    float x, y, dist;
    dist = 15;

    x = 10;
    y = dist + 2*(idx*dist);

    // REGION: chord options
    if ((boolean) config.getObject("CHORD_SWITCH") == true) {
      y = dist + 2*(idx*dist);
      option = "CHORD OPTIONS";
      if (currentChordCell != null && currentChordTypeCell.text != null) {

        text(option + ":" + " " + currentChordCell.text + " (" + currentChordTypeCell.text + ")", x, y);
      } else {

        text(option + ":", x, y);
      } 
      idx++;

      int i = 0;
      for (String str : allNotes.allNotesArray) {

        if (i % 9 == 8) {
          idx++;
        } else {

          i++;
        }
      }
    }
    // END REGION: chord options

    return idx;
  }

  int setupChordOptions(int idx) {

    PVector mouse = new PVector(mouseX, mouseY);
    fill(0);
    ellipse(mouse.x, mouse.y, 8, 8);

    String option = "";

    float x, y, h, dist, sep;
    dist = 15;
    sep = 100.0;
    h = 13;

    x = 10;
    y = dist + 2*(idx*dist);

    // REGION: chord options
    if ((boolean) config.getObject("CHORD_SWITCH") == true) {
      y = dist + 2*(idx*dist);
      option = "CHORD OPTIONS";
      text(option + ":", x, y);
      idx++;

      int i = 0;
      int startidx = idx;
      for (String str : allNotes.allNotesArray) {

        String s = str;

        float x1, y1;

        if (i % 3 == 2) {

          sep = 25.0;
          x1 = x + (i*sep);
          y1 = dist + 2*((idx)*dist);
          text(s, x1, y1);
          TextCell tc = new TextCell(x1, y1, s, -h, option, sep);
          textCells.addCell(tc);
          i=0;
          idx++;
        } else {

          sep = 25.0;
          x1 = x + (i*sep); 
          y1 = dist + 2*((idx)*dist);
          text(s, x1, y1);
          TextCell tc = new TextCell(x1, y1, s, -h, option, sep);
          textCells.addCell(tc);
          i++;
        }
      }

      for (String str : chords.getTypes()) {
        String s = str;

        float x1, y1;
        float delta = 100.0;

        sep = 50.0;
        x1 = x + delta + (i*sep);
        //y1 = dist + 2*((idx)*dist);
        y1 = dist + 2*((startidx)*dist);
        text(s, x1, y1);
        TextCell tc = new TextCell(x1, y1, s, -h, option, sep);
        textCells.addCell(tc);
        i=0;
        startidx++;
      }
    }
    // END REGION: chord options
    return idx;
  }

  int renderScaleOptions(int idx) {

    PVector mouse = new PVector(mouseX, mouseY);
    fill(0);
    ellipse(mouse.x, mouse.y, 8, 8);

    String option = "";

    float x, y, dist;
    dist = 15;

    x = 10;
    y = dist + 2*(idx*dist);

    // REGION: scale options
    if ((boolean) config.getObject("SCALE_SWITCH") == true) {

      y = dist + 2*(idx*dist);

      //print(y, idx, "\n");
      option = "SCALE OPTIONS";
      if (currentScaleCell != null && currentScaleTypeCell.text != null) {

        text(option + ":" + " " + currentScaleCell.text + " (" + currentScaleTypeCell.text + ")", x, y);
      } else {

        text(option + ":", x, y);
      } 
      idx++;

      int i = 0;
      for (String str : allNotes.allNotesArray) {

        if (i % 3 == 2) {

          i=0;
          idx++;
        } else {

          i++;
        }
      }

      for (String s : (ArrayList<String>)config.getObject("PATTERN_TYPES")) {

        idx++;
      }
    }
    // END REGION: scale options

    return idx;
  }

  int setupScaleOptions(int idx) {

    PVector mouse = new PVector(mouseX, mouseY);
    fill(0);
    ellipse(mouse.x, mouse.y, 8, 8);

    String option = "";

    float x, y, h, dist, sep;
    dist = 15;
    sep = 100.0;
    h = 13;

    x = 10;
    y = dist + 2*(idx*dist);

    // REGION: scale options
    if ((boolean) config.getObject("SCALE_SWITCH") == true) {

      y = dist + 2*(idx*dist);

      option = "SCALE OPTIONS";
      text(option + ":", x, y);
      idx++;

      int i = 0;
      int startidx = idx;
      for (String str : allNotes.allNotesArray) {

        String s = str;

        float x1, y1;

        if (i % 3 == 2) {

          sep = 25.0;
          x1 = x + (i*sep);
          y1 = dist + 2*((idx)*dist);
          text(s, x1, y1);
          TextCell tc = new TextCell(x1, y1, s, -h, option, sep);
          textCells.addCell(tc);
          i=0;
          idx++;
        } else {

          sep = 25.0;
          x1 = x + (i*sep); 
          y1 = dist + 2*((idx)*dist);
          text(s, x1, y1);
          TextCell tc = new TextCell(x1, y1, s, -h, option, sep);
          textCells.addCell(tc);
          i++;
        }
      }

      i = 0;
      for (String s : (ArrayList<String>)config.getObject("PATTERN_TYPES")) {

        float delta, x1;
        delta = 100.0;
        sep = 200.0;
        //x1 = x + delta;

        if (i % 2 == 1) {

          x1 = x + delta + (i*sep);
          y = dist + 2*((startidx)*dist);
          text(s, x1, y);
          sep = 100.0;
          TextCell tc = new TextCell(x1, y, s, -h, option, sep);
          textCells.addCell(tc);
          i=0;
          startidx++;
        } else { 

          x1 = x + delta + (i*sep);
          y = dist + 2*((startidx)*dist);
          text(s, x1, y);
          sep = 100.0;
          TextCell tc = new TextCell(x1, y, s, -h, option, sep);
          textCells.addCell(tc);
          idx++;
          i++;
        }
      }
    }
    // END REGION: scale options

    return idx;
  }

  void renderNutNotes() {

    // REGION: nut notes
    if (scale != null && chord != null) {

      nut.highlightScaleChord(scale, chord, (float[]) config.getObject("SCALE_CHORD_COLOUR"));
      scale.highlightNotes();
      chord.highlightNotes();
    } else if (scale != null || chord != null) {

      if (scale != null) {

        nut.highlightScale(scale, (float[]) config.getObject("SCALE_COLOUR"));
        scale.highlightNotes();
      }
      if (chord != null) {

        nut.highlightChord(chord, (float[]) config.getObject("CHORD_COLOUR"));
        chord.highlightNotes();
      }
    }
    nut.showNotes();
    // END REGION: nut notes
  }

  void renderFretNotes() {

    // REGION: fret notes
    for (Fret f : frets.frets) {
      if (scale != null && chord != null) {

        f.highlightScaleChord(scale, chord, (float[]) config.getObject("SCALE_CHORD_COLOUR"));
      } else if (scale != null || chord != null) {

        if (scale != null) {

          f.highlightScale(scale, (float[]) config.getObject("SCALE_COLOUR"));
        }
        if (chord != null) {

          f.highlightChord(chord, (float[]) config.getObject("CHORD_COLOUR"));
        }
      }
      f.showNotes();
    }
    // END REGION: fret notes
  }
  // END REGION: render

  // REGION: Boundaries
  boolean checkTextBoundaries(TextCell tc, PVector mouse) {

    boolean hit = false;

    float w, h;
    w = tc.sep;
    h = 13;

    float x1, y1, x2, y2;
    x1 = tc.x;
    y1 = tc.y;
    x2 = w;
    y2 = -h;

    Note currentRoot;
    if ((Scale) config.getObject("SCALE") != null) {

      currentRoot = ((Scale) config.getObject("SCALE")).getRoot();
    } else {

      currentRoot = new Note("A");
      currentRoot.setId(1);
    }

    ArrayList<String> tuningArr = ((Tuning) config.getObject("TUNING_OBJ")).tunings;
    HashMap<String, NoteSet> chordMap = ((HashMap) config.getObject("ALL_CHORDS"));

    if (mouse.x > x1 && mouse.x < (x1 + x2) && mouse.y < y1 && mouse.y > (y1 + y2)) {

      hit = true;
    }

    if (hit) {

      if (!tc.checked) {

        if (tc.option.equals("TUNING OPTIONS")) {

          if (tuningArr.contains(tc.text)) {

            if (mousePressed) {
              tuning.setTuning(tc.text);
              config.setObject("TUNING_OBJ", tuning);
              config.setObject("TUNING", tuning.getTuning());

              tuning.setTuning(tuning.getTuning());
              frets.update(tuning);
              config.setObject("FRETS", frets);
              nut.update(tuning);
              config.setObject("NUT", nut);

              tc.checked = true;
              tc.tuningCell = true;
              tc.setAsCurrentCell();

              if (currentTuningCell != null && currentTuningCell.currentCell) {

                textCells.getCell(currentTuningCell.getId()).currentCell = false;
                textCells.getCell(currentTuningCell.getId()).checked = false;
                currentTuningCell = tc;
              } else if (currentTuningCell == null) {

                currentTuningCell = tc;
              }
            }
          }
        } else if (tc.option.equals("CHORD OPTIONS")) {

          Chord currentChord = (Chord) config.getObject("CHORD");

          if (chordMap.keySet().contains(tc.text)) {

            if (mousePressed) {

              NoteSet ns = chordMap.get(tc.text);
              Chord c = new Chord();
              c.changeName(tc.text);
              c.addNotes(ns);

              if (currentChord != null) {

                c.setType(currentChord.getType());
              } else {

                c.setType(((Pattern) config.getObject("PATTERN")).naturalMajor);
              }

              c.build();
              config.setObject("CHORD", c);

              currentChord = c;

              tc.checked = true;
              tc.chordCell = true;
              tc.setAsCurrentCell();

              if (currentChordCell != null && currentChordCell.currentCell) {

                textCells.getCell(currentChordCell.getId()).currentCell = false;
                textCells.getCell(currentChordCell.getId()).checked = false;
                currentChordCell = tc;
              } else if (currentChordCell == null) {

                currentChordCell = tc;
              }
            }
          } else if (chords.getTypes().contains(tc.text)) {

            if (mousePressed) {

              Chord c = new Chord();
              if (chord != null) {

                chord.changeName(currentRoot.name());
                chord.setType(tc.text);
                chord.build();
                chord.setNotes(chords.getChordNotes(chord.name()));

                config.setObject("CHORD", chord);
                currentChord = chord;
              } else {
                c.changeName(currentRoot.name());
                c.setType(tc.text);
                c.build();
                c.setNotes(chords.getChordNotes(c.name()));

                config.setObject("CHORD", c);
                currentChord = c;
              }

              print(tc.text, "\n");
              tc.checked = true;
              tc.chordTypeCell = true;
              tc.setAsCurrentCell();

              if (currentChordTypeCell != null) {

                textCells.getCell(currentChordTypeCell.getId()).currentCell = false;
                textCells.getCell(currentChordTypeCell.getId()).checked = false;
                currentChordTypeCell = tc;
              } else if (currentChordTypeCell == null) {

                currentChordTypeCell = tc;
              }

              if (tc.text.equals(config.getObject("NONE").toString())) {

                config.setObject("CHORD", null);

                currentChordCell.setCurrentCell(false);
                currentChordCell.checked = false;
                currentChordTypeCell.setCurrentCell(false);
                currentChordTypeCell.checked = false;
                currentChord = null;
                currentChordCell = null;

                for (TextCell tc1 : textCells.cells) {

                  if (tc1.option.equals("CHORD OPTIONS") && tc1.text.equals(((Pattern) config.getObject("PATTERN")).naturalMajor)) {

                    tc1.setAsCurrentCell();
                    tc1.checked = true;
                    currentChordTypeCell = tc1;
                  }
                }
                //}
              }
            }
          }
        } else if (tc.option.equals("SCALE OPTIONS")) {

          Scale currentScale = (Scale) config.getObject("SCALE");

          if (chordMap.keySet().contains(tc.text)) {

            if (mousePressed) {

              Scale sc;
              sc = new Scale();
              if (scale == null) {

                sc.setPatternType(pattern.naturalMajor);
              } else {

                sc.setPatternType(scale.getType());
              }
              sc.setRoot(tc.text);

              sc.build();
              config.setObject("SCALE", sc);

              tc.checked = true;
              tc.scaleCell = true;
              tc.setAsCurrentCell();

              if (currentScaleCell != null && currentScaleCell.currentCell) {

                textCells.getCell(currentScaleCell.getId()).currentCell = false;
                textCells.getCell(currentScaleCell.getId()).checked = false;
                currentScaleCell = tc;
                currentScaleCell.setAsCurrentCell();
                currentScaleCell.checked = false;
              } else {//if (currentScaleCell == null) {

                currentScaleCell = tc;
                currentScaleCell.setAsCurrentCell();
                currentScaleCell.checked = false;
              }
            }
          } else if (pattern.patternTypes.contains(tc.text)) {

            if (mousePressed) {

              Scale sc = new Scale();

              if (scale != null) {
                scale.setPatternType(tc.text);
                scale.setRoot(currentRoot.name());
                scale.build();
                config.setObject("SCALE", scale);
              } else {
                sc.setPatternType(tc.text);
                sc.setRoot(currentRoot.name());
                sc.build();
                config.setObject("SCALE", sc);
              }

              tc.scaleTypeCell = true;
              tc.checked = true;
              tc.setAsCurrentCell();

              if (currentScaleTypeCell != null) {

                textCells.getCell(currentScaleTypeCell.getId()).currentCell = false;
                textCells.getCell(currentScaleTypeCell.getId()).checked = false;
                currentScaleTypeCell = tc;
                currentScaleTypeCell.setAsCurrentCell();
                currentScaleTypeCell.checked = true;
                //} else if (currentScaleTypeCell == null) {
              } else {
                currentScaleTypeCell = tc;
                currentScaleTypeCell.setAsCurrentCell();
                currentScaleTypeCell.checked = true;
              }

              if (currentScaleTypeCell != null && tc.text.equals(config.getObject("NONE").toString())) {

                config.setObject("SCALE", null);
                if (currentScaleCell != null) {
                  currentScaleCell.setCurrentCell(false);
                  currentScaleCell.checked = false;
                }
                currentScaleTypeCell.setCurrentCell(false);
                currentScaleTypeCell.checked = false;

                currentScale = null;
                currentScaleCell = null;

                for (TextCell tc1 : textCells.cells) {

                  if (tc1.option.equals("SCALE OPTIONS") && tc1.text.equals(((Pattern) config.getObject("PATTERN")).naturalMajor)) {

                    tc1.setAsCurrentCell();
                    tc1.checked = true;
                    currentScaleTypeCell = tc1;
                    currentScaleTypeCell.setAsCurrentCell();
                    currentScaleTypeCell.checked = true;
                  }
                }
              }
            }
          }
        }
      }
    }

    return hit;
  }
  // END REGION: Boundaries

  void setChord(Chord c) {

    chord = c;
  }

  void setNotes(NoteSet n) {

    notes = n;
  }

  void setScale(Scale s) {

    scale = s;
  }
}
