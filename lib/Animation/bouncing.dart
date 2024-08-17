import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';


class BouncingScrollExample extends StatefulWidget {
  @override
  _BouncingScrollExampleState createState() => _BouncingScrollExampleState();
}

class _BouncingScrollExampleState extends State<BouncingScrollExample> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      itemCount: 30,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text('Item $index'),
        );
      },
    );
  }
}
