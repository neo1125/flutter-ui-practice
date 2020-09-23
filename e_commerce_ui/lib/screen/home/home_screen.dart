import 'package:flutter/material.dart';
import 'package:e_commerce_ui/screen/component/main_app_bar.dart';
import 'package:e_commerce_ui/screen/home/component/body.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: MainAppBar(),
      body: Body(),
    );
  }
}
