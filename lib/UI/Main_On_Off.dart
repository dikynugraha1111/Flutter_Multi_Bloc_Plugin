import 'package:flutter/material.dart';
import 'package:flutterplugin/UI/On_Off_Widget.dart';

class MainOnOff extends StatefulWidget {
  const MainOnOff({Key? key}) : super(key: key);

  @override
  _MainOnOffState createState() => _MainOnOffState();
}

class _MainOnOffState extends State<MainOnOff> {
  OnOffButton onOffButton = new OnOffButton(isOn: true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("On Off Widget"),
      ),
      body: Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            new Text(onOffButton.isOn ? "ON" : "OFF"),
            new SizedBox(
              height: 20.0,
            ),
            new OnOffWidget1(
              onOffButton: onOffButton,
              onStateChange: () {
                setState(() {});
              },
            )
          ],
        ),
      ),
    );
  }
}
