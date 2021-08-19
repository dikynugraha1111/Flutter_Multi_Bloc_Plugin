import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class UpdatePage extends StatefulWidget {
  const UpdatePage({Key? key, this.id, required this.name, required this.age})
      : super(key: key);
  final id;
  final String name;
  final int age;

  @override
  _UpdatePageState createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  TextEditingController nameEditController = TextEditingController();
  TextEditingController ageEditController = TextEditingController();

  @override
  void initState() {
    nameEditController = new TextEditingController(text: widget.name);
    ageEditController = new TextEditingController(text: widget.age.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("UPDATE DATA"),
      ),
      body: new ListView(
        scrollDirection: Axis.vertical,
        children: [
          TextField(
            controller: nameEditController,
            decoration: InputDecoration(
              hintText: "Name",
            ),
          ),
          TextField(
            controller: ageEditController,
            decoration: InputDecoration(hintText: "Age"),
            keyboardType: TextInputType.number,
          ),
        ],
      ),
    );
  }
}
