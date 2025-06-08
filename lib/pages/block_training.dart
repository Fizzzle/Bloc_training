import 'package:bloc_training/bloc/color_bloc.dart';
import 'package:flutter/material.dart';

class Bloc_Training extends StatefulWidget {
  const Bloc_Training({super.key});

  @override
  State<Bloc_Training> createState() => _Bloc_TrainingState();
}

class _Bloc_TrainingState extends State<Bloc_Training> {
  ColorBloc _bloc = ColorBloc();

  @override
  void dispose() {
    // TODO: implement dispose
    _bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bloc With Stream'),
      ),
      body: Center(child: StreamBuilder(
        
        stream: _bloc.outputStateStream,
        initialData: Colors.redAccent,
        builder: (context,  snapshot) { 
          return AnimatedContainer(
          height: 100,
          width: 100,
          color: snapshot.data,
          duration: Duration(milliseconds: 500),);
         },
        
      ),
    
    ),
    floatingActionButton: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
      FloatingActionButton(onPressed: (){
        _bloc.inputEventSink.add(ColorEvent.event_red);
      },
       backgroundColor: Colors.redAccent, 
       ),
      FloatingActionButton(onPressed: () {
        _bloc.inputEventSink.add(ColorEvent.event_green);
      }, backgroundColor: Colors.greenAccent,),
    ],),
    );
  }
}