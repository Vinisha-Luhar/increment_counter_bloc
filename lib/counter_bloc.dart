
import 'dart:async';

enum CounterEvent{
  increment,
  decrement,
  reset
}

class CounterBloc
{
  int counter = 0;

  final _stateStreamController = StreamController<int>();
  StreamSink<int> get counterSink => _stateStreamController.sink;
  Stream<int> get counterStream => _stateStreamController.stream;

  final _eventStreamController = StreamController<CounterEvent>();
  StreamSink<CounterEvent> get eventSink => _eventStreamController.sink;
  Stream<CounterEvent> get eventStream => _eventStreamController.stream;

  CounterBloc()
  {
    eventStream.listen((event) {
      if(event == CounterEvent.increment)
        {
          counter++;
        }
      else if (event == CounterEvent.decrement)
        {
          counter--;
        }
      else if(event == CounterEvent.reset)
        {
          counter = 0;
        }
      counterSink.add(counter);
    });
  }


}