class Pattern {

  ArrayList<String> patternTypes;

  String type;

  String[] pattern;

  HashMap<String, Integer> steps;

  final String naturalMajor = "MAJOR";
  final String naturalMajorPattern = "W,W,H,W,W,W,H";
  final String naturalMinor = "MINOR";
  final String naturalMinorPattern = "W,H,W,W,H,W,W";
  final String majorPentatonic = "MAJOR_PENTATONIC";
  final String majorPentatonicPattern = "W,W,WH,W,WH";
  final String minorPentatonic = "MINOR_PENTATONIC";
  final String minorPentatonicPattern = "WH,W,W,WH,W";
  final String melodicMinor = "MELODIC_MINOR";
  final String melodicMinorPattern = "W,H,W,W,W,W,H";
  final String wholeTone = "WHOLE_TONE";
  final String wholeTonePattern = "W,W,W,W,W,W";
  final String chromatic = "CHROMATIC";
  final String chromaticPattern = "H,H,H,H,H,H,H,H,H,H,H";
  final String none = "NONE";

  final int maxNoNotes = 12;
  final int noNotes = 7;
  final int pentatonicNoNotes = 5;

  final String whole = "W";
  final String half = "H";
  final String wholeHalf = "WH";
  final String wholeWhole = "WW";

  final int w = 2;
  final int h = 1;
  final int wh = 3;
  final int ww = 4;

  Pattern() {

    patternTypes = new ArrayList();
    steps = new HashMap();

    initialise();
  }

  void build() {

    //if (type == null) {
    //  type = naturalMajor;
    //}

    if (type != null) {
      if (type.equals(naturalMajor)) {

        pattern = naturalMajorPattern.split(",");
      } else if (type.equals(naturalMinor)) {

        pattern = naturalMinorPattern.split(",");
      } else if (type.equals(majorPentatonic)) {

        pattern = majorPentatonicPattern.split(",");
      } else if (type.equals(minorPentatonic)) {

        pattern = minorPentatonicPattern.split(",");
      } else if (type.equals(melodicMinor)) {

        pattern = melodicMinorPattern.split(",");
      } else if (type.equals(wholeTone)) {

        pattern = wholeTonePattern.split(",");
      } else if (type.equals(chromatic)) {

        pattern = chromaticPattern.split(",");
      }
    }
  }

  void initialise() {
    patternTypes.add(naturalMajor);
    patternTypes.add(naturalMinor);
    patternTypes.add(majorPentatonic);
    patternTypes.add(minorPentatonic);
    patternTypes.add(melodicMinor);
    patternTypes.add(wholeTone);
    patternTypes.add(chromatic);
    patternTypes.add(none);

    config.addObject("PATTERN_TYPES", patternTypes);


    steps.put(whole, w);
    steps.put(half, h);
    steps.put(wholeHalf, wh);
    steps.put(wholeWhole, ww);

    print("  Adding Steps to config...", "\n");
    config.addObject("STEPS", steps);
  }

  void setType(String type_) {

    type = type_;
  }

  String getType() {

    return type;
  }

  String[] getPattern() {

    return pattern;
  }

  int getWhole() {

    return w;
  }

  int getHalf() {

    return h;
  }

  int getWholeHalf() {

    return wh;
  }

  int getWholeWhole() {

    return ww;
  }

  int getStep(String step_) {

    return steps.get(step_);
  }
}
