import 'package:flutter/material.dart';

Route slideTransitionRoute(
  Widget nextScreen, {
  Duration duration = const Duration(milliseconds: 1000),
  Curve curve = Curves.ease,
  Offset beginPosition = const Offset(1, 1),
}) {
  Animatable<Offset> tween =
      Tween(begin: beginPosition, end: Offset.zero).chain(
    CurveTween(curve: curve),
  );
  return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => nextScreen,
      transitionDuration: duration,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return SlideTransition(
          position: animation.drive(tween),
          child: nextScreen,
        );
      });
}
