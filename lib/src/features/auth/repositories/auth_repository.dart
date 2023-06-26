import 'dart:async';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:user_list/src/utils/bool_parsing_extension.dart';

class AuthRepository {
  static const _isAuthorizedKey = 'IS_AUTHORIZED';

  final FlutterSecureStorage _flutterSecureStorage;

  final _isAuthorizedStream = StreamController<bool>.broadcast();

  Stream<bool> get isAuthorizedStream => _isAuthorizedStream.stream;

  bool _isAuthorized = false;

  AuthRepository(this._flutterSecureStorage);

  Future<void> init() async {
    _isAuthorized =
        ((await _flutterSecureStorage.read(key: _isAuthorizedKey)) ?? 'false')
            .parseBool();
  }

  bool get isAuthorized => _isAuthorized;

  Future<void> setIsAuthorized(bool isAuthorized) async {
    await _flutterSecureStorage.write(
      key: _isAuthorizedKey,
      value: isAuthorized.toString(),
    );

    _isAuthorizedStream.add(_isAuthorized = isAuthorized);
  }
}
