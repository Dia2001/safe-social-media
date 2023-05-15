import 'package:intl/intl.dart';
import 'dart:core';

class DurationUtil {
  static String timeAgoSinceDate(DateTime date) {
    var currentDate = DateTime.now();
    var formatter = new DateFormat('dd/MM/yyyy HH:mm');
    String formattedDate = formatter.format(date);
    String formattedCurrentDate = formatter.format(currentDate);
    Duration timeDiff = currentDate.difference(date);

    if (timeDiff.inMinutes < 1) {
      return 'Vừa xong';
    } else if (timeDiff.inHours < 1) {
      return '${timeDiff.inMinutes} phút trước';
    } else if (timeDiff.inDays < 1) {
      return '${timeDiff.inHours} giờ trước';
    } else {
      return '${timeDiff.inDays} ngày trước';
    }
  }
}
