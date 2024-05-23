import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'app/app.dart';
import 'core/cores.dart';

FutureOr<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // final GoogleMapsFlutterPlatform mapsImplementation =
  //     GoogleMapsFlutterPlatform.instance;
  // if (mapsImplementation is GoogleMapsFlutterAndroid) {
  //   mapsImplementation.useAndroidViewSurface = true;
  // }
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Palette.transparent,
    statusBarIconBrightness: Brightness.dark,
  ));
  final localStorage = LocalStorageService.instance;
  await localStorage.init();
  runApp(const ProviderScope(child: App()));
}
