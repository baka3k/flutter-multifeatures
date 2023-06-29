import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';

class Log {
  const Log._();
  
  static String get time => DateFormat('HH:mm:ss').format(DateTime.now());
  static final _logFull = Logger();
  static final _log = Logger(
    printer: PrettyPrinter(
      methodCount: 0,
      errorMethodCount: 0,
      noBoxingByDefault: true,
      printEmojis: false,
    ),
  );

  /// set [printStackTrace] = true to print stack trace
  static void d(Object msg, {int? maxLength, bool printStackTrace = false}) {
    final text = '$msg';
    final limitText = _cutLength(text, maxLength);
    if (kDebugMode) {
      if(printStackTrace) {
        _logFull.d('[$time] $limitText');
      } else {
        _log.i('[$time] $limitText');
      }
    }
  }

  /// set [printStackTrace] = false to not print stack trace
  static void e(Object msg, {int? maxLength, bool printStackTrace = true}) {
    final text = '$msg';
    final limitText = _cutLength(text, maxLength);
    if (kDebugMode) {if(printStackTrace) {
        _logFull.e('[$time] $limitText');
      } else {
        _log.e('[$time] $limitText');
      }
    }
  }

  static String _cutLength(String? text, int? length) {
    if (text == null) return '';
    if (length == null) return text;
    return text.length < length ? text : '${text.substring(0, length)}<...>"';
  }
}
