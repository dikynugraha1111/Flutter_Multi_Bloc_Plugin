import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterplugin/bloc/user_bloc.dart';

class BlocWithSelector extends StatelessWidget {
  const BlocWithSelector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: BlocSelector<UserBloc, UserState, String>(
            selector: (state) => state.user.name,
            builder: (context, nameChange) {
              print("App Bar REFRESH");
              return new Text("Hallo $nameChange");
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
              height: 20.0,
            ),
            ElevatedButton(
                onPressed: () {
                  context.read<UserBloc>().add(ChangeAge());
                },
                style: ElevatedButton.styleFrom(primary: Colors.red),
                child: new Text("Increament Age"))
          ],
        ),
      ),
    );
  }
}
