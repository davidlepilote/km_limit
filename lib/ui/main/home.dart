import 'package:flutter/material.dart';

import 'countdown.dart';

class Home extends StatelessWidget {
  static const String routeName = "/Home";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(child: Countdown()),
      ),
    );
  }
}