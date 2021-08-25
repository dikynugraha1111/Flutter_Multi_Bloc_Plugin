import 'package:flutter/material.dart';

class Isolate extends StatefulWidget {
  const Isolate({Key? key}) : super(key: key);

  @override
  _IsolateState createState() => _IsolateState();
}

class _IsolateState extends State<Isolate> {
  int number = 0;
  String result = "No Result";
  bool isClick = false;

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
                  onPressed: () {},
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
                  onPressed: isClick ? null : () {},
                  style: ElevatedButton.styleFrom(minimumSize: Size(200, 50)),
                  child: new Text("Increment")),
            ],
          ),
        ),
      ),
    );
  }
}
