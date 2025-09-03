import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TokenStorage {
  static const _kAccess = 'accessToken';
  static const _kRefresh = 'refreshToken';
  static const _kType = 'tokenType';
  static const _kExpiresIn = 'expiresIn';

  final FlutterSecureStorage _s;
  TokenStorage(this._s);

  Future<void> saveTokens({
    required String accessToken,
    required String refreshToken,
    required String tokenType,
    required int expiresIn,
  }) async {
    await _s.write(key: _kAccess, value: accessToken);
    await _s.write(key: _kRefresh, value: refreshToken);
    await _s.write(key: _kType, value: tokenType);
    await _s.write(key: _kExpiresIn, value: expiresIn.toString());
  }

  Future<String?> readAccessToken() => _s.read(key: _kAccess);
  Future<String?> readRefreshToken() => _s.read(key: _kRefresh);

  Future<void> clear() async {
    await _s.delete(key: _kAccess);
    await _s.delete(key: _kRefresh);
    await _s.delete(key: _kType);
    await _s.delete(key: _kExpiresIn);
  }
}

final secureStorageProvider = Provider((_) => const FlutterSecureStorage());

final tokenStorageProvider = Provider<TokenStorage>(
  (ref) => TokenStorage(ref.watch(secureStorageProvider)),
);
