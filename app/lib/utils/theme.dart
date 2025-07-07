import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,

      primary: Color(0xFFB4870F),
      surfaceTint: Color(0xffD6A82F),
      onPrimary: Color(0xffF5CC5F),
      primaryContainer: Color(0xffFFE293),
      onPrimaryContainer: Color(0xffF2DFB3),

      secondary: Color(0xffE9C50E),
      onSecondary: Color(0xffF4DD68),
      secondaryContainer: Color(0xffFFF4BA),
      onSecondaryContainer: Color(0xffFFC281),
      tertiary: Color(0xffFF901A),

      onTertiary: Color(0xff1958F6),
      tertiaryContainer: Color(0xff7EA2FF),
      onTertiaryContainer: Color(0xffDDE6FF),
      error: Color(0xffF61B19),
      onError: Color(0xffFFA2A1),
      errorContainer: Color(0xffFFE6E6),
      onErrorContainer: Color(0xffFFE6E6),

      onSurface: Color(0xff000000),
      onSurfaceVariant: Color(0xff4A4337),
      outline: Color(0xff8C867D),
      outlineVariant: Color(0xffE3E1E0),
      shadow: Color(0xffF5F4F4),

      surfaceContainer: Color(0xffECECEC),
      surfaceContainerHigh: Color(0xffF1F1F1),
      surfaceContainerHighest: Color(0xffFFFFFF),


      surface: Color(0xffffffff),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2b3133),
      inversePrimary: Color(0xff86d1ea),
      primaryFixed: Color(0xffb3ebff),
      onPrimaryFixed: Color(0xff001f27),
      primaryFixedDim: Color(0xff86d1ea),
      onPrimaryFixedVariant: Color(0xff004e5f),
      secondaryFixed: Color(0xffd9e2ff),
      onSecondaryFixed: Color(0xff001944),
      secondaryFixedDim: Color(0xffb0c6ff),
      onSecondaryFixedVariant: Color(0xff2e4578),
      tertiaryFixed: Color(0xffabf2c9),
      onTertiaryFixed: Color(0xff002112),
      tertiaryFixedDim: Color(0xff90d5ae),
      onTertiaryFixedVariant: Color(0xff005234),
      surfaceDim: Color(0xffd5dbdc),
      surfaceBright: Color(0xfff5fafb),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xffeff5f6),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  ThemeData theme(ColorScheme colorScheme) => ThemeData(
    useMaterial3: true,
    brightness: colorScheme.brightness,
    colorScheme: colorScheme,
    textTheme: textTheme.apply(
      bodyColor: colorScheme.onSurface,
      displayColor: colorScheme.onSurface,
    ),
    scaffoldBackgroundColor: colorScheme.surface,
    canvasColor: colorScheme.surface,
    bottomAppBarTheme: BottomAppBarTheme(color: colorScheme.surface),
  );

  List<ExtendedColor> get extendedColors => [];
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}

TextTheme createTextTheme(
    BuildContext context,
    String bodyFontString,
    String displayFontString,
    ) {
  TextTheme baseTextTheme = Theme.of(context).textTheme;
  TextTheme bodyTextTheme = GoogleFonts.getTextTheme(
    bodyFontString,
    baseTextTheme,
  );
  TextTheme displayTextTheme = GoogleFonts.getTextTheme(
    displayFontString,
    baseTextTheme,
  );
  TextTheme textTheme = displayTextTheme.copyWith(
    bodyLarge: bodyTextTheme.bodyLarge,
    bodyMedium: bodyTextTheme.bodyMedium,
    bodySmall: bodyTextTheme.bodySmall,
    labelLarge: bodyTextTheme.labelLarge,
    labelMedium: bodyTextTheme.labelMedium,
    labelSmall: bodyTextTheme.labelSmall,
    displayLarge: displayTextTheme.displayLarge,
    displayMedium: displayTextTheme.displayMedium,
    displaySmall: displayTextTheme.displaySmall,
    headlineLarge: displayTextTheme.headlineLarge,
    headlineMedium: displayTextTheme.headlineMedium,
    headlineSmall: displayTextTheme.headlineSmall,
    titleLarge: displayTextTheme.titleLarge,
    titleMedium: displayTextTheme.titleMedium,
    titleSmall: displayTextTheme.titleSmall,
  );
  return textTheme;
}