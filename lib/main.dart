import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterplugin/bloc/color_bloc.dart';
import 'package:flutterplugin/bloc/counter_bloc.dart';

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
          home: MainPage(),
        ));
  }
}
