import 'dart:async';

import 'package:flutter/material.dart';

enum ColorEvent { event_red, event_green,
  
}

class ColorBloc {
  Color _color = Colors.redAccent;

  final _inputEventController = StreamController<ColorEvent>();
  StreamSink<ColorEvent> get inputEventSink => _inputEventController.sink;

  final _outputStateController = StreamController<Color>();
  Stream<Color> get outputStateStream => _outputStateController.stream;

  void _mapEventToState(ColorEvent event) {
    if(event == ColorEvent.event_red) _color = Colors.redAccent;
    else if (event == ColorEvent.event_green) _color = Colors.greenAccent;
    else throw Exception('где ты взял этот цвет?');

    _outputStateController.sink.add(_color);
  }

  ColorBloc(){
    _inputEventController.stream.listen(_mapEventToState);
    }


  void dispose(){
    _inputEventController.close();
    _outputStateController.close();
  }
}