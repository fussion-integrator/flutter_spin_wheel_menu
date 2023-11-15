import 'dart:math';
import 'package:flutter/material.dart';

class FlutterSpinWheelMenu extends StatefulWidget {
  final Duration rotationDuration;
  final double radius;
  final double perspective;
  final Color backgroundColor;
  final Function(int) onTap;
  final List<String> cardTitles;
  final List<String> cardDescriptions;
  final List<IconData> cardIcons;
  final int numCards;

  const FlutterSpinWheelMenu({
    Key? key,
    this.rotationDuration = const Duration(seconds: 15),
    this.radius = 50.0,
    this.perspective = 0.01,
    this.backgroundColor = const Color(0xFF252A4D),
    required this.onTap,
    required this.cardTitles,
    required this.cardDescriptions,
    required this.cardIcons,
    required this.numCards,
  }) : super(key: key);

  @override
  _FlutterSpinWheelMenuState createState() => _FlutterSpinWheelMenuState();
}

class _FlutterSpinWheelMenuState extends State<FlutterSpinWheelMenu>
    with SingleTickerProviderStateMixin {
  late AnimationController _rotationController;
  double rotation = 0.0;

  @override
  void initState() {
    super.initState();
    _rotationController = AnimationController(
      vsync: this,
      duration: widget.rotationDuration,
    )..addListener(() {
      setState(() {
        rotation = _rotationController.value * 2 * pi;
      });
    });

    _rotationController.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: (details) {
        setState(() {
          _rotationController.stop();
          rotation += details.delta.dx / 100;
        });
      },
      onPanEnd: (details) {
        _rotationController.repeat();
      },
      child: Stack(
        alignment: Alignment.center,
        children: List.generate(
          widget.numCards,
              (index) => _buildCircularPositionedWidget(index),
        ),
      ),
    );
  }

  Widget _buildCircularPositionedWidget(int index) {
    final double angle = (2 * pi / widget.numCards) * index;
    final double x = cos(angle + rotation) * widget.radius;
    final double y = sin(angle + rotation) * widget.radius;
    final double scale = 1 / (1 - y * widget.perspective);

    return Positioned(
      left: x + MediaQuery.of(context).size.width / 2 - 80,
      top: y + MediaQuery.of(context).size.height / 2 - 250,
      child: GestureDetector(
        onTap: () {
          widget.onTap(index);
        },
        child: Transform(
          transform: Matrix4.identity()
            ..setEntry(3, 2, widget.perspective)
            ..translate(x, y)
            ..scale(scale),
          child: Container(
            width: 120,
            height: 160,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: widget.backgroundColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.white,
                  child: Icon(
                    widget.cardIcons[index],
                    size: 40,
                    color: widget.backgroundColor,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  widget.cardTitles[index],
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  widget.cardDescriptions[index],
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _rotationController.dispose();
    super.dispose();
  }
}
