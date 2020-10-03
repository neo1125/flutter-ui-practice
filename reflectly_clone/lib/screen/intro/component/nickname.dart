import 'package:flutter/material.dart';

class Nickname extends StatefulWidget {
  @override
  _NicknameState createState() => _NicknameState();
}

class _NicknameState extends State<Nickname>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
  }

  @override
  // ignore: must_call_super
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Positioned(
          top: 140,
          child: Text(
            "So nice to meet you! What do\nyour friends call you?",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        Positioned(
          bottom: 140,
          child: FlatButton(
            disabledColor: Colors.black12,
            textColor: Color(0xFF7173c7),
            color: Colors.white,
            padding: EdgeInsets.only(
              top: 15,
              bottom: 15,
              left: 70,
              right: 70,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
            onPressed: null,
            child: Text("continue".toUpperCase()),
          ),
        )
      ],
    );
  }
}
