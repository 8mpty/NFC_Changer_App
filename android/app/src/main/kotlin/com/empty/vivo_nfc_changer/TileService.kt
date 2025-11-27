// Source: https://dev.to/djsmk123/fluttercreate-custom-quick-title-android-only-3ehp
package com.empty.vivo_nfc_changer

import android.app.PendingIntent
import android.content.Intent
import android.service.quicksettings.TileService
import android.util.Log

class MyTileService: TileService() {

    override fun onClick() {
        super.onClick()

        try {
            val intent = Intent(this, MainActivity::class.java)
            intent.flags = Intent.FLAG_ACTIVITY_NEW_TASK
            
            val pendingIntent = PendingIntent.getActivity(
                this,
                0,
                intent,
                PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_IMMUTABLE
            )
            
            if (isLocked) {
                unlockAndRun {
                    startActivityAndCollapse(pendingIntent)
                }
            } else {
                startActivityAndCollapse(pendingIntent)
            }
            
        } catch (e: Exception) {
            Log.d("debug", "Exception ${e.toString()}")
        }
    }


    override fun onTileAdded() {
        super.onTileAdded()

        // Do something when the user add the Tile
    }

    override fun onStartListening() {
        super.onStartListening()

        // Called when the Tile becomes visible
    }

    override fun onStopListening() {
        super.onStopListening()

        // Called when the tile is no longer visible
    }

}