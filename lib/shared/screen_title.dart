import 'package:flutter/material.dart';

class ScreenTitle extends StatelessWidget {
  final String text;

  ScreenTitle({required this.text});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween<double>(
        begin: 0,
        end: 1,
      ),
      duration: Duration(
        milliseconds: 1000,
      ),
      builder: (context, double val, child) {
        return Opacity(
          opacity: val,
          child: Padding(
            padding: EdgeInsets.only(
              top: val * 20,
            ),
            child: child,
          ),
        );
      },
      child: Text(
        text,
        style: TextStyle(
            fontSize: 36, color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );
  }
}
