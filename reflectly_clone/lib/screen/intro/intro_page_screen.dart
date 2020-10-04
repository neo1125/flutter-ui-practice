import 'package:flutter/material.dart';
import 'package:reflectly_clone/screen/intro/component/scale_up_widget.dart';
import 'component/nickname.dart';
import 'component/welcome.dart';

class IntroPageScreen extends StatefulWidget {
  @override
  _IntroPageScreenState createState() => _IntroPageScreenState();
}

class _IntroPageScreenState extends State<IntroPageScreen>
    with SingleTickerProviderStateMixin {
  PageController pageController;
  AnimationController animationController;

  final animateDuration = 250;
  final logoSmallScale = 0.85;
  var hasFocusTextField = false;
  var pageIndex = 0;

  changedTextFieldFocus(bool hasFocus) {
    setState(() {
      hasFocusTextField = hasFocus;
    });
  }

  @override
  void initState() {
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    pageController = PageController(
      initialPage: 0,
      keepPage: true,
    )..addListener(() {
        setState(() {
          pageIndex = pageController.page.round();
        });
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
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
              // 상단 로고 영역
              AnimatedContainer(
                duration: Duration(milliseconds: animateDuration),
                curve: Curves.easeInOut,
                margin: EdgeInsets.only(
                  top: pageIndex < 1 ? 100 : 70,
                  left: MediaQuery.of(context).size.width / 2 -
                      (pageIndex < 1 ? 35 : 35 * logoSmallScale),
                ),
                transform: Matrix4.translationValues(
                    0, hasFocusTextField ? -100 : 0, 0),
                width: 70 * ((pageIndex < 1) ? 1.0 : logoSmallScale),
                height: 70 * ((pageIndex < 1) ? 1.0 : logoSmallScale),
                child: ScaleUpWidget(
                  child: Image.asset("assets/images/reflectly-icon.png"),
                ),
              ),
              // 내용화면
              PageView(
                controller: pageController,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  Welcome(pageController: pageController),
                  Nickname(
                    pageController: pageController,
                    updateFocusTextField: changedTextFieldFocus,
                  ),
                  Stack(
                    children: [],
                  ),
                ],
              ),
              // 뒤로 가기 버튼
              AnimatedContainer(
                duration: Duration(milliseconds: animateDuration),
                curve: Curves.easeInOut,
                margin: EdgeInsets.only(top: 50),
                transform: Matrix4.translationValues(
                    hasFocusTextField ? -50 : pageIndex < 1 ? -50 : 0, 0, 0),
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
              // todo : pageview indicator add
            ],
          )),
    );
  }
}
