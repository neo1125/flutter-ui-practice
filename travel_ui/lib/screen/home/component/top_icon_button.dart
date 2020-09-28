import 'package:flutter/material.dart';

class TopIconButton extends StatelessWidget {
  final IconData iconData;
  const TopIconButton({
    Key key,
    this.iconData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        color: Color(0xFFd5dade),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Icon(iconData),
    );
  }
}
