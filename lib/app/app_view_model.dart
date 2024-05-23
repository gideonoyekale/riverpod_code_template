import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../data/data.dart';
import '../core/cores.dart';

class AppViewModel extends ChangeNotifier {
  final AppRepository _appRepo;

  AppViewModel(this._appRepo) {
    _init();
  }

  String _appState = AppState.firstTimer;
  int _currentIndex = 0;
  int _previousIndex = 0;

  // Location? _location;

  Future<void> _init() async {
    _appState = _appRepo.loadAppState();
    appState = AppState.unauthenticated;
    _changeOverlayStyle();
  }

  void _changeOverlayStyle() {
    if (appState == AppState.unauthenticated) {
      SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Palette.transparent,
        statusBarIconBrightness: Brightness.light,
      ));
    }
  }

  String get appState => _appState;

  set appState(String value) {
    _appState = value;
    notifyListeners();
    _appRepo.saveAppState(value);
  }

  int get currentIndex => _currentIndex;

  set currentIndex(int value) {
    previousIndex = _currentIndex;
    _currentIndex = value;
    notifyListeners();
  }

  int get previousIndex => _previousIndex;

  set previousIndex(int value) {
    _previousIndex = value;
    notifyListeners();
  }
//
// Location? get location => _location;
//
// set location(Location? value) {
//   _location = value;
//   notifyListeners();
//   _appRepo.saveLocation(value);
// }
}

final appViewModel = ChangeNotifierProvider(
  (ref) => AppViewModel(
    ref.read(appRepository),
  ),
);
