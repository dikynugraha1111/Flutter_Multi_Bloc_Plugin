import 'dart:isolate';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class IsolatePage extends StatefulWidget {
  const IsolatePage({Key? key}) : super(key: key);

  @override
  _IsolatePageState createState() => _IsolatePageState();
}

//todo function isolate tanpa nilai kembalian dengan parameter
void heavyProcess(int numb) {
  for (int counter = 0; counter < numb; counter++) {
    //todo something here
  }
  print("Task Done");
}

//todo function isolate tanpa nilai kembalian tanpa parameter
void heavyProcessWithoutParams(_) {
  for (int counter = 0; counter < 1000000000; counter++) {
    //todo something here
  }
  print("Task Done");
}

//todo function isolate dengan nilai kembalian dan dengan parameter
String heavyProcessWithCallbackParams(int number) {
  int result = 0;
  for (int counter = 0; counter < number; counter++) {
    result += counter;
  }

  return result.toString();
}

class _IsolatePageState extends State<IsolatePage> {
  int number = 0;
  String result = "No Result";
  bool isClick = false;

  @override
  void initState() {
    super.initState();
    //todo Isolate dengan parameter dan tanpa nilai kembalian
    // Isolate.spawn<int>(heavyProcess, 1000000000);
    //todo Isolate tanpa parameter dan tanpa nilai kembalian
    Isolate.spawn(heavyProcessWithoutParams, null);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Isolate Flutter"),
      ),
      body: Center(
        child: new Container(
          child: new Column(
            children: [
              new Text(
                number.toString(),
                style: new TextStyle(fontSize: 21, fontWeight: FontWeight.w600),
              ),
              new SizedBox(
                height: 10.0,
              ),
              new ElevatedButton(
                  onPressed: () {
                    setState(() {
                      number++;
                    });
                  },
                  style: ElevatedButton.styleFrom(minimumSize: Size(200, 50)),
                  child: new Text("Increment")),
              new SizedBox(
                height: 10.0,
              ),
              new Text(
                "Result:\n $result",
                style: new TextStyle(fontSize: 21, fontWeight: FontWeight.w600),
              ),
              new SizedBox(
                height: 10.0,
              ),
              new ElevatedButton(
                  onPressed: isClick
                      ? null
                      : () async {
                          setState(() {
                            isClick = !isClick;
                          });

                          //todo Isolate dengan Nilai kembalian dan params, di Klik akan jalan.
                          result = await compute<int, String>(
                              heavyProcessWithCallbackParams, 1000000000);

                          setState(() {
                            isClick = !isClick;
                          });
                        },
                  style: ElevatedButton.styleFrom(minimumSize: Size(200, 50)),
                  child: new Text("Increment")),
            ],
          ),
        ),
      ),
    );
  }
}
