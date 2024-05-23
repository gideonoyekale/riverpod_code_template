import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime? {
  String get chatTimeAgo {
    if (this == null) return '';
    if (isNow) {
      return 'now';
    } else if (isToday) {
      return DateFormat('hh:mm aa').format(this!).toLowerCase();
    } else if (isYesterday) {
      return 'yesterday';
    }
    return DateFormat('dd/MM/yyyy').format(this!);
  }

  bool get isNow {
    if (this == null) return false;
    final now = DateTime.now();
    return (this!.year == now.year) &&
        (this!.month == now.month) &&
        (this!.day == now.day) &&
        (this!.hour == now.hour) &&
        (this!.minute <= now.minute + 1);
  }

  bool get isToday {
    if (this == null) return false;
    final today = DateTime.now();
    return (this!.year == today.year) &&
        (this!.month == today.month) &&
        (this!.day == today.day);
  }

  bool isSameDayAs(DateTime date) {
    if (this == null) return false;
    return (this!.year == date.year) &&
        (this!.month == date.month) &&
        (this!.day == date.day);
  }

  bool get isTomorrow {
    if (this == null) return false;
    final today = DateTime.now();
    final tomorrow = today.add(const Duration(days: 1));
    return (this!.year == tomorrow.year) &&
        (this!.month == tomorrow.month) &&
        (this!.day == tomorrow.day);
  }

  bool get isYesterday {
    if (this == null) return false;
    final today = DateTime.now();
    final yesterday = today.subtract(const Duration(days: 1));
    return (this!.year == yesterday.year) &&
        (this!.month == yesterday.month) &&
        (this!.day == yesterday.day);
  }

  String get appDateFormat {
    if (this == null) return '';
    return DateFormat('dd/MM/yyyy').format(this!);
  }

  String get rideHistoryDateTime {
    if (this == null) return '';
    return DateFormat('hh:mm aa | MMM dd, yyyy').format(this!);
  }
}
