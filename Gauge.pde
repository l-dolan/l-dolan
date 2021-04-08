class Gauge {

  String type;
  String weightTypes = "LIGHT,MEDIUM,HEAVY";
  String weight;
  float[] sizes; 

  Gauge() {
  }

  void setGaugeWeight(String weight_) {

    weight = weight_;
  }

  void setGauge() {

    for (String t : weightTypes.split(",")) {
      if (type == t) {
      }
    }
  }

  float getStringGauge(String stringname) {
    float i = 0;
    return i;
  }
}
