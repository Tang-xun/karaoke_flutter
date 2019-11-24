import 'package:flutter/services.dart';

class LogUtils {
  static const __platform = const MethodChannel('com.karaoke.channel.logutils');

  static void i(String tag, String msg) {
    __platform.invokeMethod("LogI", {'tag': tag, 'msg': msg});
  }

  static void v(String tag, String msg) {
    __platform.invokeMethod("LogV", {'tag': tag, 'msg': msg});
  }

  static void w(String tag, String msg) {
    __platform.invokeMethod("LogW", {'tag': tag, 'msg': msg});
  }

  static void e(String tag, String msg) {
    __platform.invokeMethod("LogE", {'tag': tag, 'msg': msg});
  }

  static void d(String tag, String msg) {
    __platform.invokeMethod("LogD", {'tag': tag, 'msg': msg});
  }
}
