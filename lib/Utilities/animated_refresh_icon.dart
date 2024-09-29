import 'package:afn_hydro_link/Utilities/data_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AnimatedRefreshIcon extends StatefulWidget {
  @override
  _AnimatedRefreshIconState createState() => _AnimatedRefreshIconState();
}

class _AnimatedRefreshIconState extends State<AnimatedRefreshIcon>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    // Initialize the animation controller
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500), // Rotation duration
      vsync: this,
    );
  }

  @override
  void dispose() {
    _controller.dispose(); // Dispose of the controller to free resources
    super.dispose();
  }

  void _rotateIcon() {
    if (_controller.isAnimating) {
      return; // Prevent multiple triggers
    }
    _controller.forward(from: 0.0); // Start animation from the beginning

    //Get the class
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, value, child) => AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform.rotate(
          angle: _controller.value * -2 * 3.14159, // Full rotation (2π radians)
          child: IconButton(
            icon: Transform.flip(flipX: true, child: Transform.rotate(angle: 180, child: Icon(Icons.refresh))),
            onPressed: () {
              _rotateIcon(); // Trigger rotation on button click

              //Get access to the class
              final incrementer = context.read<DataModel>();

              //CALL The methode
              incrementer.increment();
            },
            iconSize: 50.0,
            ),
          );
        },
      )
    );
  }
}
