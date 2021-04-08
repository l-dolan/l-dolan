class Config {

  HashMap<String, Object> variables;

  Config() {

    variables = new HashMap();
  }

  void addObject(String k, Object obj) {

    variables.put(k, obj);
  }

  Object getObject(String k) {

    return variables.get(k);
  }

  void setObject(String k, Object obj) {

    variables.put(k, obj);
  }

  void printAllKeyValues() {

    for (String s : variables.keySet()) {
      print(s, variables.get(s), "\n");
    }
  }
}
