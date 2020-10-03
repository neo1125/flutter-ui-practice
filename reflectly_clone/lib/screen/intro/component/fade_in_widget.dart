import 'dart:async';

import 'package:flutter/material.dart';

class FadeInWidget extends StatefulWidget {
  final Widget child;
  final AnimationController animationController;
  final int delay;
  final int duration;

  const FadeInWidget({
    Key key,
    this.child,
    this.delay,
    this.duration = 400,
    this.animationController,
  }) : super(key: key);

  @override
  _FadeInWidgetState createState() => _FadeInWidgetState();
}

class _FadeInWidgetState extends State<FadeInWidget>
    with TickerProviderStateMixin {
  AnimationController _controller;
  Animation<Offset> _offset;

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
        CurvedAnimation(parent: _controller, curve: Curves.decelerate);
    _offset = Tween<Offset>(begin: Offset(0.0, 0.35), end: Offset.zero)
        .animate(curvedAnimation);

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
      child: SlideTransition(
        position: _offset,
        child: widget.child,
      ),
      opacity: _controller,
    );
  }
}
