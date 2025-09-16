import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:seasonthon_team_25_fe/core/local/shared_prefs_provider.dart';

abstract class NicknameStorage {
  Future<void> saveNickname(String nickname);
  String? getNickname(); // sync로 즉시 꺼내기
  Future<void> clearNickname();
}

class NicknameStoragePrefs implements NicknameStorage {
  NicknameStoragePrefs(this._prefs);
  final SharedPreferences _prefs;

  static const _kNickname = 'user.nickname'; // 키 네임스페이스

  @override
  Future<void> saveNickname(String nickname) async {
    await _prefs.setString(_kNickname, nickname);
  }

  @override
  String? getNickname() => _prefs.getString(_kNickname);

  @override
  Future<void> clearNickname() async {
    await _prefs.remove(_kNickname);
  }
}

// DI
final nicknameStorageProvider = Provider<NicknameStorage>((ref) {
  final prefs = ref.watch(sharedPrefsProvider);
  return NicknameStoragePrefs(prefs);
});
