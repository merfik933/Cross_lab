package com.example.your_app_name

import android.os.Bundle
import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.plugin.common.MethodChannel
import java.text.SimpleDateFormat
import java.util.*

class MainActivity: FlutterActivity() {
    private val CHANNEL = "com.example.your_app_name/date"

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        MethodChannel(flutterEngine?.dartExecutor, CHANNEL).setMethodCallHandler { call, result ->
            if (call.method == "getCurrentDate") {
                val currentDate = getCurrentDate()
                result.success(currentDate)
            } else {
                result.notImplemented()
            }
        }
    }

    private fun getCurrentDate(): String {
        val format = SimpleDateFormat("dd.MM.yyyy", Locale.getDefault())
        return format.format(Date())
    }
}
