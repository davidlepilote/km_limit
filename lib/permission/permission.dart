import 'package:CoroJogging/core/location.dart';
import 'package:CoroJogging/main/home.dart';
import 'package:CoroJogging/shared/disclaimer.dart';
import 'package:CoroJogging/themes.dart';
import 'package:flutter/material.dart';

class Permission extends StatelessWidget {
  static const String routeName = "/Permission";

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
        future: LocationProvider().hasPermission(),
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          if (!snapshot.hasData || snapshot.data == false) {
            return Disclaimer(
              icon: Image.asset(
                "assets/pin.png",
                width: MediaQuery.of(context).size.width * 0.3,
              ),
              title: "Partagez votre position",
              body: [Text(
                "Afin de vous permettre de courir à moins d'un kilomètre de chez vous, nous avons besoin que vous nous donniez la permission d'utiliser votre géolocalisation. Celle-ci n'est enregistrée nulle part et ne sert qu'à faire fonctionner l'application. Sans cela, l'application ne pourra pas fonctionner.",
                style: AppTheme.of(context).textStyles.subheader,
                textAlign: TextAlign.center,
              )],
              onPressed: () {
                LocationProvider().requestPermission().then(
                  (bool value) {
                    if (value) {
                      Navigator.of(context).pushReplacementNamed(Home.routeName);
                    }
                  },
                );
              },
              okText: "J'active",
            );
          } else {
            return Home();
          }
        });
  }
}
