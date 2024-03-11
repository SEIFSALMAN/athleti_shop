import 'package:athleti_shop/utils/theme/custom_themes/appbar_theme.dart';
import 'package:athleti_shop/utils/theme/custom_themes/bottom_sheet_theme.dart';
import 'package:athleti_shop/utils/theme/custom_themes/checkbox_theme.dart';
import 'package:athleti_shop/utils/theme/custom_themes/chip_theme.dart';
import 'package:athleti_shop/utils/theme/custom_themes/elevated_button_theme.dart';
import 'package:athleti_shop/utils/theme/custom_themes/outlined_buttonn_theme.dart';
import 'package:athleti_shop/utils/theme/custom_themes/text_field_theme.dart';
import 'package:athleti_shop/utils/theme/custom_themes/text_theme.dart';
import 'package:flutter/material.dart';

class TAppTheme{
  TAppTheme._();
          /// Light Theme

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    textTheme: TTextTheme.lightTextTheme,
    chipTheme: TChipTheme.lightChipTheme,
    appBarTheme: TAppBarTheme.lightAppBarTheme,
    checkboxTheme: TCheckBoxTheme.lightCheckboxTheme,
    bottomSheetTheme: TBottomSheetTheme.lightBottomSheetTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: TTextFormFieldTheme.lightInputDecorationTheme,
    elevatedButtonTheme: TElevatedButtonTheme.lightElevatedButtonTheme
  );




          /// Dark Theme

      static ThemeData darkTheme = ThemeData(
      useMaterial3: true,
      fontFamily: 'Poppins',
      brightness: Brightness.dark,
      primaryColor: Colors.blue,
      scaffoldBackgroundColor: Colors.black,
      textTheme: TTextTheme.darkTextTheme,
      chipTheme: TChipTheme.darkChipTheme,
      appBarTheme: TAppBarTheme.darkAppBarTheme,
      checkboxTheme: TCheckBoxTheme.darkCheckboxTheme,
      bottomSheetTheme: TBottomSheetTheme.darkBottomSheetTheme,
      outlinedButtonTheme: TOutlinedButtonTheme.darkOutlinedButtonTheme,
      inputDecorationTheme: TTextFormFieldTheme.darkInputDecorationTheme,
      elevatedButtonTheme: TElevatedButtonTheme.darkElevatedButtonTheme

  );
}