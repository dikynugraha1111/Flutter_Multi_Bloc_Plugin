import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterplugin/bloc/color_bloc.dart';
import 'package:flutterplugin/bloc/counter_bloc.dart';

class ChangePage extends StatelessWidget {
  const ChangePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CounterBloc cblocCounter = BlocProvider.of<CounterBloc>(context);
    ColorBloc cblocColor = BlocProvider.of<ColorBloc>(context);
    return BlocBuilder<ColorBloc, ColorState>(
      builder: (context, stateColor) {
        return Scaffold(
          appBar: AppBar(
            title: new Text("Setting"),
            backgroundColor:
                (stateColor is ColorPicker) ? stateColor.color : Colors.green,
          ),
          body: new Center(
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                new BlocBuilder<CounterBloc, CounterState>(
                  builder: (context, stateNum) {
                    return GestureDetector(
                      onTap: () {
                        context.read<CounterBloc>().add(Increament(1));
                        //cblocCounter.add(Increament(1));
                      },
                      child: Text(
                        (stateNum is CounterValue)
                            ? stateNum.value.toString()
                            : "-",
                        style: new TextStyle(
                            fontSize: 30.0, fontWeight: FontWeight.w600),
                      ),
                    );
                  },
                ),
                new SizedBox(
                  height: 10.0,
                ),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    new ElevatedButton(
                      onPressed: () {
                        context.read<ColorBloc>().add(ToAmber());
                        // cblocColor.add(ToAmber());
                      },
                      child: new Text(""),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.amber,
                        shape: CircleBorder(),
                      ),
                    ),
                    new ElevatedButton(
                      onPressed: () {
                        context.read<ColorBloc>().add(ToBlue());
                        // cblocColor.add(ToBlue());
                      },
                      child: new Text(""),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blueAccent,
                        shape: CircleBorder(),
                      ),
                    ),
                    new ElevatedButton(
                      onPressed: () {
                        context.read<ColorBloc>().add(ToRed());
                        // cblocColor.add(ToRed());
                      },
                      child: new Text(""),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.redAccent,
                        shape: CircleBorder(),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
