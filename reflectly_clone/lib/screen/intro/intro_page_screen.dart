import 'package:flutter/material.dart';
import 'component/nickname.dart';
import 'component/welcome.dart';

class IntroPageScreen extends StatefulWidget {
  @override
  _IntroPageScreenState createState() => _IntroPageScreenState();
}

class _IntroPageScreenState extends State<IntroPageScreen>
    with SingleTickerProviderStateMixin {
  final PageController pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );
  AnimationController animationController;

  final animateDuration = 150;
  final logoSmallScale = 0.85;
  var pageIndex = 0;

  @override
  void initState() {
    animationController =
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
            children: [
              AnimatedContainer(
                duration: Duration(milliseconds: animateDuration),
                curve: Curves.easeInOut,
                margin: EdgeInsets.only(
                  top: pageIndex == 0 ? 100 : 70,
                  left: MediaQuery.of(context).size.width / 2 -
                      (pageIndex == 0 ? 35 : 35 * logoSmallScale),
                ),
                width: 70 * ((pageIndex == 0) ? 1.0 : logoSmallScale),
                height: 70 * ((pageIndex == 0) ? 1.0 : logoSmallScale),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/reflectly-icon.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              PageView(
                controller: pageController,
                onPageChanged: (value) {
                  setState(() {
                    pageIndex = value;
                  });
                },
                children: [
                  Welcome(pageController: pageController),
                  Nickname(),
                ],
              ),
              AnimatedContainer(
                duration: Duration(milliseconds: animateDuration),
                curve: Curves.easeInOut,
                margin: EdgeInsets.only(top: 50),
                transform:
                    Matrix4.translationValues(pageIndex == 0 ? -50 : 0, 0, 0),
                child: IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    pageController.previousPage(
                      duration: Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                    );
                  },
                  color: Colors.white38,
                ),
              ),
            ],
          )),
    );
  }
}
