import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddDataScreen extends StatefulWidget {
  const AddDataScreen({super.key});

  @override
  State<AddDataScreen> createState() => _AddDataScreenState();
}

class _AddDataScreenState extends State<AddDataScreen> {
  var icon = Icons.add;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          StatefulBuilder(
            builder: (c, myState) => IconButton(
                onPressed: () {
                  myState(() {
                    icon = Icons.ac_unit;
                  });
                },
                icon: Icon(icon)),
          ),
          Text("djhsd"),
          IconButton(
              onPressed: () {
                setState(() {
                  icon = Icons.ac_unit;
                });
              },
              icon: Icon(icon)),


          FutureProvider(
            create: (_) => showMyName(),
            initialData: "Loading",
            child: Consumer<String>(builder: (_, data, __) {
              return Text(data);
            }),
          ),
          StreamProvider(
            create: (_) => startCounter(),
            initialData: 0,
            child: Consumer<int>(builder: (_, data, __) {
              return Text(data.toString());
            }),
          ),
        ],
      ),
    );
  }

  Future<String> showMyName() async {
    await Future.delayed(Duration(seconds: 10));
    return "After 5 second";
  }

  Stream<int> startCounter() async* {
    // var timer = Timer.periodic(Duration(seconds: 1), (timer) {});
    // yield timer.tick;

    for (var i = 0; i <= 100; i++) {
      await Future.delayed(Duration(seconds: 1));
      yield i;
    }
  }
}
