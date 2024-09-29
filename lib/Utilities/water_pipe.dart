import 'package:flutter/material.dart';

class WaterFlowLine extends StatefulWidget {
  @override
  _WaterFlowLineState createState() => _WaterFlowLineState();
}

class _WaterFlowLineState extends State<WaterFlowLine>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3), // Duration of the flow animation
    )..repeat(); // Repeat indefinitely
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
        return Container(
          height: 20,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.black, // Base color for the line
          ),
          child: Stack(
            children: [
              Positioned(
                left: _controller.value * MediaQuery.of(context).size.width, // Move from left to right
                child: Container(
                  height: 20,
                  width: MediaQuery.of(context).size.width * 2, // Twice the width to make continuous flow
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.blue.withOpacity(0.1),
                        Colors.blue,
                        Colors.blue.withOpacity(0.5),
                        Colors.blue.withOpacity(0.1),
                      ],
                      stops: [0.0, 0.3, 0.7, 1.0],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}