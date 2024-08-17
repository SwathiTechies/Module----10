import 'package:flutter/material.dart';


class AnimatedContainerExample extends StatefulWidget {
  @override
  _AnimatedContainerExampleState createState() => _AnimatedContainerExampleState();
}

class _AnimatedContainerExampleState extends State<AnimatedContainerExample> {
  bool _isBig = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isBig = !_isBig;
        });
      },
      child: AnimatedContainer(
        duration: Duration(seconds: 1),
        width: _isBig ? 200 : 100,
        height: _isBig ? 200 : 100,
        color: _isBig ? Colors.blue : Colors.red,
        curve: Curves.easeInOut,
      ),
    );
  }
}
