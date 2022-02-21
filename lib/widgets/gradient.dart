import 'package:flutter/material.dart';

class GradientBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient:  LinearGradient(
          colors: [
            // Color.fromRGBO(215, 117, 255, 1).withOpacity(0.5),
            // Color.fromRGBO(255, 188, 117, 1).withOpacity(0.9),
            Color.fromRGBO(254, 254, 254, 1).withOpacity(0.5),
            Colors.grey.withOpacity(0.25),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: const [0, 1],
        ),
      ),
    );
  }
}
