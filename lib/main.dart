import 'package:connectivity/connectivity.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterplugin/bloc/color_bloc.dart';
import 'package:flutterplugin/bloc/counter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'UI/Main_Page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<CounterBloc>(
            create: (context) => CounterBloc(),
          ),
          BlocProvider<ColorBloc>(
            create: (context) => ColorBloc(),
          ),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: StreamBuilder<ConnectivityResult>(
              stream: Connectivity().onConnectivityChanged,
              builder: (_, connect) {
                if (connect.data == ConnectivityResult.wifi ||
                    connect.data == ConnectivityResult.mobile) {
                  return MainPage();
                } else {
                  return CheckConnection();
                }
              }),
        ));
  }
}

class CheckConnection extends StatelessWidget {
  const CheckConnection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Problem Connection"),
        backgroundColor: Colors.red[700],
      ),
      body: Center(
        child: new Icon(MdiIcons.checkNetwork),
      ),
    );
  }
}

//! vscode://vscode.github-authentication/did-authenticate?windowid=1&code=e6084e48c0f71ebc452f&state=abb2d430-5c7e-43eb-86c3-c70284d76413 