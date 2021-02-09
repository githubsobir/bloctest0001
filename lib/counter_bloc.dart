import 'dart:async';

class CounterBloc{

  final _eventController = StreamController<CounterEvent>();
  Stream<CounterEvent> get eventStream => _eventController.stream;
  Sink<CounterEvent> get eventSink => _eventController.sink;

  final _countController = StreamController<int>();

  Stream<int> get countStream => _countController.stream;
  Sink<int> get counterSink => _countController.sink;
  int _counter = 0;

  CounterBloc(){
    eventStream.listen((CounterEvent event) {
      if(event == CounterEvent.Increment){
       ++_counter;
       counterSink.add(_counter);
      }
    });
  }

  void dispose(){
    _eventController.close();
    _countController.close();
  }
}
enum CounterEvent{
  Increment,
}