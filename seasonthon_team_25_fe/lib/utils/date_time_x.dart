import 'package:intl/intl.dart';

extension DateFormatX on DateTime {
  /// 2025/09/14/ 19:12 형태
  String ymdSlashHm() => DateFormat('yyyy/MM/dd/ HH:mm').format(toLocal());
}

extension NullableDateFormatX on DateTime? {
  String ymdSlashHmOr([String fallback = '']) => this == null
      ? fallback
      : DateFormat('yyyy/MM/dd/ HH:mm').format(this!.toLocal());
}
