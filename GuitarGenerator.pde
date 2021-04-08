Guitar guitar;
Config config;
Overlay overlay;

void setup() {

  size(1080, 720);

  config = new Config();

  float x, y;
  x = width/2;
  y = (3*height)/4 + height/20;

  setupConfig(config);
  //config.printAllKeyValues();

  guitar = new Guitar();
  guitar.setTuning(config.getObject("TUNING").toString());

  guitar.setPos(x, y);
  print("  Setting Guitar position, x:" + x + " y:" + y, "\n");

  guitar.setLen(Float.parseFloat(config.getObject("NECK_LENGTH").toString()));
  print("  Setting Guitar length: " + Float.parseFloat(config.getObject("NECK_LENGTH").toString()), "\n");


  guitar.setNeckHeight(Float.parseFloat(config.getObject("NECK_HEIGHT").toString()));
  print("  Setting Neck Height:", Float.parseFloat(config.getObject("NECK_HEIGHT").toString()), "\n");

  guitar.setFrets(Integer.parseInt(config.getObject("NO_FRETS").toString()));
  print("  Setting frets:", Integer.parseInt(config.getObject("NO_FRETS").toString()), "\n");

  guitar.setNoStrings(Integer.parseInt(config.getObject("NO_STRINGS").toString()));

  print("\nBuilding Guitar...", "\n");
  guitar.build();

  overlay = new Overlay();
  overlay.build();
}

void draw() {

  background(255);

  guitar.render();

  overlay.render();
}

void setupConfig(Config config) {

  print("Setting up new Guitar...", "\n");

  String tuning = "E STANDARD";
  config.addObject("TUNING", tuning);
  print("  Setting Tuning: " + config.getObject("TUNING").toString(), "\n");

  float len = 900.0;
  config.addObject("NECK_LENGTH", len);
  print("  Setting Neck Length: " + Float.parseFloat(config.getObject("NECK_LENGTH").toString()), "\n");

  float neckheight = 200.0;
  config.addObject("NECK_HEIGHT", neckheight);
  print("  Setting Neck Height : " + Float.parseFloat(config.getObject("NECK_HEIGHT").toString()), "\n");

  int noStrings = 6;
  config.addObject("NO_STRINGS", noStrings);
  print("  Setting Number of Strings: " + Integer.parseInt(config.getObject("NO_STRINGS").toString()), "\n");

  int frets = 12;
  config.addObject("NO_FRETS", frets);
  print("  Setting Number of Frets: " + Float.parseFloat(config.getObject("NO_FRETS").toString()), "\n");

  String str = "";
  float[] neckColour = new float[3];
  neckColour[0] = 128;
  neckColour[1] = 0;
  neckColour[2] = 128;
  config.addObject("NECK_COLOUR", neckColour);
  str += config.getObject("NECK_COLOUR");
  print("  Setting Neck Colour: " + str, "\n");

  float[] nutColour = new float[3];
  nutColour[0] = 128;
  nutColour[1] = 128;
  nutColour[2] = 128;
  config.addObject("NUT_COLOUR", nutColour);
  print("  Setting Nut Colour: " + ((float[]) config.getObject("NUT_COLOUR")).toString(), "\n");

  float[] scaleColour = new float[3];
  scaleColour[0] = 128;
  scaleColour[1] = 0;
  scaleColour[2] = 0;
  config.addObject("SCALE_COLOUR", scaleColour);
  print("  Setting Scale Colour: " + ((float[]) config.getObject("SCALE_COLOUR")).toString(), "\n");

  float[] chordColour = new float[3];
  chordColour[0] = 0;
  chordColour[1] = 0;
  chordColour[2] = 128;
  config.addObject("CHORD_COLOUR", chordColour);
  print("  Setting Chord Colour: " + ((float[]) config.getObject("CHORD_COLOUR")).toString(), "\n");

  float[] scaleChordColour = new float[3];
  scaleChordColour[0] = 0;
  scaleChordColour[1] = 128;
  scaleChordColour[2] = 0;
  config.addObject("SCALE_CHORD_COLOUR", scaleChordColour);
  print("  Setting Scale & Chord Colour: " + ((float[]) config.getObject("SCALE_CHORD_COLOUR")).toString(), "\n");

  config.addObject("SCALE_SWITCH", false);
  config.addObject("CHORD_SWITCH", false);

  print("  Initlalising Pattern...", "\n");
  Pattern pattern = new Pattern();
  pattern.setType("MAJOR");
  pattern.build();
  config.addObject("PATTERN", pattern);

  print("  Initlalising Scale...", "\n");
  config.addObject("SCALE_SWITCH", true);


  print("  Initlalising Chord...", "\n");
  config.addObject("CHORD_SWITCH", true);

  Chords allChords = new Chords();
  allChords.build();
  config.addObject("ALL_CHORDS", allChords.getAllChords());

  String none = "NONE";
  config.addObject("NONE", none);
}
