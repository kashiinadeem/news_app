import 'package:flutter/material.dart';

class RouteAnim {
  BuildContext context;
  Widget? route;

  RouteAnim({required this.context, this.route});

  Future<dynamic> goto() {
    return Navigator.push(
      context,
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 500),
        pageBuilder: (context, animation, secondaryAnimation) {
          return route!;
        },
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = 0.0;
          const end = 1.0;
          const curve = Curves.slowMiddle;

          var tween = Tween<double>(begin: begin, end: end)
              .chain(CurveTween(curve: curve));
          var offsetAnimation = animation.drive(tween);

          return ClipRect(
              child: ScaleTransition(
            scale: offsetAnimation,
            child: child,
          ));
        },
      ),
    );
  }

  Future<dynamic> goPOP() {
    return Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 500),
        pageBuilder: (context, animation, secondaryAnimation) {
          return route!;
        },
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = 0.0;
          const end = 1.0;
          const curve = Curves.slowMiddle;

          var tween = Tween<double>(begin: begin, end: end)
              .chain(CurveTween(curve: curve));
          var offsetAnimation = animation.drive(tween);

          return ClipRect(
              child: ScaleTransition(
            scale: offsetAnimation,
            child: child,
          ));
        },
      ),
    );
  }

  PageRouteBuilder gotoRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) {
        return route!;
      },
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.easeInOut;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var offsetAnimation = animation.drive(tween);

        return ClipRect(
            child: SlideTransition(
          position: offsetAnimation,
          child: child,
        ));
      },
    );
  }

  void back() {
    return Navigator.of(context).pop();
  }
}
