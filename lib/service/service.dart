import 'package:CoroJogging/permission/permission.dart';
import 'package:CoroJogging/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:CoroJogging/core/location.dart';

class Service extends StatelessWidget {
  static const String routeName = "/Service";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.of(context).colors.primaryColor,
      body: SafeArea(
        child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              "assets/launcher.png",
              width: 128,
            ),
            FutureBuilder<bool>(
                future: LocationProvider().requestService(),
                builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
                  if (!snapshot.hasData) {
                    return Container();
                  }
                  else if (snapshot.data == false) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text("Veuillez mettre en marche votre géolocalisation et redémarrer l'application", style: AppTheme.of(context).textStyles.text4, textAlign: TextAlign.center,),
                    );
                  } else {
                    Future.delayed(Duration(seconds: 1)).then((_) => Navigator.of(context).pushReplacementNamed(Permission.routeName));
                    return Container();
                  }
                }),
          ],
        )),
      ),
    );
  }
}
