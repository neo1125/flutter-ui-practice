import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'package:reflectly_clone/screen/intro/component/fade_in_widget.dart';
import 'package:reflectly_clone/screen/join/join_screen.dart';

class IntroScreen extends StatefulWidget {
  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen>
    with SingleTickerProviderStateMixin {
  AnimationController controller;

  @override
  void initState() {
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF888bf0),
              Color(0xFF7173c7),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Positioned(
              top: 120,
              child: Column(
                children: [
                  FadeInWidget(
                    child: Hero(
                      tag: "icon_image",
                      child: Image.asset(
                        "assets/images/reflectly-icon.png",
                        width: 70,
                        height: 70,
                      ),
                    ),
                  ),
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
              ),
            ),
            Positioned(
              bottom: 30,
              child: Column(
                children: [
                  FlatButton(
                    textColor: Color(0xFF7173c7),
                    color: Colors.white,
                    padding: EdgeInsets.only(
                      top: 15,
                      bottom: 15,
                      left: 50,
                      right: 50,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    onPressed: () {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => JoinScreen()));
                      final curvedAnimation = CurvedAnimation(
                          parent: controller, curve: Curves.decelerate);
                      Animation<Offset> _offset =
                          Tween<Offset>(begin: Offset(0, 0), end: Offset(-1, 0))
                              .animate(curvedAnimation);

                      Navigator.push(
                          context,
                          PageRouteBuilder(
                              pageBuilder: (_, __, ___) => JoinScreen(),
                              transitionsBuilder: (context, animation,
                                  secondaryAnimation, child) {
                                return SlideTransition(
                                  position: _offset,
                                  child: child,
                                );
                              },
                              transitionDuration: Duration(milliseconds: 400)));
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
