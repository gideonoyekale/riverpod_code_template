import 'dart:core';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/cores.dart';

class AuthLocalStorage {
  final _storageService = LocalStorageService.instance;

  void saveAccessToken(String? token) {
    _storageService.save(StorageKeys.accessToken, token);
  }

  String? getAccessToken() {
    return _storageService.getString(StorageKeys.accessToken);
  }

  void saveRefreshToken(String? token) {
    _storageService.save(StorageKeys.refreshToken, token);
  }

  String? getRefreshToken() {
    return _storageService.getString(StorageKeys.refreshToken);
  }
}

final authLocalStorage = Provider((ref) => AuthLocalStorage());
