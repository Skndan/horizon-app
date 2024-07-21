import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../../core/cache/local_manager.dart';
import '../../core/enums/app_theme.dart';
import '../../core/enums/pref.dart';
import '../../core/notifier/theme_notifier.dart';

/// Created by Balaji Malathi on 7/21/2024 at 18:54.

class ThemeService {
  // get current theme
  static AppThemes getTheme(BuildContext context) {
    var theme = LocalManager.instance.getString(Pref.theme);
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    if (theme == 'system') {
      return isDarkMode ? AppThemes.dark : AppThemes.light;
    }
    if (theme == 'light') {
      return AppThemes.light;
    }
    if (theme == 'dark') {
      return AppThemes.dark;
    }

    return AppThemes.dark;
  }

  // switch theme
  static void changeTheme(BuildContext context) {
    AppThemes appThemes =
        getTheme(context) == AppThemes.light ? AppThemes.dark : AppThemes.light;

    context.read<ThemeNotifier>().changeValue(appThemes);
  }
}
