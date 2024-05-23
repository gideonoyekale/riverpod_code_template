import 'dart:convert';
import 'dart:core';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/cores.dart';

class AppLocalStorage {
  final _storageService = LocalStorageService.instance;

  void saveAppState(String state) {
    _storageService.save(StorageKeys.appState, state);
  }

  String getAppState() {
    return _storageService.getString(StorageKeys.appState) ??
        AppState.firstTimer;
  }

// void saveCustomer(Customer? customer) {
//   _storageService.save(
//     StorageKeys.customer,
//     customer == null ? null : jsonEncode(customer.toMap()),
//   );
// }
//
// Customer? getCustomer() {
//   final res = _storageService.getString(StorageKeys.customer);
//   return res == null ? null : Customer.fromJson(jsonDecode(res));
// }
//
// void saveThemeMode(ThemeMode? mode) {
//   _storageService.save(StorageKeys.themeMode, mode?.name);
// }
//
// ThemeMode getThemeMode() {
//   final res = _storageService.getString(StorageKeys.themeMode);
//   if (res == null) return ThemeMode.light;
//   return res == ThemeMode.dark.name ? ThemeMode.dark : ThemeMode.light;
// }
//
// void saveBiometrics(bool? value) {
//   _storageService.saveBool(StorageKeys.biometrics, value);
// }
//
// bool getBiometrics() {
//   final res = _storageService.getBool(StorageKeys.biometrics);
//   return res ?? false;
// }
//
// void saveEmail(String? value) {
//   _storageService.save(StorageKeys.email, value);
// }
//
// String? getEmail() {
//   final res = _storageService.getString(StorageKeys.email);
//   return res;
// }
}

final appLocalStorage = Provider((ref) => AppLocalStorage());
