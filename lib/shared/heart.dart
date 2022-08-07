import 'package:flutter/material.dart';

class Heart extends StatefulWidget {
  @override
  createState() => _HeartState();
}

class _HeartState extends State<Heart> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _curve;
  late Animation _colorAnimation;
  late Animation _sizeAnimation;
  bool isFav = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 300,
      ),
    );

    _curve =
        CurvedAnimation(parent: _animationController, curve: Curves.slowMiddle);
    _colorAnimation = ColorTween(begin: Colors.grey[400], end: Colors.red)
        .animate(_curve as Animation<double>);
    _sizeAnimation = TweenSequence([
      TweenSequenceItem(
        tween: Tween(
          begin: 30.0,
          end: 50.0,
        ),
        weight: 50,
      ),
      TweenSequenceItem(
        tween: Tween(
          begin: 50.0,
          end: 30.0,
        ),
        weight: 50,
      ),
    ]).animate(_curve as Animation<double>);
    // _animationController.addListener(() {
    // });
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          isFav = true;
        });
      }
      if (status == AnimationStatus.dismissed) {
        setState(() {
          isFav = false;
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _animationController,
        builder: (context, _) {
          return IconButton(
            icon: Icon(
              Icons.favorite,
              color: _colorAnimation.value,
              size: _sizeAnimation.value,
            ),
            onPressed: () {
              isFav
                  ? _animationController.reverse()
                  : _animationController.forward();
            },
          );
        });
  }
}
