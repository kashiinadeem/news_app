import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/core/extensions/context.dart';

import 'Colors/Colors.dart';

ThemeData newzDarkTheme(BuildContext context) => ThemeData(
    useMaterial3: true,
    focusColor: markColorFocusDark,
    canvasColor: newzScaffoldDark,
    brightness: Brightness.dark,
    appBarTheme: AppBarTheme(
        toolbarHeight: 60,
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        actionsIconTheme: IconThemeData(color: newzColorBlackDark),
        titleTextStyle: GoogleFonts.roboto(
          fontSize: 16,
          fontWeight: FontWeight.w300,
          color: newzColorBlackDark,
        ),
        centerTitle: false,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.light,
          systemNavigationBarColor: newzScaffoldDark,
        )),
    textTheme: TextTheme(
      bodyMedium: GoogleFonts.roboto(
          fontSize: context.isMobile ? 14 : 12, fontWeight: FontWeight.normal),
      bodySmall: GoogleFonts.poppins(
          fontSize: 10,
          fontWeight: FontWeight.w700,
          fontStyle: FontStyle.normal),
      bodyLarge:
          GoogleFonts.roboto(fontSize: 14, fontWeight: FontWeight.normal),
      headlineLarge: GoogleFonts.roboto(
          fontSize: context.isMobile ? 30.0 : 35.0,
          fontWeight: FontWeight.w700),
      headlineMedium: GoogleFonts.inter(
        fontSize: context.isMobile ? 18 : 30,
        fontWeight: FontWeight.w200,
      ),
      headlineSmall:
          GoogleFonts.roboto(fontSize: 14, fontWeight: FontWeight.w700),
    ),
    colorScheme: ColorScheme(
        brightness: Brightness.dark,
        primary: newzColorPrimaryDark,
        onPrimary: newzColorWhiteDark,
        secondary: newzColorSecondaryDark,
        onSecondary: newzColorWhiteDark,
        error: newzColorErrorDark,
        onError: newzColorWhiteDark,
        surface: newzColorWhiteDark,
        onSurface: newzColorBlackDark),
    splashColor: newzColorPrimaryDark.withOpacity(0.05),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: GoogleFonts.roboto(
          fontSize: 15,
          color: newzColorBlackDark.withOpacity(0.5),
          fontWeight: FontWeight.w300),
      contentPadding: const EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 10.0,
      ),
      border: InputBorder.none,
      filled: true,
      fillColor: newzColorBlackDark.withOpacity(0.05),
      focusColor: newzColorPrimaryDark.withOpacity(0.08),
      hoverColor: newzColorPrimaryDark.withOpacity(0.08),
    ),
    snackBarTheme: SnackBarThemeData(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0))),
      backgroundColor: newzColorWhiteDark,
      behavior: SnackBarBehavior.floating,
      contentTextStyle: GoogleFonts.roboto(
          fontSize: 12, color: newzColorBlackDark, fontWeight: FontWeight.w600),
    ),
    // bottomNavigationBarTheme: BottomNavigationBarThemeData(
    //     backgroundColor: newzScaffoldDark,
    //     selectedIconTheme: IconThemeData(
    //       color: newzColorPrimaryDark,
    //       size: 40,
    //       opacity: 1.0,
    //     ),
    //     unselectedIconTheme: IconThemeData(
    //       color: newzColorBlackDark.withOpacity(0.25),
    //       size: 24,
    //       opacity: 0.5,
    //     ),
    //     selectedItemColor: newzColorPrimaryDark,
    //     unselectedItemColor: newzColorBlackDark.withOpacity(0.25),
    //     selectedLabelStyle: GoogleFonts.roboto(color: newzColorPrimaryDark),
    //     unselectedLabelStyle: GoogleFonts.roboto(color: newzColorBlackDark),
    //     showUnselectedLabels: false,
    //     showSelectedLabels: false,
    //     type: BottomNavigationBarType.fixed),
    bottomAppBarTheme: const BottomAppBarTheme(color: Colors.transparent),
    navigationBarTheme: NavigationBarThemeData(
      labelTextStyle: WidgetStatePropertyAll(GoogleFonts.poppins(
          fontSize: 10,
          fontWeight: FontWeight.w700,
          fontStyle: FontStyle.normal)),
      iconTheme:
          WidgetStatePropertyAll(IconThemeData(color: newzColorBlackDark)),
      indicatorShape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(50.0))),
      backgroundColor: Colors.transparent,
    ),
    textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
            textStyle: WidgetStateProperty.all(
                GoogleFonts.roboto(color: newzColorPrimaryDark)),
            splashFactory: InkSplash.splashFactory)),
    dialogTheme: DialogTheme(
      backgroundColor: newzScaffoldDark,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5.0))),
    ),
    iconTheme: IconThemeData(color: newzColorBlackDark, size: 24),
    scaffoldBackgroundColor: newzScaffoldDark,
    // tabBarTheme: TabBarTheme(
    //     indicator: BoxDecoration(
    //         color: newzColorPrimaryDark.withOpacity(0.3),
    //         borderRadius: BorderRadius.circular(100.0)),
    //     labelPadding: const EdgeInsets.all(8.0),
    //     labelColor: newzColorBlackDark,
    //     indicatorSize: TabBarIndicatorSize.tab,
    //     labelStyle: GoogleFonts.roboto(
    //         fontSize: 14, color: Colors.black, fontWeight: FontWeight.bold),
    //     unselectedLabelStyle:
    //         GoogleFonts.roboto(fontSize: 14, color: Colors.black38)),
    bottomSheetTheme: BottomSheetThemeData(
        surfaceTintColor: newzScaffoldDark,
        backgroundColor: newzScaffoldDark,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.0),
                topRight: Radius.circular(10.0)))),
    toggleButtonsTheme: ToggleButtonsThemeData(
        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
        focusColor: newzColorPrimaryDark,
        selectedColor: newzColorBlackDark,
        fillColor: newzColorPrimaryDark),
    // listTileTheme: ListTileThemeData(
    //     titleTextStyle: context.h1.copyWith(color: newzColorBlackDark),
    //     subtitleTextStyle: context.b1.copyWith(color: newzColorBlackDark)),
    datePickerTheme: DatePickerThemeData(
      backgroundColor: newzScaffoldDark,
      headerForegroundColor: newzColorBlackDark,
      // shape: context.tileShape,
    ),
    timePickerTheme: TimePickerThemeData(
      // shape: context.tileShape,
      backgroundColor: newzScaffoldDark,
      dialTextColor: newzColorBlackDark,
      hourMinuteColor: newzColorWhiteDark,
      hourMinuteTextColor: newzColorBlackDark,
      dayPeriodColor: newzColorPrimaryDark,
      dayPeriodTextColor: newzColorWhiteDark,
    ),
    // chipTheme: ChipThemeData(
    //   side: BorderSide.none,
    //   elevation: 0.0,
    //   color: MaterialStateProperty.all(Colors.transparent),
    //   backgroundColor: Colors.transparent,
    //   disabledColor: Colors.transparent,
    //   surfaceTintColor: Colors.transparent,
    //   shadowColor: Colors.transparent,
    //   selectedColor: newzColorPrimaryDark,
    //   iconTheme: const IconThemeData(size: 14),
    //   shape: const RoundedRectangleBorder(
    //       borderRadius: BorderRadius.all(
    //         Radius.circular(8.0),
    //       ),
    //       side: BorderSide.none),
    //   labelPadding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 8.0),
    //   secondarySelectedColor: Colors.transparent,
    //   labelStyle: GoogleFonts.roboto(
    //       fontSize: 14, color: newzColorBlackDark, fontWeight: FontWeight.w400),
    //   secondaryLabelStyle: GoogleFonts.roboto(
    //       fontSize: 14, color: newzColorBlackDark, fontWeight: FontWeight.w400),
    // ),
    navigationRailTheme: NavigationRailThemeData(
      indicatorColor: newzColorPrimaryDark,
      backgroundColor: newzColorWhiteDark.withOpacity(0.05),
      selectedIconTheme: IconThemeData(color: newzColorPrimaryDark, size: 25),
      unselectedIconTheme: IconThemeData(
          color: newzColorPrimaryDark.withOpacity(0.45), size: 25),
    ),
    segmentedButtonTheme: SegmentedButtonThemeData(
        style: ButtonStyle(
            surfaceTintColor: WidgetStatePropertyAll(newzColorPrimaryDark),
            backgroundColor: WidgetStateProperty.resolveWith<Color>(
              (Set<WidgetState> states) {
                if (states.contains(WidgetState.selected)) {
                  return newzColorPrimaryDark;
                }
                return Colors.transparent;
              },
            ),
            padding: const WidgetStatePropertyAll(
                EdgeInsets.symmetric(horizontal: 10.0, vertical: 2.0)),
            side: WidgetStatePropertyAll(BorderSide(color: newzColorBlackDark)),
            shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0))))));
