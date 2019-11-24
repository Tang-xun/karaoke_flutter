package com.example.karaoke_flutter.utils

import android.util.Log
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.MethodChannel

class LogUtils {

    fun main(args: Array<String>) {
        Log.i("LogUtils", "main ::: ")
    }

    companion object {
        const val CHANNEL_NAME = "com.karaoke.channel.logutils"
    }

    fun register(messenger: BinaryMessenger) {
        MethodChannel(messenger, CHANNEL_NAME).setMethodCallHandler { methodCall, result ->
            val tag = methodCall.argument<String>("tag")
            val msg = methodCall.argument<String>("msg")
            when (methodCall.method) {
                "LogI" -> {
                    Log.i(tag, msg)
                }
                "LogV" -> {
                    Log.v(tag, msg)
                }
                "LogD" -> {
                    Log.d(tag, msg)
                }
                "LogW" -> {
                    Log.w(tag, msg)
                }
                "LogE" -> {
                    Log.e(tag, msg)
                }
                else -> Log.i(tag, msg)
            }
            result.success("success")

        }
    }


}