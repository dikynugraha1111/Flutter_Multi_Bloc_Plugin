import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutterplugin/UI/Firebase.dart';

class UpdatePage extends StatefulWidget {
  const UpdatePage(
      {Key? key, required this.id, required this.name, required this.age})
      : super(key: key);
  final String id;
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
    FirebaseFirestore firestore2 = FirebaseFirestore.instance;
    CollectionReference flutterV2 = firestore2.collection("flutterV2");
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
          SizedBox(
            height: 15.0,
          ),
          new ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Colors.blueAccent,
                  onPrimary: Colors.blue,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4))),
              onPressed: () {
                flutterV2
                    .doc(widget.id)
                    .update({
                      "name": nameEditController.text,
                      "age": int.tryParse(ageEditController.text) ?? 0
                    })
                    .then((value) => Navigator.of(context).pushReplacement(
                            new MaterialPageRoute(
                                builder: (BuildContext context) {
                          return FireBase();
                        })))
                    .catchError((catchError) => print(catchError.toString()));
                //! Ini Buat Add
                // flutterV2.add({
                //   "name": nameEditController.text,
                //   "age": int.tryParse(ageEditController.text) ?? 0
                // });
                // nameEditController.text = "";
                // ageEditController.text = "";
              },
              child: new Text("Update Data"))
        ],
      ),
    );
  }
}
