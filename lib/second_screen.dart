import 'package:flutter/material.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}


  Future<int> sumStream(Stream<int> stream) async {
    var sum=0;
    await for(var value in stream) {
      sum += value;
    }
    return sum;
  }

  Future<void> main() async {
    final stream = Stream<int>.fromIterable([1,2,3,4,5]);
    final sum = await sumStream(stream);
    print('Sum: $sum');
  }

