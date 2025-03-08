import 'package:flutter/material.dart';
import 'package:spendwise_app/data/appColors.dart';

class AppGradient {
  LinearGradient blueGreyWhiteGradient = LinearGradient(
    colors: [
      appColors.gradientColor1,
      appColors.gradientColor2,
      appColors.gradientColor3,
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}

AppGradient appGradient = AppGradient();
