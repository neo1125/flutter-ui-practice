import 'dart:async';

import 'package:flutter/material.dart';

class ScaleUpWidget extends StatefulWidget {
  final Widget child;
  final AnimationController animationController;
  final int delay;
  final int duration;

  const ScaleUpWidget({
    Key key,
    this.child,
    this.delay,
    this.duration = 450,
    this.animationController,
  }) : super(key: key);

  @override
  _ScaleUpWidgetState createState() => _ScaleUpWidgetState();
}

class _ScaleUpWidgetState extends State<ScaleUpWidget>
    with TickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _scaleSequence;

  @override
  void initState() {
    super.initState();
    _controller = widget.animationController;
    if (_controller == null) {
      _controller = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: widget.duration),
      );
    }

    final curvedAnimation =
        CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
    _scaleSequence = TweenSequence([
      TweenSequenceItem(tween: Tween<double>(begin: 0, end: 1.15), weight: 1),
      TweenSequenceItem(
          tween: Tween<double>(begin: 1.15, end: 0.95), weight: 1),
      TweenSequenceItem(tween: Tween<double>(begin: 0.95, end: 1), weight: 1),
    ]).animate(curvedAnimation);

    if (widget.delay == null) {
      _controller.forward();
    } else {
      Timer(Duration(milliseconds: widget.delay), () {
        _controller.forward();
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      child: ScaleTransition(
        scale: _scaleSequence,
        child: widget.child,
      ),
      opacity: _controller,
    );
  }
}
