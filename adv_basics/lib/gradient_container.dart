import 'package:flutter/material.dart';

class GradientContainer extends StatelessWidget {
  final List<Color> colors1;
  //final List<Color> colors2;

  const GradientContainer(this.colors1, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: colors1,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        //crossAxisAlignment: CrossAxisAlignment.center,
        //  crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Hello World',
            style: TextStyle(
              color: Colors.white,
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Action when button is pressed
            },
            child: const Text('Press Me'),
          ),
        ],
      ),
    );
  }
}
