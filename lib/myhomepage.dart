import 'package:bloctest0001/counter_bloc.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
final CounterBloc _counterBloc = CounterBloc();
@override
  void dispose() {
    // TODO: implement dispose
  _counterBloc.dispose();
  super.dispose();
  }

  void _incrementCounter(){
  _counterBloc.eventSink.add(CounterEvent.Increment);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Bir Ikki"),

          StreamBuilder<int>(
            stream: _counterBloc.countStream,
            initialData: 0,
            builder: (context, snapshot){
              final counter = snapshot.data;
              return Container(
                height: 120,
                width: 125,
                color: Colors.red,
                child: Text("$counter", style: Theme.of(context).textTheme.headline1,),
              );
            },
          )
        ],
      ),),
    floatingActionButton: FloatingActionButton(
     tooltip: "Increment",
      onPressed: _incrementCounter,
      child: Icon(Icons.add),
    ),
    );

  }
}
