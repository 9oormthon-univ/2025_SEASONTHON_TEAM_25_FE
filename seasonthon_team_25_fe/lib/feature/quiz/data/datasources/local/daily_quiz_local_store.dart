import 'package:shared_preferences/shared_preferences.dart';

class DailyQuizLocalStore {
  DailyQuizLocalStore({this.keyPrefix = ''});
  final String keyPrefix;

  // Keys
  String get _kDateKey => '${keyPrefix}daily_quiz.last_date'; // yyyy-MM-dd
  String get _kSolvedCountKey =>
      '${keyPrefix}daily_quiz.solved_count_today'; // int

  String _dateStr(DateTime dt) => dt.toIso8601String().split('T').first;

  // 오늘 첫 방문 여부
  Future<bool> isFirstVisitToday(DateTime now) async {
    final prefs = await SharedPreferences.getInstance();
    final today = _dateStr(now);
    final last = prefs.getString(_kDateKey);
    return last != today;
  }

  // 오늘 방문 기록하기 (첫 방문 시 호출)
  Future<void> markTodayVisited(DateTime now) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_kDateKey, _dateStr(now));
    // 첫 방문 시 solvedCount 없으면 0으로 초기화
    if (!prefs.containsKey(_kSolvedCountKey)) {
      await prefs.setInt(_kSolvedCountKey, 0);
    }
  }

  // 내부 유틸: 날짜 스코프 보장 + 날짜 바뀌면 카운트 리셋
  Future<void> _ensureTodayScope(SharedPreferences prefs, DateTime now) async {
    final today = _dateStr(now);
    final last = prefs.getString(_kDateKey);
    if (last != today) {
      await prefs.setString(_kDateKey, today);
      await prefs.setInt(_kSolvedCountKey, 0); // 날짜 바뀌면 자동 리셋
    }
  }

  // 오늘 푼 개수 조회
  Future<int> getSolvedCountToday(DateTime now) async {
    final prefs = await SharedPreferences.getInstance();
    await _ensureTodayScope(prefs, now);
    return prefs.getInt(_kSolvedCountKey) ?? 0;
  }

  // 오늘 푼 개수 설정(직접 세팅)
  Future<void> setSolvedCountToday(int count, DateTime now) async {
    final prefs = await SharedPreferences.getInstance();
    await _ensureTodayScope(prefs, now);
    await prefs.setInt(_kSolvedCountKey, count);
  }

  // 한 문제 풀었을 때 +1
  Future<int> increaseSolvedCountToday(DateTime now) async {
    final prefs = await SharedPreferences.getInstance();
    await _ensureTodayScope(prefs, now);
    final current = prefs.getInt(_kSolvedCountKey) ?? 0;
    final next = current + 1;
    await prefs.setInt(_kSolvedCountKey, next);
    return next;
  }

  // 오늘자 플래그/카운트 초기화 (완료 후 호출하기 좋음)
  Future<void> resetTodayFlags(DateTime now) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_kDateKey, _dateStr(now));
    await prefs.setInt(_kSolvedCountKey, 0);
  }
}
