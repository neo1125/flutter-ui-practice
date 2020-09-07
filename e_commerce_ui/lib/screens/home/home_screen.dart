import 'package:flutter/material.dart';
import 'package:e_commerce_ui/screens/components/main_app_bar.dart';
import 'package:e_commerce_ui/screens/home/components/body.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(),
      body: Container(
        color: Colors.white,
        child: Body(),
      ),
    );
  }
}
