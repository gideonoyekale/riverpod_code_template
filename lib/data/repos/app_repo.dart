import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../data.dart';

class AppRepository {
  final AppLocalStorage _localStorage;

  AppRepository(this._localStorage);

  //
  // //@override
  // String? loadToken() => _localStorage.getToken();
  //
  // //@override
  String loadAppState() => _localStorage.getAppState();


  //
  // //@override
  // ThemeMode loadThemeMode() => _localStorage.getThemeMode();
  //
  // //@override
  // Customer? loadCustomer() => _localStorage.getCustomer();
  //
  // bool loadBiometrics() => _localStorage.getBiometrics();
  //
  // String? loadEmail() => _localStorage.getEmail();
  //
  // //@override
  void saveAppState(String state) {
    _localStorage.saveAppState(state);
  }
//
// //@override
// void saveCustomer(Customer? customer) {
//   _localStorage.saveCustomer(customer);
// }
//
// //@override
// void saveThemeMode(ThemeMode mode) {
//   _localStorage.saveThemeMode(mode);
// }
//
// //@override
// void saveToken(String? token) {
//   _localStorage.saveToken(token);
// }
//
// void saveBiometrics(bool? value) {
//   _localStorage.saveBiometrics(value);
// }
//
// void saveEmail(String? value) {
//   _localStorage.saveEmail(value);
// }
//
// void reset() {
//   saveToken(null);
//   saveAppState(AppState.unauthenticated);
//   saveCustomer(null);
// }
}

final appRepository = Provider(
  (ref) => AppRepository(ref.read(appLocalStorage)),
);
