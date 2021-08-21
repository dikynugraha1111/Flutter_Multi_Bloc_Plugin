import 'package:flutter/material.dart';

class OnOffWidget1 extends StatefulWidget {
  const OnOffWidget1(
      {Key? key, required this.onOffButton, required this.onStateChange})
      : super(key: key);
  final OnOffButton onOffButton;
  final Function()? onStateChange;

  @override
  _OnOffWidget1State createState() => _OnOffWidget1State();
}

class _OnOffWidget1State extends State<OnOffWidget1> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          widget.onOffButton.isOn = !widget.onOffButton.isOn;
        });
        if (widget.onStateChange != null) {
          widget.onStateChange!();
        }
      },
      child: AnimatedContainer(
        duration: Duration(seconds: 1),
        width: 100,
        height: 50,
        decoration: new BoxDecoration(
            color: Colors.black, borderRadius: BorderRadius.circular(25.0)),
        child: new Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: widget.onOffButton.isOn ? Colors.blue : Colors.grey),
          margin: EdgeInsets.only(
              top: 5.0,
              bottom: 5.0,
              left: widget.onOffButton.isOn ? 55.0 : 5.0,
              right: widget.onOffButton.isOn ? 5.0 : 55.0),
        ),
      ),
    );
  }
}

class OnOffButton {
  bool isOn;
  OnOffButton({this.isOn = false});
}
