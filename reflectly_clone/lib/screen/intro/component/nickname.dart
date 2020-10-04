import 'package:flutter/material.dart';

class Nickname extends StatefulWidget {
  final PageController pageController;
  final updateFocusTextField;

  const Nickname({
    Key key,
    this.pageController,
    this.updateFocusTextField,
  }) : super(key: key);

  @override
  _NicknameState createState() => _NicknameState();
}

class _NicknameState extends State<Nickname>
    with AutomaticKeepAliveClientMixin, TickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> _scaleSequence;

  final _focusNode = FocusNode();

  var focusTextField = false;
  var nickname = "";

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 250),
    );

    final curvedAnimation =
        CurvedAnimation(parent: _animationController, curve: Curves.easeInOut);
    _scaleSequence = TweenSequence([
      TweenSequenceItem(tween: Tween<double>(begin: 0, end: 1.15), weight: 1),
      TweenSequenceItem(
          tween: Tween<double>(begin: 1.15, end: 0.95), weight: 1),
      TweenSequenceItem(tween: Tween<double>(begin: 0.95, end: 1), weight: 1),
    ]).animate(curvedAnimation);

    _focusNode.addListener(() {
      setState(() {
        focusTextField = _focusNode.hasFocus;
        widget.updateFocusTextField(focusTextField);
      });
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  // ignore: must_call_super
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        AnimatedContainer(
          duration: Duration(milliseconds: 350),
          curve: Curves.easeInOut,
          margin: EdgeInsets.only(
            top: focusTextField ? 100 : 140,
          ),
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
        Center(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 35,
                  right: 35,
                  top: 10,
                  bottom: 10,
                ),
                child: TextField(
                  autocorrect: false,
                  autofocus: false,
                  textAlign: TextAlign.center,
                  cursorColor: Colors.white,
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.black12,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none),
                    hintText: "Your nickname...",
                    hintStyle: TextStyle(
                      color: Colors.white60,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    counterText: "",
                  ),
                  maxLength: 25,
                  focusNode: _focusNode,
                  onChanged: (text) {
                    if (text.isNotEmpty) {
                      _animationController.forward();
                    } else {
                      _animationController.reverse();
                    }

                    setState(() {
                      nickname = text;
                    });
                  },
                ),
              ),
              Positioned(
                right: 30,
                child: ScaleTransition(
                  scale: _scaleSequence,
                  child: Container(
                    width: 40,
                    height: 25,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: Text(
                      "${nickname.length}/20",
                      style: TextStyle(
                        color: Color(0xFF7173c7),
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
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
            onPressed: nickname.isEmpty
                ? null
                : () {
                    widget.pageController
                      ..animateToPage(
                        2,
                        duration: Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      );
                  },
            child: Text("continue".toUpperCase()),
          ),
        )
      ],
    );
  }
}
