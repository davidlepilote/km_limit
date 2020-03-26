import 'package:flutter/material.dart';
import 'package:km_limit/core/location.dart';
import 'package:km_limit/ui/main/home.dart';

class Permission extends StatelessWidget {
  static const String routeName = "/Permission";

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
        future: LocationProvider().requestPermission(),
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          if (!snapshot.hasData || snapshot.data == false) {
            return Scaffold(
              body: SafeArea(
                child: Center(
                  child: Text("Requesting permission"),
                ),
              ),
            );
          } else {
            return Home();
          }
        });
  }
}

