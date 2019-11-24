package com.example.karaoke_flutter.utils

import android.content.Context
import android.text.TextUtils
import android.util.Log
import android.widget.Toast
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.MethodChannel

/**
 *  @author: vancetang
 *  @date:   2019-11-25 00:00
 */
class ComUtils(context: Context?) {

    private val applicationContext: Context? = context?.applicationContext

    companion object {
        const val TAG = "ComUtils"
        const val CHANNEL_NAME = "com.karaoke.channel.comutils"
    }

    fun register(messenger: BinaryMessenger) {
        MethodChannel(messenger, CHANNEL_NAME).setMethodCallHandler { methodCall, result ->
            Log.i(TAG ,"onMethodCallHander ::: methodCall -> ${methodCall}")
            val msg = methodCall.argument<String>("msg")
            if (TextUtils.isEmpty(msg)) {
                Log.e(TAG, "Toast error msg is null or empty")
                result.error("Toast error msg is null or empty", "", null)
                return@setMethodCallHandler
            }
            when (methodCall.method) {
                "toastL" -> {
                    toastL(msg!!)
                }
                "toastS" -> {
                    toastS(msg!!)
                }
            }
        }
    }

    private fun toastL(msg: String) {
        Toast.makeText(applicationContext, msg, Toast.LENGTH_LONG).show()
    }

    private fun toastS(msg: String) {
        Toast.makeText(applicationContext, msg, Toast.LENGTH_SHORT).show()
    }
}