extension DateTimeExtension on DateTime {
  String get date =>
      '${day.toString().padLeft(2, '0')}-${month.toString().padLeft(2, '0')}-$year';

  String get time {
    final String hourFormat = hour > 12
        ? (hour - 12).toString().padLeft(2, '0')
        : hour.toString().padLeft(2, '0');
    final String minuteFormat = minute.toString().padLeft(2, '0');
    final String amPm = hour >= 12 ? 'pm' : 'am';

    return '$hourFormat:$minuteFormat $amPm';
  }
}
