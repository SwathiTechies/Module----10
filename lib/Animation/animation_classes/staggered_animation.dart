import 'package:flutter/material.dart';

class StaggeredAnimationExample extends StatefulWidget {
  @override
  _StaggeredAnimationExampleState createState() => _StaggeredAnimationExampleState();
}

class _StaggeredAnimationExampleState extends State<StaggeredAnimationExample> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _firstAnimation;
  late Animation<double> _secondAnimation;
  late Animation<double> _thirdAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..forward();

    _firstAnimation = Tween<double>(begin: 0.0, end: 100.0).animate(
      CurvedAnimation(parent: _controller, curve: Interval(0.0, 0.33, curve: Curves.easeIn)),
    );

    _secondAnimation = Tween<double>(begin: 0.0, end: 100.0).animate(
      CurvedAnimation(parent: _controller, curve: Interval(0.33, 0.66, curve: Curves.easeIn)),
    );

    _thirdAnimation = Tween<double>(begin: 0.0, end: 100.0).animate(
      CurvedAnimation(parent: _controller, curve: Interval(0.66, 1.0, curve: Curves.easeIn)),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Stack(
          children: <Widget>[
            Positioned(
              top: _firstAnimation.value,
              left: 50,
              child: Container(width: 100, height: 100, color: Colors.red),
            ),
            Positioned(
              top: _secondAnimation.value,
              left: 200,
              child: Container(width: 100, height: 100, color: Colors.green),
            ),
            Positioned(
              top: _thirdAnimation.value,
              left: 350,
              child: Container(width: 100, height: 100, color: Colors.blue),
            ),
          ],
        );
      },
    );
  }
}
