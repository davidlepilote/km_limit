import 'package:CoroFooting/themes.dart';
import 'package:flutter/material.dart';
import 'package:CoroFooting/core/location.dart';

class Rules extends StatelessWidget {
  static const String routeName = "/Rules";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(width: MediaQuery.of(context).size.width,),
            Image.asset(
              "assets/group.png",
              width: MediaQuery.of(context).size.width * 0.3,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Suivez les consignes",
              style: AppTheme.of(context).textStyles.header,
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "1. Vous ne devez pas sortir plus d'une heure",
                style: AppTheme.of(context).textStyles.subheader,
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "2. Vous ne devez pas courir à plus d'un kilomètre de chez vous",
                style: AppTheme.of(context).textStyles.subheader,
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "3. Vous devez toujours avoir sur vous votre dérogation horodatée ainsi qu'une pièce d'identité",
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
                      Navigator.of(context).pop();
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
                      "C'est parti",
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

  }
}
