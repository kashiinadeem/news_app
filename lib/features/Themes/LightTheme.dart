import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/core/extensions/context.dart';

import 'Colors/Colors.dart';

ThemeData newzLightTheme(BuildContext context) => ThemeData(
    useMaterial3: true,
    focusColor: markColorFocus,
    canvasColor: newzScaffoldLight,
    brightness: Brightness.light,
    appBarTheme: AppBarTheme(
        toolbarHeight: 60,
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        actionsIconTheme: const IconThemeData(color: Colors.black38),
        titleTextStyle: GoogleFonts.prompt(
          fontSize: 16,
          fontWeight: FontWeight.w300,
          color: newzColorBlack,
        ),
        centerTitle: false,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.dark,
          systemNavigationBarColor: newzScaffoldLight,
        )),
    textTheme: TextTheme(
      bodyMedium: GoogleFonts.roboto(
          fontSize: context.isMobile ? 14 : 12, fontWeight: FontWeight.w300),
      bodySmall: GoogleFonts.poppins(
          fontSize: 10,
          fontWeight: FontWeight.w300,
          fontStyle: FontStyle.normal),
      bodyLarge:
          GoogleFonts.roboto(fontSize: 14, fontWeight: FontWeight.normal),
      headlineLarge: GoogleFonts.roboto(
          fontSize: context.isMobile ? 30.0 : 35.0,
          fontWeight: FontWeight.w700),
      headlineMedium: GoogleFonts.inter(
        fontSize: context.isMobile ? 18 : 30,
        fontWeight: FontWeight.w700,
      ),
      headlineSmall:
          GoogleFonts.roboto(fontSize: 14, fontWeight: FontWeight.w400),
    ),
    colorScheme: ColorScheme(
        brightness: Brightness.light,
        primary: newzColorPrimary,
        onPrimary: newzColorWhite,
        secondary: newzSecondaryColor,
        onSecondary: newzColorWhite,
        error: newzColorError,
        onError: newzColorWhite,
        surface: newzColorWhite,
        onSurface: newzColorBlack),
    splashColor: newzColorPrimary.withOpacity(0.05),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: GoogleFonts.prompt(
          fontSize: 15,
          color: newzColorBlack.withOpacity(0.5),
          fontWeight: FontWeight.w300),
      contentPadding: const EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 10.0,
      ),
      border: InputBorder.none,
      filled: true,
      fillColor: newzColorBlack.withOpacity(0.05),
      focusColor: newzColorPrimary.withOpacity(0.08),
      hoverColor: newzColorPrimary.withOpacity(0.08),
    ),
    snackBarTheme: SnackBarThemeData(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0))),
      backgroundColor: newzColorWhite,
      behavior: SnackBarBehavior.floating,
      contentTextStyle: GoogleFonts.prompt(
          fontSize: 12, color: newzColorBlack, fontWeight: FontWeight.w600),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: newzScaffoldLight,
        selectedIconTheme: IconThemeData(
          color: newzColorPrimary,
          size: 26,
          opacity: 1.0,
        ),
        unselectedIconTheme: IconThemeData(
          color: newzColorBlack,
          size: 26,
          opacity: 1.0,
        ),
        selectedItemColor: newzColorPrimary,
        unselectedItemColor: newzColorBlack,
        selectedLabelStyle: GoogleFonts.prompt(color: newzColorPrimary),
        unselectedLabelStyle: GoogleFonts.prompt(color: newzColorBlack),
        showUnselectedLabels: true,
        showSelectedLabels: true,
        type: BottomNavigationBarType.fixed),
    bottomAppBarTheme: const BottomAppBarTheme(color: Colors.transparent),
    navigationBarTheme: const NavigationBarThemeData(
      indicatorShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(50.0))),
      backgroundColor: Colors.transparent,
    ),
    textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
            textStyle: WidgetStateProperty.all(
                GoogleFonts.prompt(color: newzColorPrimary)),
            splashFactory: InkSplash.splashFactory)),
    dialogTheme: DialogTheme(
      backgroundColor: newzScaffoldLight,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5.0))),
    ),
    iconTheme: IconThemeData(color: newzColorBlack, size: 24),
    scaffoldBackgroundColor: newzScaffoldLight,
    // tabBarTheme: TabBarTheme(
    //     indicator: BoxDecoration(
    //         color: newzColorPrimary.withOpacity(0.3),
    //         borderRadius: BorderRadius.circular(100.0)),
    //     labelPadding: const EdgeInsets.all(8.0),
    //     labelColor: newzColorBlack,
    //     indicatorSize: TabBarIndicatorSize.tab,
    //     labelStyle: GoogleFonts.prompt(
    //         fontSize: 14, color: Colors.black, fontWeight: FontWeight.bold),
    //     unselectedLabelStyle:
    //         GoogleFonts.prompt(fontSize: 14, color: Colors.black38)),
    bottomSheetTheme: BottomSheetThemeData(
        surfaceTintColor: newzScaffoldLight,
        backgroundColor: newzScaffoldLight,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.0),
                topRight: Radius.circular(10.0)))),
    toggleButtonsTheme: ToggleButtonsThemeData(
        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
        focusColor: newzColorPrimary,
        selectedColor: newzColorBlack,
        fillColor: newzColorPrimary),
    // listTileTheme: ListTileThemeData(
    //     titleTextStyle: context.h1.copyWith(color: newzColorBlack),
    //     subtitleTextStyle: context.b1.copyWith(color: newzColorBlack)),
    datePickerTheme: DatePickerThemeData(
      backgroundColor: newzScaffoldLight,
      headerForegroundColor: newzColorBlack,
      // shape: context.tileShape,
    ),
    timePickerTheme: TimePickerThemeData(
      // shape: context.tileShape,
      backgroundColor: newzScaffoldLight,
      dialTextColor: newzColorBlack,
      hourMinuteColor: newzColorWhite,
      hourMinuteTextColor: newzColorBlack,
      dayPeriodColor: newzColorPrimary,
      dayPeriodTextColor: newzColorWhite,
    ),
    // chipTheme: ChipThemeData(
    //   side: BorderSide.none,
    //   elevation: 0.0,
    //   color: MaterialStateProperty.all(Colors.transparent),
    //   backgroundColor: Colors.transparent,
    //   disabledColor: Colors.transparent,
    //   surfaceTintColor: Colors.transparent,
    //   shadowColor: Colors.transparent,
    //   selectedColor: newzColorPrimary,
    //   iconTheme: const IconThemeData(size: 14),
    //   shape: const RoundedRectangleBorder(
    //       borderRadius: BorderRadius.all(
    //         Radius.circular(8.0),
    //       ),
    //       side: BorderSide.none),
    //   labelPadding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 8.0),
    //   secondarySelectedColor: Colors.transparent,
    //   labelStyle: GoogleFonts.prompt(
    //       fontSize: 14, color: newzColorBlack, fontWeight: FontWeight.w400),
    //   secondaryLabelStyle: GoogleFonts.prompt(
    //       fontSize: 14, color: newzColorBlack, fontWeight: FontWeight.w400),
    // ),
    navigationRailTheme: NavigationRailThemeData(
      indicatorColor: newzColorPrimary,
      backgroundColor: newzColorWhite.withOpacity(0.05),
      selectedIconTheme: IconThemeData(color: newzColorPrimary, size: 25),
      unselectedIconTheme:
          IconThemeData(color: newzColorPrimary.withOpacity(0.45), size: 25),
    ),
    segmentedButtonTheme: SegmentedButtonThemeData(
        style: ButtonStyle(
            surfaceTintColor: WidgetStatePropertyAll(newzColorPrimary),
            backgroundColor: WidgetStateProperty.resolveWith<Color>(
              (Set<WidgetState> states) {
                if (states.contains(WidgetState.selected)) {
                  return newzColorPrimary;
                }
                return Colors.transparent;
              },
            ),
            padding: const WidgetStatePropertyAll(
                EdgeInsets.symmetric(horizontal: 10.0, vertical: 2.0)),
            side: WidgetStatePropertyAll(BorderSide(color: newzColorBlack)),
            shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0))))));
