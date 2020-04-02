import 'package:CoroJogging/shared/disclaimer.dart';
import 'package:CoroJogging/themes.dart';
import 'package:flutter/material.dart';

class Rules extends StatelessWidget {
  static const String routeName = "/Rules";

  @override
  Widget build(BuildContext context) {
    return Disclaimer(
      icon: Image.asset(
        "assets/group.png",
        width: MediaQuery.of(context).size.width * 0.3,
      ),
      title: "Suivez les consignes",
      body: [
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
      ],
      onPressed: () => Navigator.of(context).pop(),
      okText: "C'est parti",
    );
  }
}
