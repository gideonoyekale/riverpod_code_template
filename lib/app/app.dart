import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:overlay_support/overlay_support.dart';

import '../core/cores.dart';
import 'app_view_model.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(appViewModel);
    return ScreenUtilInit(
      minTextAdapt: true,
      designSize: const Size(375, 812),
      ensureScreenSize: true,
      useInheritedMediaQuery: true,
      builder: (_, child) {
        return OverlaySupport.global(
          child: MaterialApp(
            title: 'Live Coding',
            builder: BotToastInit(),
            themeMode: ThemeMode.light,
            theme: AppThemeData.lightTheme,
            darkTheme: AppThemeData.darkTheme,
            onGenerateRoute: Routes.generateRoute,
            initialRoute: Routes.initialRoute(state.appState),
            onGenerateInitialRoutes: (String initialRoute) =>
                Routes.generateInitialRoute(state.appState),
            debugShowCheckedModeBanner: false,
            navigatorKey: ref.read(navigationService).navigatorKey,
            navigatorObservers: [
              BotToastNavigatorObserver(),
            ],
            // home: OnboardingView(),
          ),
        );
      },
    );
  }
}
