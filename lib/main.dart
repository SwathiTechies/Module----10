import 'package:flutter/material.dart';

import 'Animation/implicit.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Flutter Animation')),
        body: Center(child: AnimatedContainerExample()),
      ),
    );
  }
}
