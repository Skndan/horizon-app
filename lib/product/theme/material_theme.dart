import "package:flutter/material.dart";
import "package:flutter/scheduler.dart";
import "package:horizon/core/cache/local_manager.dart";
import "package:horizon/core/enums/app_theme.dart";

import "../../config.dart";
import "../../core/enums/pref.dart";

/// Created by Balaji Malathi on 3/3/2024 at 12:55 PM.

class MaterialTheme {
  getTheme() {
    var theme = LocalManager.instance.getString(Pref.theme);
    var brightness =
        SchedulerBinding.instance.platformDispatcher.platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    if (theme == 'system') {
      return isDarkMode ? dark() : light();
    }
    if (theme == 'light') {
      return light();
    }
    if (theme == 'dark') {
      return dark();
    }
  }

  getAppTheme() {
    var theme = LocalManager.instance.getString(Pref.theme);
    if (theme == 'dark') {
      return AppThemes.dark;
    }
    if (theme == 'light') {
      return AppThemes.light;
    }
    if (theme == 'system') {
      return AppThemes.system;
    }
  }

  static MaterialScheme lightScheme() {
    return const MaterialScheme(
      brightness: Brightness.light,
      primary: Color(0xff1a1e2b),
      // Converted from HSL(222.2, 47.4%, 11.2%)
      onPrimary: Color(0xFFFFFFFF),
      // Converted from HSL(210, 40%, 98%)
      secondary: Color(0xfff4f7fa),
      // Converted from HSL(210, 40%, 96.1%)
      onSecondary: Color(0xff1a1e2b),
      // Converted from HSL(222.2, 47.4%, 11.2%)
      surface: Color(0xffffffff),
      // Converted from HSL(0, 0%, 100%)
      onSurface: Color(0xff1a1e2b),
      // Converted from HSL(222.2, 84%, 4.9%)
      background: Color(0xffffffff),
      // Converted from HSL(0, 0%, 100%)
      onBackground: Color(0xff1a1e2b),
      // Converted from HSL(222.2, 84%, 4.9%)
      error: Color(0xffd32f2f),
      // Converted from HSL(0, 84.2%, 60.2%)
      onError: Color(0xfff1f1f1),
      // Converted from HSL(210, 40%, 98%)
      surfaceVariant: Color(0xffe5e5e5),
      // Default value for a light surface variant
      onSurfaceVariant: Color(0xff494949),
      // Default value for on surface variant
      outline: Color(0xffc8c8c8),
      // Default value for outline
      inverseSurface: Color(0xff1a1e2b),
      // Inverse of background
      inverseOnSurface: Color(0xfff1f1f1),
      // Inverse of on background
      primaryContainer: Color(0xff2b3a4f),
      // Adjusted primary container
      onPrimaryContainer: Color(0xfff1f1f1),
      // Inverse of primary
      secondaryContainer: Color(0xffe0e0e0),
      // Adjusted secondary container
      onSecondaryContainer: Color(0xff1a1e2b),
      // Inverse of secondary
      surfaceTint: Color(0xFF1e293b),
      tertiary: Color(0xFF94a3b8),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xFFcbd5e1),
      onTertiaryContainer: Color(0xffffffff),
      errorContainer: Color(0xFFf87171),
      onErrorContainer: Color(0xFFffffff),
      outlineVariant: Color(0xFFcbd5e1),
      shadow: Color(0xFF000000),
      scrim: Color(0xFF000000),
      inversePrimary: Color(0xFF3b82f6),
      primaryFixed: Color(0xFF3b82f6),
      onPrimaryFixed: Color(0xFF0f172a),
      primaryFixedDim: Color(0xFF3b82f6),
      onPrimaryFixedVariant: Color(0xFF1e293b),
      secondaryFixed: Color(0xFF475569),
      onSecondaryFixed: Color(0xFF0f172a),
      secondaryFixedDim: Color(0xFF475569),
      onSecondaryFixedVariant: Color(0xFF1e293b),
      tertiaryFixed: Color(0xFF94a3b8),
      onTertiaryFixed: Color(0xFF0f172a),
      tertiaryFixedDim: Color(0xFF94a3b8),
      onTertiaryFixedVariant: Color(0xFF1e293b),
      surfaceDim: Color(0xFFcbd5e1),
      surfaceBright: Color(0xFFf1f5f9),
      surfaceContainerLowest: Color(0xFFf8fafc),
      surfaceContainerLow: Color(0xFFe2e8f0),
      surfaceContainer: Color(0xFFf1f5f9),
      surfaceContainerHigh: Color(0xFFe5e7eb),
      surfaceContainerHighest: Color(0xFFcbd5e1),
    );
  }

  ThemeData light() {
    return theme(lightScheme().toColorScheme());
  }

  static MaterialScheme darkScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(0xffe6f1ff),
      // Converted from HSL(210, 40%, 98%)
      onPrimary: Color(0xff1a1e2b),
      // Converted from HSL(222.2, 47.4%, 11.2%)
      secondary: Color(0xff2a3b47),
      // Converted from HSL(217.2, 32.6%, 17.5%)
      onSecondary: Color(0xffe6f1ff),
      // Converted from HSL(210, 40%, 98%)
      surface: Color(0xff1a1e2b),
      // Converted from HSL(222.2, 84%, 4.9%)
      onSurface: Color(0xffe6f1ff),
      // Converted from HSL(210, 40%, 98%)
      background: Color(0xff1a1e2b),
      // Converted from HSL(222.2, 84%, 4.9%)
      onBackground: Color(0xffe6f1ff),
      // Converted from HSL(210, 40%, 98%)
      error: Color(0xffa93226),
      // Converted from HSL(0, 62.8%, 30.6%)
      onError: Color(0xffe6f1ff),
      // Converted from HSL(210, 40%, 98%)
      surfaceVariant: Color(0xff2a3b47),
      // Dark surface variant
      onSurfaceVariant: Color(0xffc2c2c2),
      // On dark surface variant
      outline: Color(0xff2a3b47),
      // Dark outline
      inverseSurface: Color(0xffe6f1ff),
      // Inverse of background
      inverseOnSurface: Color(0xff1a1e2b),
      // Inverse of on background
      primaryContainer: Color(0xff1a1e2b),
      // Adjusted primary container
      onPrimaryContainer: Color(0xffe6f1ff),
      // Inverse of primary
      secondaryContainer: Color(0xff2a3b47),
      // Adjusted secondary container
      onSecondaryContainer: Color(0xffe6f1ff),
      // Inverse of secondary
      surfaceTint: Color(0xFF0f172a),
      tertiary: Color(0xFFcbd5e1),
      onTertiary: Color(0xFF334155),
      tertiaryContainer: Color(0xFF475569),
      onTertiaryContainer: Color(0xFF94a3b8),
      errorContainer: Color(0xFFb91c1c),
      onErrorContainer: Color(0xFFf87171),
      outlineVariant: Color(0xFF64748b),
      shadow: Color(0xFF000000),
      scrim: Color(0xFF000000),
      inversePrimary: Color(0xFF8b9cb5),
      primaryFixed: Color(0xFF64748b),
      onPrimaryFixed: Color(0xFF0f172a),
      primaryFixedDim: Color(0xFF475569),
      onPrimaryFixedVariant: Color(0xFF1e293b),
      secondaryFixed: Color(0xFF64748b),
      onSecondaryFixed: Color(0xFF0f172a),
      secondaryFixedDim: Color(0xFF475569),
      onSecondaryFixedVariant: Color(0xFF1e293b),
      tertiaryFixed: Color(0xFF8b9cb5),
      onTertiaryFixed: Color(0xFF0f172a),
      tertiaryFixedDim: Color(0xFF64748b),
      onTertiaryFixedVariant: Color(0xFF1e293b),
      surfaceDim: Color(0xFF334155),
      surfaceBright: Color(0xFF1e293b),
      surfaceContainerLowest: Color(0xFF0f172a),
      surfaceContainerLow: Color(0xFF1e293b),
      surfaceContainer: Color(0xFF334155),
      surfaceContainerHigh: Color(0xFF475569),
      surfaceContainerHighest: Color(0xFF64748b),
    );
  }

  ThemeData dark() {
    return theme(darkScheme().toColorScheme());
  }

  ThemeData theme(ColorScheme colorScheme) => ThemeData(
        useMaterial3: true,
        brightness: colorScheme.brightness,
        fontFamily: Config.fontFamily,
        colorScheme: colorScheme,
        textTheme: const TextTheme().apply(
          bodyColor: colorScheme.onSurface,
          displayColor: colorScheme.onSurface,
        ),
        scaffoldBackgroundColor: colorScheme.surface,
        canvasColor: colorScheme.surface,
        filledButtonTheme: FilledButtonThemeData(
          style: TextButton.styleFrom(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            minimumSize: const Size(double.infinity, 48),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
            filled: true,
            fillColor: colorScheme.surface,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: colorScheme.primary, width: 2.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                  color: colorScheme.primary.withOpacity(0.5), width: 1.0),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: colorScheme.primary, width: 1.0),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: colorScheme.error, width: 1.0),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: colorScheme.error, width: 1.0),
            ),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 14, horizontal: 8.0),
            hintStyle: const TextStyle(
                color: Colors.grey, fontWeight: FontWeight.w500)),
      );

  List<ExtendedColor> get extendedColors => [];
}

class MaterialScheme {
  const MaterialScheme({
    required this.brightness,
    required this.primary,
    required this.surfaceTint,
    required this.onPrimary,
    required this.primaryContainer,
    required this.onPrimaryContainer,
    required this.secondary,
    required this.onSecondary,
    required this.secondaryContainer,
    required this.onSecondaryContainer,
    required this.tertiary,
    required this.onTertiary,
    required this.tertiaryContainer,
    required this.onTertiaryContainer,
    required this.error,
    required this.onError,
    required this.errorContainer,
    required this.onErrorContainer,
    required this.background,
    required this.onBackground,
    required this.surface,
    required this.onSurface,
    required this.surfaceVariant,
    required this.onSurfaceVariant,
    required this.outline,
    required this.outlineVariant,
    required this.shadow,
    required this.scrim,
    required this.inverseSurface,
    required this.inverseOnSurface,
    required this.inversePrimary,
    required this.primaryFixed,
    required this.onPrimaryFixed,
    required this.primaryFixedDim,
    required this.onPrimaryFixedVariant,
    required this.secondaryFixed,
    required this.onSecondaryFixed,
    required this.secondaryFixedDim,
    required this.onSecondaryFixedVariant,
    required this.tertiaryFixed,
    required this.onTertiaryFixed,
    required this.tertiaryFixedDim,
    required this.onTertiaryFixedVariant,
    required this.surfaceDim,
    required this.surfaceBright,
    required this.surfaceContainerLowest,
    required this.surfaceContainerLow,
    required this.surfaceContainer,
    required this.surfaceContainerHigh,
    required this.surfaceContainerHighest,
  });

  final Brightness brightness;
  final Color primary;
  final Color surfaceTint;
  final Color onPrimary;
  final Color primaryContainer;
  final Color onPrimaryContainer;
  final Color secondary;
  final Color onSecondary;
  final Color secondaryContainer;
  final Color onSecondaryContainer;
  final Color tertiary;
  final Color onTertiary;
  final Color tertiaryContainer;
  final Color onTertiaryContainer;
  final Color error;
  final Color onError;
  final Color errorContainer;
  final Color onErrorContainer;
  final Color background;
  final Color onBackground;
  final Color surface;
  final Color onSurface;
  final Color surfaceVariant;
  final Color onSurfaceVariant;
  final Color outline;
  final Color outlineVariant;
  final Color shadow;
  final Color scrim;
  final Color inverseSurface;
  final Color inverseOnSurface;
  final Color inversePrimary;
  final Color primaryFixed;
  final Color onPrimaryFixed;
  final Color primaryFixedDim;
  final Color onPrimaryFixedVariant;
  final Color secondaryFixed;
  final Color onSecondaryFixed;
  final Color secondaryFixedDim;
  final Color onSecondaryFixedVariant;
  final Color tertiaryFixed;
  final Color onTertiaryFixed;
  final Color tertiaryFixedDim;
  final Color onTertiaryFixedVariant;
  final Color surfaceDim;
  final Color surfaceBright;
  final Color surfaceContainerLowest;
  final Color surfaceContainerLow;
  final Color surfaceContainer;
  final Color surfaceContainerHigh;
  final Color surfaceContainerHighest;
}

extension MaterialSchemeUtils on MaterialScheme {
  ColorScheme toColorScheme() {
    return ColorScheme(
      brightness: brightness,
      primary: primary,
      onPrimary: onPrimary,
      primaryContainer: primaryContainer,
      onPrimaryContainer: onPrimaryContainer,
      secondary: secondary,
      onSecondary: onSecondary,
      secondaryContainer: secondaryContainer,
      onSecondaryContainer: onSecondaryContainer,
      tertiary: tertiary,
      onTertiary: onTertiary,
      tertiaryContainer: tertiaryContainer,
      onTertiaryContainer: onTertiaryContainer,
      error: error,
      onError: onError,
      errorContainer: errorContainer,
      onErrorContainer: onErrorContainer,
      background: background,
      onBackground: onBackground,
      surface: surface,
      onSurface: onSurface,
      surfaceVariant: surfaceVariant,
      onSurfaceVariant: onSurfaceVariant,
      outline: outline,
      outlineVariant: outlineVariant,
      shadow: shadow,
      scrim: scrim,
      inverseSurface: inverseSurface,
      onInverseSurface: inverseOnSurface,
      inversePrimary: inversePrimary,
    );
  }
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
