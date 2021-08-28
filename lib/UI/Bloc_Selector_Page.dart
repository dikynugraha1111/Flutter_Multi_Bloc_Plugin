import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterplugin/bloc/user_bloc.dart';

class BlockWithSelector extends StatelessWidget {
  // const BlockWithSelector({Key? key}) : super(key: key);

  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: BlocSelector<UserBloc, UserState, String>(
            selector: (state) => state.user.name,
            builder: (context, nameChange) {
              print("App Bar REFRESH");
              return Text("Hallo $nameChange");
            }),
        // title: new Text("Hallo "),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<UserBloc, UserState>(builder: (context, stateBody) {
              return new Text(
                  "Hello ${stateBody.user.name} and your Age is ${stateBody.user.age}");
            }),
            SizedBox(
              height: 10.0,
            ),
            ElevatedButton(
                onPressed: () {
                  context.read<UserBloc>().add(ChangeAge());
                },
                style: ElevatedButton.styleFrom(primary: Colors.red),
                child: new Text("Increament Age")),
            SizedBox(
              height: 20.0,
            ),
            Container(
              width: 250.0,
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                    hintText: "Type your Name",
                    fillColor: Colors.red[100],
                    filled: true,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0))),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.red),
                onPressed: () {
                  context.read<UserBloc>().add(ChangeName(controller.text));
                },
                child: new Text('Change Name'))
          ],
        ),
      ),
    );
  }
}
