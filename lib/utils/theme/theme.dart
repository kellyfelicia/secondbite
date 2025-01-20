import 'package:flutter/material.dart';
import 'package:project_secondbite/utils/theme/custom_themes/appbar_theme.dart';
import 'package:project_secondbite/utils/theme/custom_themes/bottom_sheet.dart';
import 'package:project_secondbite/utils/theme/custom_themes/checkbox_theme.dart';
import 'package:project_secondbite/utils/theme/custom_themes/chip_theme.dart';
import 'package:project_secondbite/utils/theme/custom_themes/elevated_button_custom.dart';
import 'package:project_secondbite/utils/theme/custom_themes/outlined_button.dart';
import 'package:project_secondbite/utils/theme/custom_themes/text_theme.dart';
import 'package:project_secondbite/utils/theme/custom_themes/text_field.dart';
import 'package:google_fonts/google_fonts.dart';

const Colours = Color(0xFFAC4425);

class ThemeApp {
  ThemeApp._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: GoogleFonts.poppins().fontFamily,
    brightness: Brightness.light,
    primaryColor: Colours,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarCustomTheme.lightAppBarTheme,
    chipTheme: ChipThemes.lightChipTheme,
    textTheme: TextThemes.lightTextTheme,
    elevatedButtonTheme: ElevatedButtonCustomTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: OutlinedButtons.lightOutlinedButton,
    inputDecorationTheme: TextFormFields.lightInputDecorationTheme,
    checkboxTheme: CheckboxCustomTheme.lightCheckboxTheme,
    bottomSheetTheme: BottomSheets.lightBottomSheetTheme,
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: GoogleFonts.poppins().fontFamily,
    brightness: Brightness.dark,
    primaryColor: Colors.black,
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: AppBarCustomTheme.darkAppBarTheme,
    chipTheme: ChipThemes.darkChipTheme,
    textTheme: TextThemes.darkTextTheme,
    elevatedButtonTheme: ElevatedButtonCustomTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: OutlinedButtons.darkOutlinedButton,
    inputDecorationTheme: TextFormFields.darkInputDecorationTheme,
    checkboxTheme: CheckboxCustomTheme.darkCheckboxTheme,
    bottomSheetTheme: BottomSheets.darkBottomSheetTheme,
  );
}
