package com.example.karaoke_flutter

import android.app.ActivityManager
import android.content.Context
import android.os.Process
import android.util.Log
import io.flutter.app.FlutterApplication

/**
 *  @author: vancetang
 *  @date:   2019-11-25 00:12
 */
class KaraokeApplication : FlutterApplication() {

    companion object {
        const val TAG = "KaraokeApplication"
    }
    override fun onCreate() {
        super.onCreate()

        Log.i(TAG, "${applicationInfo.processName} will start ")

        if (isMainProcess()) {
            Log.i(TAG, "${applicationInfo.processName} is main thread")
        }
    }

    fun getCurrentApplicationName(): String {
        val myPid = Process.myPid()
        var applicationName = ""
        (this.applicationContext.getSystemService(Context.ACTIVITY_SERVICE) as? ActivityManager)?.apply {

            this.runningAppProcesses.forEach { processInfo: ActivityManager.RunningAppProcessInfo? ->
                if (processInfo?.pid == myPid) {
                    applicationName = processInfo.processName
                    return@apply
                }
            }
        }

        return applicationName
    }

    private fun isMainProcess(): Boolean {
        return applicationInfo.processName == getCurrentApplicationName()
    }

}