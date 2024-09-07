import 'package:flutter/material.dart';

extension Fields on BuildContext {
  //textStyles

  TextStyle? get hL => Theme.of(this).textTheme.headlineLarge;
  TextStyle? get h1 => Theme.of(this).textTheme.headlineMedium;
  TextStyle? get h2 => Theme.of(this).textTheme.headlineSmall;

  TextStyle? get b1 => Theme.of(this).textTheme.bodyLarge;
  TextStyle? get b2 => Theme.of(this).textTheme.bodyMedium;
  TextStyle? get c1 => Theme.of(this).textTheme.bodySmall;

  //colors
  Color? get primary => Theme.of(this).colorScheme.primary;
  Color? get background => Theme.of(this).colorScheme.surface;
  Color? get foreground => Theme.of(this).colorScheme.onSurface;
  Color? get focus => Theme.of(this).focusColor;
  Color? get scaffold => Theme.of(this).scaffoldBackgroundColor;
  Color? get error => Theme.of(this).colorScheme.error;
  Color? get transparent => Colors.transparent;

  Color? get homes => const Color(0xFFFF6C4B);
  Color? get beak => const Color(0xFF171717);
  Color? get daakiya => const Color(0xFF45C09B);

  //sizes
  double get width => MediaQuery.of(this).size.width;
  double get height => MediaQuery.of(this).size.height;

  SizedBox get h5 => const SizedBox(height: 5);
  SizedBox get h10 => const SizedBox(height: 10);
  SizedBox get h30 => const SizedBox(height: 30);
  SizedBox get h50 => const SizedBox(height: 50);
  SizedBox get w10 => const SizedBox(width: 10);

  d10({double? height, double? width, double? thick}) => SizedBox(
        height: height ?? 20.0,
        width: width ?? 15.0,
        child: VerticalDivider(
          thickness: thick ?? 2.0,
          width: width ?? 40,
          color: foreground?.withOpacity(0.1),
        ),
      );

  bool get isMobile => width <= 430 ? true : false;
  bool get isTab => width > 430 && width <= 1030 ? true : false;

  //shapes
  BorderRadius get r0 => BorderRadius.zero;
  BorderRadius get r5 => BorderRadius.circular(5.0);
  BorderRadius get r10 => BorderRadius.circular(10.0);
  BorderRadius get r15 => BorderRadius.circular(15.0);
  BorderRadius get r30 => BorderRadius.circular(30.0);
  BorderRadius get r100 => BorderRadius.circular(100.0);

  EdgeInsets get p0 => const EdgeInsets.all(0.0);
  EdgeInsets get p10 => const EdgeInsets.all(10.0);

  EdgeInsets get p20 => const EdgeInsets.all(20.0);
  EdgeInsets get p50 => const EdgeInsets.all(50.0);
  EdgeInsets get p100 => const EdgeInsets.all(100.0);

  BorderSide get sidenone => BorderSide.none;
  BorderSide get sideAll => const BorderSide();

  RoundedRectangleBorder get tileShape => RoundedRectangleBorder(
      borderRadius: r15,
      side: sideAll.copyWith(color: foreground?.withOpacity(0.1)));

  OutlineInputBorder get inputBorder => OutlineInputBorder(
      borderRadius: r15,
      borderSide: sideAll.copyWith(color: foreground?.withOpacity(0.1)));

  LinearGradient get gradient =>
      LinearGradient(colors: [primary!, foreground!]);

  // routes
  get pop => Navigator.of(this).pop();
  route(child) =>
      Navigator.push(this, MaterialPageRoute(builder: (context) => child));
}

extension BlocContextExtension on BuildContext {}

extension ContextNavigationExt on BuildContext {
  go({required Widget route}) =>
      Navigator.of(this).push(MaterialPageRoute(builder: (context) => route));

  replace({required Widget route}) => Navigator.of(this)
      .pushReplacement(MaterialPageRoute(builder: (context) => route));
}
