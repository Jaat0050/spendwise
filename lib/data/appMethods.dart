import 'package:flutter/material.dart';

class AppMethods {
  static Future navigate(BuildContext context, Widget page) {
    return Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => page,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const curve = Curves.linear;
          var tween = Tween<double>(begin: 0.0, end: 1.0).chain(CurveTween(curve: curve));
          var fadeAnimation = animation.drive(tween);
          return FadeTransition(opacity: fadeAnimation, child: child);
        },
      ),
    );
  }

  static Future navigateReplacement(BuildContext context, Widget page) {
    return Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => page,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const curve = Curves.linear;
          var tween = Tween<double>(begin: 0.0, end: 1.0).chain(CurveTween(curve: curve));
          var fadeAnimation = animation.drive(tween);
          return FadeTransition(opacity: fadeAnimation, child: child);
        },
      ),
    );
  }

  static Future navigatePermanent(BuildContext context, Widget page) {
    return Navigator.pushAndRemoveUntil(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => page,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const curve = Curves.linear;
          var tween = Tween<double>(begin: 0.0, end: 1.0).chain(CurveTween(curve: curve));
          var fadeAnimation = animation.drive(tween);
          return FadeTransition(opacity: fadeAnimation, child: child);
        },
      ),
      (route) => false,
    );
  }
}
