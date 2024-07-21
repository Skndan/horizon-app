import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:horizon/core/cache/local_manager.dart';
import 'package:horizon/core/extensions/context_extension.dart';
import 'package:horizon/core/extensions/widget_extension.dart';
import 'package:horizon/core/navigation/router_service.dart';
import 'package:horizon/view/home/home.viewmodel.dart';
import 'package:simple_ripple_animation/simple_ripple_animation.dart';
import 'package:solar_icons/solar_icons.dart';

import '../../core/base/base_view.dart';
import '../../core/enums/app_theme.dart';
import '../../core/enums/view_state.dart';
import '../../product/theme/theme.service.dart';
import 'home.widget.dart';

/// Created by Balaji Malathi on 7/21/2024 at 18:13.
class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
      onModelReady: (HomeViewModel model) async {
        model.setContext(context);
        model.init();
        await model.getProfile();
        model.bonsoirInit();
      },
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: SvgPicture.asset(
            ThemeService.getTheme(context) == AppThemes.light
                ? "assets/svg/horizon-dark.svg"
                : "assets/svg/horizon-light.svg",
            height: 40,
          ),
          actions: [
            IconButton(
                onPressed: () async {
                  await model.bonsoirStop();
                  LocalManager.instance.clearAll();
                  RouterService.instance.pushAndClear(Routes.root);
                },
                icon: Icon(SolarIconsOutline.logout))
          ],
        ),
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () async {
        //     // await model.getProfile();
        //   },
        // ),
        body: Column(
          children: [
            model.state == ViewState.Busy
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : ProfileCardWidget(
                    profile: model.profile,
                  ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RippleAnimation(
                    child: CircleAvatar(
                      radius: 40,
                      backgroundColor:
                          model.loadingBroadcast ? Colors.green : Colors.amber,
                      child: Icon(SolarIconsOutline.translation_2),
                    ),
                    color: model.loadingBroadcast ? Colors.green : Colors.amber,
                    delay: const Duration(milliseconds: 300),
                    repeat: true,
                    minRadius: 75,
                    ripplesCount: 6,
                    duration: const Duration(milliseconds: 6 * 300),
                  ),
                  Text(
                    model.broadcastMessage,
                    style: context.textTheme.titleLarge
                        ?.copyWith(fontWeight: FontWeight.w600),
                  ).pt(24)
                ],
              ),
            )
          ],
        ).phv(16, 0),
      ),
    );
  }
}
