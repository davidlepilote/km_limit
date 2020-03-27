import 'package:CoroFooting/main/home.dart';
import 'package:CoroFooting/themes.dart';
import 'package:flutter/material.dart';
import 'package:CoroFooting/core/location.dart';

class Permission extends StatelessWidget {
  static const String routeName = "/Permission";

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
        future: LocationProvider().hasPermission(),
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          if (!snapshot.hasData || snapshot.data == false) {
            return Scaffold(
              backgroundColor: Colors.white,
              body: SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      "assets/pin.png",
                      width: MediaQuery.of(context).size.width * 0.3,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Partagez votre position",
                      style: AppTheme.of(context).textStyles.header,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        "Afin de vous permettre de courir à moins d'un kilomètre de chez vous, nous avons besoin que vous nous donniez la permission d'utiliser votre géolocalisation. Celle-ci n'est enregistrée nulle part et ne sert qu'à faire fonctionner l'application. Sans cela, l'application ne pourra pas fonctionner.",
                        style: AppTheme.of(context).textStyles.subheader,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    RaisedButton(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(100),
                        ),
                      ),
                      onPressed: () {
                        LocationProvider().requestPermission().then(
                          (bool value) {
                            if (value) {
                              Navigator.of(context).pushReplacementNamed(Home.routeName);
                            }
                          },
                        );
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 12.0),
                            child: Text(
                              "J'active",
                              style: AppTheme.of(context).textStyles.button1.copyWith(fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return Home();
          }
        });
  }
}
