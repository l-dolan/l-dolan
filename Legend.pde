class Legend {

  boolean chordSwitch, scaleSwitch, chordScaleSwitch = false;
  String chord, scale, chordScale;
  float colour;

  Scale scaleObj;
  Chord chordObj;

  Legend() {

    colour = 255;
  }

  void display() {

    stroke(0);

    float d = 16;
    float sep = 20;
    float diff = 0;
    int on = 1;

    scaleObj = (Scale) config.getObject("SCALE");
    chordObj = (Chord) config.getObject("CHORD");
    // Display Chord/Scale
    if (scaleObj != null && chordObj != null) {
      on = 3;
      diff = (sep * on) + 125;
      fill(0, 255, 0);
      ellipse(diff, height - sep, d, d);
      text("Chord/Scale", diff + d, height - (sep - (d/2)));
      scaleSwitch = chordSwitch = true;
    }
    // Display Scale
    if (scaleObj != null) {
      if (!scaleSwitch) {
        if (on == 1) {
          on += 1;
        }
      }
      if (on > 2) {
        diff = sep*on + 50;
      } else {
        diff = sep*on;
      }
      fill(255, 0, 0);
      ellipse(diff, height - sep, d, d);
      text("Scale", diff + d, height - (sep - (d/2)));
      scaleSwitch = true;
    }
    // Display chord
    if (chordObj != null) {

      diff = sep;
      fill(0, 0, 255);
      ellipse(diff, height - sep, d, d);
      text("Chord", diff + d, height - (sep - (d/2)));
      scaleSwitch = true;
    }
  }
}
