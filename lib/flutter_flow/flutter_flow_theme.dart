// ignore_for_file: overridden_fields, annotate_overrides

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class FlutterFlowTheme {
  static FlutterFlowTheme of(BuildContext context) {
    return LightModeTheme();
  }

  @Deprecated('Use primary instead')
  Color get primaryColor => primary;
  @Deprecated('Use secondary instead')
  Color get secondaryColor => secondary;
  @Deprecated('Use tertiary instead')
  Color get tertiaryColor => tertiary;

  late Color primary;
  late Color secondary;
  late Color tertiary;
  late Color alternate;
  late Color primaryText;
  late Color secondaryText;
  late Color primaryBackground;
  late Color secondaryBackground;
  late Color accent1;
  late Color accent2;
  late Color accent3;
  late Color accent4;
  late Color success;
  late Color warning;
  late Color error;
  late Color info;

  late Color violetUltra1;
  late Color jauneOrange1;
  late Color jo2;
  late Color jo3;
  late Color jo4;
  late Color jo5;
  late Color vu2;
  late Color revoBG;
  late Color revoNavSelected;
  late Color revoHooverBlue;
  late Color revoNavSelectedText;
  late Color revoWhite;
  late Color revoCardButtonBg;
  late Color revoCardBlueText;
  late Color revoCardTextColor;
  late Color revoCardTextColorUnselected;
  late Color revoCardColorInactiveTxt;
  late Color revoSearchBarBg;
  late Color revoSearchIconColor;
  late Color revoSearchTxtColor;
  late Color customColor1;
  late Color buttonRevBG;
  late Color buttonRevHover;
  late Color buttonRevText;
  late Color cogeusNavSelected;
  late Color cogeusHoverPurple;
  late Color inputBg;
  late Color inputBgClicked;
  late Color inputNoGood;
  late Color inputNoGoodClicked;
  late Color inputTitleGrey;
  late Color cogeusButtonBG;
  late Color cogeHoverFromWhite;
  late Color vertSympa;
  late Color joliGrisPourTexteLeger;
  late Color shadcnCardBorderGrey;
  late Color shadcnInputSelected;

  @Deprecated('Use displaySmallFamily instead')
  String get title1Family => displaySmallFamily;
  @Deprecated('Use displaySmall instead')
  TextStyle get title1 => typography.displaySmall;
  @Deprecated('Use headlineMediumFamily instead')
  String get title2Family => typography.headlineMediumFamily;
  @Deprecated('Use headlineMedium instead')
  TextStyle get title2 => typography.headlineMedium;
  @Deprecated('Use headlineSmallFamily instead')
  String get title3Family => typography.headlineSmallFamily;
  @Deprecated('Use headlineSmall instead')
  TextStyle get title3 => typography.headlineSmall;
  @Deprecated('Use titleMediumFamily instead')
  String get subtitle1Family => typography.titleMediumFamily;
  @Deprecated('Use titleMedium instead')
  TextStyle get subtitle1 => typography.titleMedium;
  @Deprecated('Use titleSmallFamily instead')
  String get subtitle2Family => typography.titleSmallFamily;
  @Deprecated('Use titleSmall instead')
  TextStyle get subtitle2 => typography.titleSmall;
  @Deprecated('Use bodyMediumFamily instead')
  String get bodyText1Family => typography.bodyMediumFamily;
  @Deprecated('Use bodyMedium instead')
  TextStyle get bodyText1 => typography.bodyMedium;
  @Deprecated('Use bodySmallFamily instead')
  String get bodyText2Family => typography.bodySmallFamily;
  @Deprecated('Use bodySmall instead')
  TextStyle get bodyText2 => typography.bodySmall;

  String get displayLargeFamily => typography.displayLargeFamily;
  TextStyle get displayLarge => typography.displayLarge;
  String get displayMediumFamily => typography.displayMediumFamily;
  TextStyle get displayMedium => typography.displayMedium;
  String get displaySmallFamily => typography.displaySmallFamily;
  TextStyle get displaySmall => typography.displaySmall;
  String get headlineLargeFamily => typography.headlineLargeFamily;
  TextStyle get headlineLarge => typography.headlineLarge;
  String get headlineMediumFamily => typography.headlineMediumFamily;
  TextStyle get headlineMedium => typography.headlineMedium;
  String get headlineSmallFamily => typography.headlineSmallFamily;
  TextStyle get headlineSmall => typography.headlineSmall;
  String get titleLargeFamily => typography.titleLargeFamily;
  TextStyle get titleLarge => typography.titleLarge;
  String get titleMediumFamily => typography.titleMediumFamily;
  TextStyle get titleMedium => typography.titleMedium;
  String get titleSmallFamily => typography.titleSmallFamily;
  TextStyle get titleSmall => typography.titleSmall;
  String get labelLargeFamily => typography.labelLargeFamily;
  TextStyle get labelLarge => typography.labelLarge;
  String get labelMediumFamily => typography.labelMediumFamily;
  TextStyle get labelMedium => typography.labelMedium;
  String get labelSmallFamily => typography.labelSmallFamily;
  TextStyle get labelSmall => typography.labelSmall;
  String get bodyLargeFamily => typography.bodyLargeFamily;
  TextStyle get bodyLarge => typography.bodyLarge;
  String get bodyMediumFamily => typography.bodyMediumFamily;
  TextStyle get bodyMedium => typography.bodyMedium;
  String get bodySmallFamily => typography.bodySmallFamily;
  TextStyle get bodySmall => typography.bodySmall;

  Typography get typography => ThemeTypography(this);
}

class LightModeTheme extends FlutterFlowTheme {
  @Deprecated('Use primary instead')
  Color get primaryColor => primary;
  @Deprecated('Use secondary instead')
  Color get secondaryColor => secondary;
  @Deprecated('Use tertiary instead')
  Color get tertiaryColor => tertiary;

  late Color primary = const Color(0xFF5E35B1);
  late Color secondary = const Color(0xFF666666);
  late Color tertiary = const Color(0xFF999999);
  late Color alternate = const Color(0xFFCCCCCC);
  late Color primaryText = const Color(0xFF000000);
  late Color secondaryText = const Color(0xFF333333);
  late Color primaryBackground = const Color(0xFFFFFFFF);
  late Color secondaryBackground = const Color(0xFFF5F5F5);
  late Color accent1 = const Color(0xFFFF8080);
  late Color accent2 = const Color(0xFF80FF80);
  late Color accent3 = const Color(0xFF8080FF);
  late Color accent4 = const Color(0xFF1C4494);
  late Color success = const Color(0xFF00FF00);
  late Color warning = const Color(0xFFFFCC00);
  late Color error = const Color(0xFFFF0000);
  late Color info = const Color(0xFF00CCFF);

  late Color violetUltra1 = Color(0xFF240046);
  late Color jauneOrange1 = Color(0xFFFF9E00);
  late Color jo2 = Color(0xFFFF9100);
  late Color jo3 = Color(0xFFFF8500);
  late Color jo4 = Color(0xFFFF7900);
  late Color jo5 = Color(0xFFFF6D00);
  late Color vu2 = Color(0xFF3C096C);
  late Color revoBG = Color(0xFFF7F7F7);
  late Color revoNavSelected = Color(0xFFF4F7FE);
  late Color revoHooverBlue = Color(0xFF95B1F1);
  late Color revoNavSelectedText = Color(0xFF2C64E3);
  late Color revoWhite = Color(0xFFFFFFFF);
  late Color revoCardButtonBg = Color(0xFFE8F0FC);
  late Color revoCardBlueText = Color(0xFF376CE4);
  late Color revoCardTextColor = Color(0xFF1A1C1F);
  late Color revoCardTextColorUnselected = Color(0xFF778089);
  late Color revoCardColorInactiveTxt = Color(0xFFBDC4CC);
  late Color revoSearchBarBg = Color(0xFFEDEFF2);
  late Color revoSearchIconColor = Color(0xFF778089);
  late Color revoSearchTxtColor = Color(0xFF778089);
  late Color customColor1 = Color(0xFFBF20E1);
  late Color buttonRevBG = Color(0xFFE8F0FC);
  late Color buttonRevHover = Color(0xFFE2E9F5);
  late Color buttonRevText = Color(0xFF2C64E3);
  late Color cogeusNavSelected = Color(0xFFF3EFFF);
  late Color cogeusHoverPurple = Color(0xFFA795F1);
  late Color inputBg = Color(0xFFEBEBF0);
  late Color inputBgClicked = Color(0xFFE2E2E7);
  late Color inputNoGood = Color(0xFFFBEEEC);
  late Color inputNoGoodClicked = Color(0xFFF9E6E4);
  late Color inputTitleGrey = Color(0xFF717173);
  late Color cogeusButtonBG = Color(0xFFEEE8FC);
  late Color cogeHoverFromWhite = Color(0xFFF8F4FE);
  late Color vertSympa = Color(0xFF52B58E);
  late Color joliGrisPourTexteLeger = Color(0xFF778089);
  late Color shadcnCardBorderGrey = Color(0xFFE4E5E6);
  late Color shadcnInputSelected = Color(0xFFA1A1A9);
}

abstract class Typography {
  String get displayLargeFamily;
  TextStyle get displayLarge;
  String get displayMediumFamily;
  TextStyle get displayMedium;
  String get displaySmallFamily;
  TextStyle get displaySmall;
  String get headlineLargeFamily;
  TextStyle get headlineLarge;
  String get headlineMediumFamily;
  TextStyle get headlineMedium;
  String get headlineSmallFamily;
  TextStyle get headlineSmall;
  String get titleLargeFamily;
  TextStyle get titleLarge;
  String get titleMediumFamily;
  TextStyle get titleMedium;
  String get titleSmallFamily;
  TextStyle get titleSmall;
  String get labelLargeFamily;
  TextStyle get labelLarge;
  String get labelMediumFamily;
  TextStyle get labelMedium;
  String get labelSmallFamily;
  TextStyle get labelSmall;
  String get bodyLargeFamily;
  TextStyle get bodyLarge;
  String get bodyMediumFamily;
  TextStyle get bodyMedium;
  String get bodySmallFamily;
  TextStyle get bodySmall;
}

class ThemeTypography extends Typography {
  ThemeTypography(this.theme);

  final FlutterFlowTheme theme;

  String get displayLargeFamily => 'GeistSans';
  TextStyle get displayLarge => TextStyle(
        fontFamily: 'GeistSans',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 64.0,
      );
  String get displayMediumFamily => 'GeistSans';
  TextStyle get displayMedium => TextStyle(
        fontFamily: 'GeistSans',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 44.0,
      );
  String get displaySmallFamily => 'GeistSans';
  TextStyle get displaySmall => TextStyle(
        fontFamily: 'GeistSans',
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 36.0,
      );
  String get headlineLargeFamily => 'GeistSans';
  TextStyle get headlineLarge => TextStyle(
        fontFamily: 'GeistSans',
        color: theme.primaryText,
        fontWeight: FontWeight.w600,
        fontSize: 32.0,
      );
  String get headlineMediumFamily => 'GeistSans';
  TextStyle get headlineMedium => TextStyle(
        fontFamily: 'GeistSans',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 24.0,
      );
  String get headlineSmallFamily => 'GeistSans';
  TextStyle get headlineSmall => TextStyle(
        fontFamily: 'GeistSans',
        color: theme.primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 24.0,
      );
  String get titleLargeFamily => 'GeistSans';
  TextStyle get titleLarge => TextStyle(
        fontFamily: 'GeistSans',
        color: theme.primaryText,
        fontWeight: FontWeight.w500,
        fontSize: 22.0,
      );
  String get titleMediumFamily => 'GeistSans';
  TextStyle get titleMedium => TextStyle(
        fontFamily: 'GeistSans',
        color: theme.info,
        fontWeight: FontWeight.normal,
        fontSize: 18.0,
      );
  String get titleSmallFamily => 'GeistSans';
  TextStyle get titleSmall => TextStyle(
        fontFamily: 'GeistSans',
        color: theme.info,
        fontWeight: FontWeight.w500,
        fontSize: 16.0,
      );
  String get labelLargeFamily => 'GeistSans';
  TextStyle get labelLarge => TextStyle(
        fontFamily: 'GeistSans',
        color: theme.secondaryText,
        fontWeight: FontWeight.normal,
        fontSize: 16.0,
      );
  String get labelMediumFamily => 'GeistSans';
  TextStyle get labelMedium => TextStyle(
        fontFamily: 'GeistSans',
        color: theme.secondaryText,
        fontWeight: FontWeight.normal,
        fontSize: 14.0,
      );
  String get labelSmallFamily => 'GeistSans';
  TextStyle get labelSmall => TextStyle(
        fontFamily: 'GeistSans',
        color: theme.secondaryText,
        fontWeight: FontWeight.normal,
        fontSize: 12.0,
      );
  String get bodyLargeFamily => 'GeistSans';
  TextStyle get bodyLarge => TextStyle(
        fontFamily: 'GeistSans',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 16.0,
      );
  String get bodyMediumFamily => 'GeistSans';
  TextStyle get bodyMedium => TextStyle(
        fontFamily: 'GeistSans',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 14.0,
      );
  String get bodySmallFamily => 'GeistSans';
  TextStyle get bodySmall => TextStyle(
        fontFamily: 'GeistSans',
        color: theme.primaryText,
        fontWeight: FontWeight.normal,
        fontSize: 12.0,
      );
}

extension TextStyleHelper on TextStyle {
  TextStyle override({
    String? fontFamily,
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    double? letterSpacing,
    FontStyle? fontStyle,
    bool useGoogleFonts = true,
    TextDecoration? decoration,
    double? lineHeight,
    List<Shadow>? shadows,
  }) =>
      useGoogleFonts
          ? GoogleFonts.getFont(
              fontFamily!,
              color: color ?? this.color,
              fontSize: fontSize ?? this.fontSize,
              letterSpacing: letterSpacing ?? this.letterSpacing,
              fontWeight: fontWeight ?? this.fontWeight,
              fontStyle: fontStyle ?? this.fontStyle,
              decoration: decoration,
              height: lineHeight,
              shadows: shadows,
            )
          : copyWith(
              fontFamily: fontFamily,
              color: color,
              fontSize: fontSize,
              letterSpacing: letterSpacing,
              fontWeight: fontWeight,
              fontStyle: fontStyle,
              decoration: decoration,
              height: lineHeight,
              shadows: shadows,
            );
}
