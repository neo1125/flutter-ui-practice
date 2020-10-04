import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
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
          child: Stack(alignment: Alignment.topCenter, children: [
            Positioned(
              top: 80,
              child: Column(
                children: [
                  Hero(
                    tag: "icon_image",
                    child: Image.asset(
                      "assets/images/reflectly-icon.png",
                      width: 50,
                      height: 50,
                    ),
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
