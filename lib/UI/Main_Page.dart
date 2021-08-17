import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterplugin/UI/Change_Pange.dart';
import 'package:flutterplugin/bloc/color_bloc.dart';
import 'package:flutterplugin/bloc/counter_bloc.dart';

import 'Firebase.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    // CounterBloc cbloc = BlocProvider.of<CounterBloc>(context);

    return BlocBuilder<ColorBloc, ColorState>(
      builder: (context, stateColorMain) {
        return Scaffold(
          appBar: AppBar(
            title: new Text("Multi-Bloc, FireBase"),
            backgroundColor: (stateColorMain is ColorPicker)
                ? stateColorMain.color
                : Colors.red[700],
          ),
          body: Center(
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                new BlocBuilder<CounterBloc, CounterState>(
                  builder: (context, stateNumMain) {
                    return Text(
                      (stateNumMain is CounterValue)
                          ? stateNumMain.value.toString()
                          : "-",
                      style: new TextStyle(
                          fontSize: 30.0, fontWeight: FontWeight.w600),
                    );
                  },
                ),
                new SizedBox(
                  height: 20.0,
                ),
                new ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.white, shadowColor: Colors.black),
                  onPressed: () {
                    Navigator.of(context).push(
                        new MaterialPageRoute(builder: (BuildContext context) {
                      return ChangePage();
                    }));
                  },
                  child: new Text(
                    "Bloc",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 17.0),
                  ),
                ),

                new SizedBox(
                  height: 20.0,
                ),
                new ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.white, shadowColor: Colors.black),
                  onPressed: () {
                    Navigator.of(context).push(
                        new MaterialPageRoute(builder: (BuildContext context) {
                      return FireBase();
                    }));
                  },
                  child: new Text(
                    "Firebase",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 17.0),
                  ),
                )

                // new Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     new FloatingActionButton(
                //       onPressed: () {
                //         cbloc.add(Decreament());
                //       },
                //       child: Icon(Icons.arrow_downward),
                //     ),
                //     new SizedBox(
                //       width: 27.0,
                //     ),
                //     new FloatingActionButton(
                //       onPressed: () {
                //         cbloc.add(Increament());
                //       },
                //       child: Icon(Icons.arrow_upward),
                //     )
                //   ],
                // )
              ],
            ),
          ),
        );
      },
    );
  }
}
