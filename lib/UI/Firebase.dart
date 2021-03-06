import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutterplugin/UI/Item_Card.dart';
import 'package:flutterplugin/UI/Update_Page.dart';

class FireBase extends StatefulWidget {
  const FireBase({Key? key}) : super(key: key);

  @override
  _FireBaseState createState() => _FireBaseState();
}

class _FireBaseState extends State<FireBase> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference flutterV2 = firestore.collection("flutterV2");

    return Scaffold(
      appBar: new AppBar(
        title: new Text("FireBase"),
      ),
      body: new Stack(
        children: [
          ListView(children: [
            //! Menggunakan 1x Request Data
            // FutureBuilder<QuerySnapshot>(
            //     future: flutterV2.get(),
            //     builder: (_, snap) {
            //       if (snap.hasData) {
            //         return Column(
            //           children:
            //               snap.data!.docs.map((DocumentSnapshot document) {
            //             Map<String, dynamic> data2 =
            //                 document.data()! as Map<String, dynamic>;
            //             return ItemCard(data2["name"], data2["age"]);
            //           }).toList(),
            //         );
            //       } else {
            //         return Text("Onloading");
            //       }
            //     }),
            //! Sync data
            StreamBuilder<QuerySnapshot>(
                stream: flutterV2.snapshots(),
                builder: (_, snap) {
                  if (snap.hasData) {
                    return Column(
                      children:
                          snap.data!.docs.map((DocumentSnapshot document) {
                        Map<String, dynamic> data2 =
                            document.data()! as Map<String, dynamic>;
                        return ItemCard(
                          data2["name"],
                          data2["age"],
                          onUpdate: () {
                            Navigator.of(context).push(new MaterialPageRoute(
                                builder: (BuildContext context) {
                              return UpdatePage(
                                  id: document.id,
                                  name: data2["name"],
                                  age: data2["age"]);
                            }));
                          },
                          onDelete: () {
                            flutterV2
                                .doc(document.id)
                                .delete()
                                .then((value) => print("Delete Successful"));
                          },
                        );
                      }).toList(),
                    );
                  } else {
                    return Text("Onloading");
                  }
                }),
          ]),
          Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(color: Colors.white, boxShadow: [
                  BoxShadow(
                      color: Colors.black12,
                      offset: Offset(-5, 0),
                      blurRadius: 15,
                      spreadRadius: 3)
                ]),
                width: double.infinity,
                height: 130,
                child: Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 160,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextField(
                            controller: nameController,
                            decoration: InputDecoration(hintText: "Name"),
                          ),
                          TextField(
                            controller: ageController,
                            decoration: InputDecoration(hintText: "Age"),
                            keyboardType: TextInputType.number,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 130,
                      width: 130,
                      padding: const EdgeInsets.fromLTRB(15, 15, 0, 15),
                      child: new ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Colors.blueAccent,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4))),
                          onPressed: () {
                            flutterV2.add({
                              "name": nameController.text,
                              "age": int.tryParse(ageController.text) ?? 0
                            });
                            nameController.text = "";
                            ageController.text = "";
                          },
                          child: new Text("Add Data")),

                      // RaisedButton(
                      //     shape: RoundedRectangleBorder(
                      //         borderRadius: BorderRadius.circular(8)),
                      //     color: Colors.blueAccent,
                      //     child: Text(
                      //       'Add Data',
                      //     ),
                      //     onPressed: () {
                      //       //// ADD DATA HERE
                      //     }),
                    )
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
