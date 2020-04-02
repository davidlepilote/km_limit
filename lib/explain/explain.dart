import 'package:CoroJogging/shared/disclaimer.dart';
import 'package:flutter/material.dart';

import '../themes.dart';

class Explain extends StatelessWidget {
  static const String routeName = "/Explain";

  @override
  Widget build(BuildContext context) {
    return Disclaimer(
      icon: Icon(
        Icons.help,
        size: 100,
        color: AppTheme.of(context).colors.primaryColor,
      ),
      title: "Comment est calculée la distance ?",
      body: [
        Text(
          """En appuyant sur "Go", l'application enregistre votre position initiale puis recalcule en temps réel la distance avec votre nouvelle position. Le signe ± représente la précision actuelle de votre géolocalisation. Ne vous inquiétez pas, même si l'application n'est pas très précise au début, elle vous permettra d'aller tranquillement autour d'1 km. Pour vous éviter les ennuis, le téléphone vibrera dès que vous dépasserez la distance + la précision actuelle. Bonne sortie et #RestezÀLaMaison !""",
          style: AppTheme.of(context).textStyles.subheader.copyWith(
                fontSize: 14,
              ),
          textAlign: TextAlign.center,
        )
      ],
      onPressed: () => Navigator.of(context).pop(),
      okText: "J'ai compris",
    );
  }
}
