package com.example.karaoke_flutter

import android.os.Bundle
import com.example.karaoke_flutter.utils.ComUtils

import io.flutter.app.FlutterActivity
import io.flutter.plugins.GeneratedPluginRegistrant
import com.example.karaoke_flutter.utils.LogUtils

class MainActivity : FlutterActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        GeneratedPluginRegistrant.registerWith(this)
        registerNativeChannel()
    }

    private fun registerNativeChannel() {
        LogUtils().register(flutterView)
        ComUtils(this).register(flutterView)
    }
}
