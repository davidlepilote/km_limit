import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:km_limit/core/location.dart';
import 'package:km_limit/ui/permission/permission.dart';

class Service extends StatelessWidget {
  static const String routeName = "/Service";

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
        future: LocationProvider().requestService(),
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          if (!snapshot.hasData || snapshot.data == false) {
            return Scaffold(
              body: SafeArea(
                child: Center(
                  child: Text("Starting service"),
                ),
              ),
            );
          } else {
            return Permission();
          }
        });
  }
}
