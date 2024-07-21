import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:form_builder_validators/localization/l10n.dart';
import 'package:horizon/core/cache/local_manager.dart';
import 'package:horizon/product/navigation/route_constant.dart';
import 'package:provider/provider.dart';

import 'core/enums/pref.dart';
import 'core/navigation/router_service.dart';
import 'core/notifier/provider_list.dart';
import 'core/notifier/theme_notifier.dart';
import 'core/responsive/size_config.dart';
import 'locator.dart';
import 'product/navigation/router_generator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // await Analytics.init();

  //Setting up SharedPreferences
  await LocalManager.preferencesInit();

  //DI - GetIt
  setupLocator();

  runApp(const MarkApp());
}

/*

MultiProvider
- All the base providers such as ThemeNotifier and Orientation providers will be added here

LayoutBuilder & OrientationBuilders
- These are responsible for screen sizes and orientations

SizeConfig
- To know screen size and orientation which was retrieved from LayoutBuilder and OrientationBuilder

*/

class MarkApp extends StatefulWidget {
  const MarkApp({Key? key}) : super(key: key);

  @override
  State<MarkApp> createState() => _MarkAppState();
}

class _MarkAppState extends State<MarkApp> {
  bool isAuthenticated = false, vehicleCreated = false;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [...ApplicationProvider.instance.dependItems],
        child: LayoutBuilder(builder: (context, constraint) {
          return OrientationBuilder(builder: (context, orientation) {
            SizeConfig().init(constraint, orientation);
            return MaterialApp(
              scrollBehavior: AppScrollBehavior(),
              title: "Horizon",
              localizationsDelegates: const [FormBuilderLocalizations.delegate],
              initialRoute: LocalManager.instance.getBool(Pref.isLogged)
                  ? Routes.home
                  : Routes.root,
              themeMode: ThemeMode.system,
              onGenerateRoute: RouterGenerator.instance.generateRoute,
              theme: Provider.of<ThemeNotifier>(context).currentTheme,
              navigatorKey: RouterService.instance.navigatorKey,
              debugShowCheckedModeBanner: kReleaseMode,
            );
          });
        }));
  }

  // LocalManager.instance.getBool(Pref.isLogged)
  // ? RouterConstant.home
  //     :
  @override
  void initState() {
    super.initState();
  }
}

class AppScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        PointerDeviceKind.trackpad,
      };
}
