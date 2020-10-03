import 'package:flutter/material.dart';
import 'fade_in_widget.dart';

class Welcome extends StatefulWidget {
  final PageController pageController;

  const Welcome({
    Key key,
    this.pageController,
  }) : super(key: key);

  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  // ignore: must_call_super
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Positioned(
          top: 180,
          child: buildMessages(),
        ),
        Positioned(
          bottom: 50,
          child: buildButtons(),
        ),
      ],
    );
  }

  Column buildButtons() {
    return Column(
      children: [
        FlatButton(
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
          onPressed: () {
            widget.pageController.animateToPage(
              1,
              duration: Duration(milliseconds: 500),
              curve: Curves.easeInOut,
            );
          },
          child: Text("hi, reflectly!".toUpperCase()),
        ),
        FlatButton(
          padding: EdgeInsets.symmetric(vertical: 50),
          onPressed: () {
            // Navigator(
            //     context,
            //     PageRouteBuilder(
            //         pageBuilder: (_, __, ___) => LoginScreen(),
            //         transitionDuration: Duration(milliseconds: 800)));
          },
          child: Text(
            "i already have an account".toUpperCase(),
            style: TextStyle(
              fontSize: 14,
              color: Colors.white30,
            ),
          ),
        ),
      ],
    );
  }

  Column buildMessages() {
    return Column(
      children: [
        FadeInWidget(
          delay: 600,
          child: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Text(
              "Hi there,",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        FadeInWidget(
          delay: 1200,
          child: Text(
            "I'm Reflectly",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        FadeInWidget(
          delay: 1800,
          child: Padding(
            padding: const EdgeInsets.only(top: 40),
            child: Text(
              "Your new personal\nself-care companion",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white30,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
