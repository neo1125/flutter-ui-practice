import 'package:flutter/material.dart';

class StartingTimes extends StatelessWidget {
  final List<String> times;
  const StartingTimes({
    Key key,
    this.times,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        children: [for (var time in times) buildTime(time)],
      ),
    );
  }

  Container buildTime(String time) {
    return Container(
      margin: EdgeInsets.only(right: 5),
      padding: EdgeInsets.only(
        top: 5,
        bottom: 5,
        left: 10,
        right: 10,
      ),
      decoration: BoxDecoration(
        color: Colors.blue.withOpacity(0.3),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(time),
    );
  }
}
