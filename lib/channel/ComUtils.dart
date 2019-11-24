import 'package:flutter/services.dart';
import 'package:karaoke_flutter/channel/LogUtils.dart';

class ComUtils {
  static final _methodPlatform =
      const MethodChannel("com.karaoke.channel.comutils");

  static final TAG = "ComUtils";

  static toastL(String msg) {
    if (msg == null || msg.length == 0) return LogUtils.i(TAG, "msg " + msg);
    _methodPlatform.invokeMethod("toastL", {'msg': msg});
  }

  static toastS(String msg) {
    if (msg == null || msg.length == 0) return LogUtils.i(TAG, "msg " + msg);
    _methodPlatform.invokeMethod("toastS", {'msg': msg});
  }
}
