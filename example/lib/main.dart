import 'package:flutter/material.dart';
import 'package:flutter_spin_wheel_menu/flutter_spin_wheel_menu.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FlutterSpinWheelMenu Example'),
      ),
      body: Center(
        child: FlutterSpinWheelMenu(
          rotationDuration: Duration(seconds: 10),
          radius: 80.0,
          perspective: 0.01,
          backgroundColor: Colors.blue,
          onTap: (index) {
            // Add your logic here
          },
          cardTitles: ['Item 1', 'Item 2', 'Item 3'],
          cardDescriptions: ['Description 1', 'Description 2', 'Description 3'],
          cardIcons: [Icons.star, Icons.favorite, Icons.star_border],
          numCards: 3,
        ),
      ),
    );
  }
}
