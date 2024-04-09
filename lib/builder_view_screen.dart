import 'dart:async';

import 'package:flutter/material.dart';

class BuilderViewScreen extends StatefulWidget {
  const BuilderViewScreen({super.key});

  @override
  State<BuilderViewScreen> createState() => _BuilderViewScreenState();
}

class _BuilderViewScreenState extends State<BuilderViewScreen> {

  Stream<int> countStream() async* {
    for (int i = 1; i <= 100; i++) {
      await Future.delayed(Duration(seconds: 1));
      yield i;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: StreamBuilder(stream: countStream(), builder: (BuildContext con,AsyncSnapshot<int> snap){
          return Text(snap.data.toString(),style: TextStyle(fontSize: 40),);
        }),
      ),
    );
  }
}


void main(){

  // // single subscription
  // var controller = StreamController<int>();
  // // Stream<dynamic> stream = controller.stream;
  //
  // Stream.periodic(Duration(seconds: 1),(value){
  //   controller.sink.add(value);
  // });
  //
  // Timer.periodic(Duration(seconds: 1), (timer) {
  //   controller.sink.add(timer.tick);
  //   if(timer.tick == 5){
  //     timer.cancel();
  //     // controller.close();
  //   }
  // });
  // Timer.periodic(Duration(seconds: 1), (timer) {
  //   controller.sink.add(timer.tick);
  //   if(timer.tick == 5){
  //     timer.cancel();
  //     // controller.close();
  //   }
  // });
  //
  // controller.stream.listen((event) {
  //   print("on listen $event");
  //
  // }).onError((data) {
  //   print("on done$data");
  // });
  //
  // // controller.stream.listen((event) {
  // //   print("on listen $event");
  // //
  // // }).onError((data) {
  // //   print("on done$data");
  // // });


  //broadcast

  var cast = StreamController.broadcast();
  var a = Stream;

  // var castStream = cast.stream;
  Timer.periodic(Duration(seconds: 2), (timer) {
    cast.sink.add("on 2 second ${timer.tick}");
    if(timer.tick == 10){
      cast.sink.add("close");
      timer.cancel();
    }
  });

  // Timer.periodic(Duration(seconds: 1), (timer) {
  //   cast.sink.add("on 1 second${timer.tick}");
  //   if(timer.tick == 10){
  //     cast.sink.add("close");
  //     timer.cancel();
  //   }
  // });

  // Timer.periodic(Duration(seconds: 10), (timer) {
  //   cast.sink.add(timer.tick);
  //   if(timer.tick == 100){
  //     timer.cancel();
  //   }
  // });

  cast.stream.listen((event) {
    print(event);
  });
  cast.stream.listen((event) {
    print(event);
  });
  cast.stream.listen((event) {
    print(event);
  });
  cast.stream.listen((event) {
    print(event);
  });
}


// stream controller, stream, add, listen
