import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';

class SpringAnimationExample extends StatefulWidget {
  @override
  _SpringAnimationExampleState createState() => _SpringAnimationExampleState();
}

class _SpringAnimationExampleState extends State<SpringAnimationExample>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController.unbounded(vsync: this);

    final spring = SpringSimulation(
      SpringDescription(mass: 1, stiffness: 100, damping: 5),
      0, // Starting point
      300, // Ending point
      0, // Initial velocity
    );

    _controller.animateWith(spring);

    _animation = _controller.drive(Tween<double>(begin: 0, end: 300));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Container(
          width: 100,
          height: 100,
          color: Colors.blue,
          margin: EdgeInsets.only(top: _animation.value),
        );
      },
    );
  }
}
