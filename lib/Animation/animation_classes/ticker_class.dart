import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class TickerExample extends StatefulWidget {
  @override
  _TickerExampleState createState() => _TickerExampleState();
}

class _TickerExampleState extends State<TickerExample> with SingleTickerProviderStateMixin {
  late Ticker _ticker;

  @override
  void initState() {
    super.initState();
    _ticker = Ticker((elapsed) {
      // This callback is called every frame.
      print('Elapsed time: ${elapsed.inMilliseconds}ms');
    });
    _ticker.start();
  }

  @override
  void dispose() {
    _ticker.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Ticker Example')),
      body: Center(child: Text('Check the console for ticker updates.')),
    );
  }
}
