package com.edennetwork.flutter_web_app

import android.app.Application
import com.onesignal.OneSignal

const val ONESIGNAL_APP_ID = "75e7a5f7-a8f1-4ef0-964c-49b0978f48e4"

class MainApplication : Application() {
    override fun onCreate() {
        super.onCreate()

        // Logging set to help debug issues, remove before releasing your app.
        OneSignal.setLogLevel(OneSignal.LOG_LEVEL.VERBOSE, OneSignal.LOG_LEVEL.NONE)

        // OneSignal Initialization
        OneSignal.initWithContext(this)
        OneSignal.setAppId(ONESIGNAL_APP_ID)
    }
}