import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../data/data.dart';
import '../cores.dart';

class NetworkService {
  final NavigationService _navigationService;
  final AuthLocalStorage _localStorage;
  final AppLocalStorage _appLocalStorage;

  NetworkService(
    this._navigationService,
    this._localStorage,
    this._appLocalStorage,
  );

  String? get accessToken => _localStorage.getAccessToken();

  // String? get accessToken => _localStorage.getAccessToken();

  Dio get _dio => Dio(
        BaseOptions(
          headers: {
            'Authorization': accessToken == null ? null : 'Bearer $accessToken',
          },
          contentType: Headers.jsonContentType,
          responseType: ResponseType.json,
        ),
      )..interceptors.add(LoggingInterceptor(onLogout: () {}));

  Future<dynamic> get(String path, {Map<String, dynamic>? queryParams}) async {
    try {
      final res = await _dio.get(path, queryParameters: queryParams);
      return res.data;
    } on DioException catch (e) {
      return await _handleError(e);
    }
  }

  Future<dynamic> post(
    String path, {
    Object? data,
  }) async {
    try {
      final res = await _dio.post(path, data: data);
      return res.data;
    } on DioException catch (e) {
      return await _handleError(e);
    }
  }

  Future<dynamic> postFormData(
    String path, {
    Object? data,
    Map<String, dynamic>? file,
  }) async {
    try {
      final res = await _dio.post(
        path,
        data: _generateFormData(data, file),
      );
      return res.data;
    } on DioException catch (e) {
      return await _handleError(e);
    }
  }

  Future<dynamic> patchFormData(
    String path, {
    Object? data,
    Map<String, dynamic>? file,
  }) async {
    try {
      final res = await _dio.patch(
        path,
        data: _generateFormData(data, file),
      );
      return res.data;
    } on DioException catch (e) {
      return await _handleError(e);
    }
  }

  Future<dynamic> patch(String path, {Object? data}) async {
    try {
      final res = await _dio.patch(path, data: data);
      return res.data;
    } on DioException catch (e) {
      return await _handleError(e);
    }
  }

  Future<dynamic> put(String path, {Object? data}) async {
    try {
      final res = await _dio.put(path, data: data);
      return res.data;
    } on DioException catch (e) {
      return await _handleError(e);
    }
  }

  Future<dynamic> delete(String path) async {
    try {
      final res = await _dio.delete(path);
      return res.data;
    } on DioException catch (e) {
      return await _handleError(e);
    }
  }

  Future<dynamic> _handleError(DioException error) async {
    if (error.response?.statusCode == 401 ||
        error.response?.statusCode == 403) {
      return await _refreshToken(error);
    } else {
      throw ApiFailure(error.message ?? 'Something went wrong!');
    }
  }

  FormData _generateFormData(Object? data, Map<String, dynamic>? file) {
    Map<String, dynamic> map = <String, dynamic>{};
    if (file != null) {
      for (var value in file.entries) {
        if (value.value is List) {
          map[value.key] = (value.value as List)
              .map((e) => MultipartFile.fromFileSync(e))
              .toList();
        } else {
          map[value.key] = MultipartFile.fromFileSync(value.value);
        }
      }
    }
    FormData formData = FormData.fromMap(map);
    if (data != null) {
      formData.fields.addAll((data as Map<String, String>).entries);
    }
    return formData;
  }

  Future<dynamic> _refreshToken(DioException error) async {
    Console.log('==>', "<== REFRESHING TOKEN ==>");
    try {
      final res = await _dio.post(
        Endpoints.refreshToken,
        data: {"refresh": _localStorage.getRefreshToken()},
      );
      _localStorage.saveAccessToken(res.data['access']);
      _localStorage.saveRefreshToken(res.data['refresh']);
      error.requestOptions.headers["Authorization"] =
          "Bearer ${res.data['access']}";
      //create request with new access token
      final opts = Options(
        method: error.requestOptions.method,
        headers: error.requestOptions.headers,
      );
      final finalRes = await _dio.request(
        error.requestOptions.path,
        options: opts,
        data: error.requestOptions.data,
        queryParameters: error.requestOptions.queryParameters,
      );
      return finalRes.data;
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        _closeSession();
      } else {
        throw ApiFailure(error.message ?? 'Something went wrong!');
      }
    }
  }

  void _closeSession() {
    _appLocalStorage.saveAppState(AppState.unauthenticated);
    _localStorage.saveRefreshToken(null);
    _localStorage.saveAccessToken(null);
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Palette.transparent,
      statusBarIconBrightness: Brightness.light,
    ));
    throw 'Session Expired. Please sign in.';
  }
}

final networkService = Provider(
  (ref) {
    return NetworkService(
      ref.read(navigationService),
      ref.read(authLocalStorage),
      ref.read(appLocalStorage),
    );
  },
);
