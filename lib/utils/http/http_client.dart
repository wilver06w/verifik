import 'package:verifik/utils/http/dio.dart';
import 'package:dio/dio.dart';

export 'package:dio/dio.dart';
export 'package:flutter_modular/flutter_modular.dart';

class XigoHttpClient {
  XigoHttpClient._();
  static final _singleton = XigoHttpClient._();

  factory XigoHttpClient() => _singleton;

  late XigoSharedDio _msDio;

  Dio get msDio => _msDio.dio;
  XigoSharedDio get xigoSharedDio => _msDio;

  XigoHttpClient getInstance() {
    _singleton._msDio = XigoSharedDio(
      baseUrl: 'https://demo.verifik.co',
    );
    return _singleton;
  }
}
