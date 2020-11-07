import 'package:flutter/material.dart';

class DropData extends StatefulWidget {
  @override
  _DropDataState createState() => _DropDataState();
}

class _DropDataState extends State<DropData> {
  String value = "";
  List<DropdownMenuItem<String>> menuitems = List();
  bool disabledropdown = true;

  final web = {
    "1": "PHP",
    "2": "Python",
    "3": "Node JSs",
  };

  final app = {
    "1": "Java",
    "2": "Flutter",
    "3": "React Native",
  };

  final desktop = {
    "1": "JavaFx",
    "2": "Tkinter",
    "3": "Electron",
  };

  void populateweb() {
    for (String key in web.keys) {
      menuitems.add(DropdownMenuItem<String>(
        child: Center(
          child: Text(web[key]),
        ),
        value: web[key],
      ));
    }
  }

  void populateapp() {
    for (String key in app.keys) {
      menuitems.add(DropdownMenuItem<String>(
        child: Center(
          child: Text(app[key]),
        ),
        value: app[key],
      ));
    }
  }

  void populatedesktop() {
    for (String key in desktop.keys) {
      menuitems.add(DropdownMenuItem<String>(
        child: Center(
          child: Text(desktop[key]),
        ),
        value: desktop[key],
      ));
    }
  }

  void selected(_value) {
    if (_value == "Web") {
      menuitems = [];
      populateweb();
    } else if (_value == "App") {
      menuitems = [];
      populateapp();
    } else if (_value == "Desktop") {
      menuitems = [];
      populatedesktop();
    }
    setState(() {
      if (_value != null) {
        value = null;
      }
      value = _value;
      disabledropdown = false;
    });
  }

  void secondselected(_value) {
    if (_value != null) {
      value = null;
    }
    setState(() {
      value = _value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Dropdown",
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            DropdownButton<String>(
              items: [
                DropdownMenuItem<String>(
                  value: "App",
                  child: Center(
                    child: Text("App"),
                  ),
                ),
                DropdownMenuItem<String>(
                  value: "Web",
                  child: Center(
                    child: Text("Web"),
                  ),
                ),
                DropdownMenuItem<String>(
                  value: "Desktop",
                  child: Center(
                    child: Text("Desktop"),
                  ),
                ),
              ],
              onChanged: (_value) => selected(_value),
              hint: Text("Select Your Field"),
            ),
            DropdownButton<String>(
              items: menuitems,
              onChanged:
                  disabledropdown ? null : (_value) => secondselected(_value),
              hint: Text("Select Your Technology"),
              disabledHint: Text("First Select Your Field"),
            ),
            Text(
              "$value",
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
