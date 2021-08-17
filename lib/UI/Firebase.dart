import 'package:flutter/material.dart';

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
    return Scaffold(
      appBar: new AppBar(
        title: new Text("FireBase"),
      ),
      body: new Stack(
        children: [
          ListView(children: []),
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
                            //controller: nameController,
                            decoration: InputDecoration(hintText: "Name"),
                          ),
                          TextField(
                            //controller: ageController,
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
                          onPressed: () {},
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