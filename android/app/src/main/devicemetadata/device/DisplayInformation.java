package com.cashful.devicemetadata.device;

import android.content.ContentResolver;
import android.content.Context;
import android.os.Build;
import android.provider.Settings;
import android.util.DisplayMetrics;
import android.view.WindowManager;
import androidx.annotation.RequiresApi;

public class DisplayInformation {
  private Context context;
  
  public DisplayInformation(Context paramContext) {
    this.context = paramContext;
  }
  
  public int getDisplayHeight() {
    int i = (this.context.getResources().getDisplayMetrics()).heightPixels;
    return getNavigationBarHeight() + i;
  }
  
  public int getDisplayWidth() {
    return (this.context.getResources().getDisplayMetrics()).widthPixels;
  }
  
  public int getNavigationBarHeight() {
    if (Build.VERSION.SDK_INT >= 17) {
      this();
      WindowManager windowManager;
      (windowManager = (WindowManager)this.context.getSystemService("window")).getDefaultDisplay().getMetrics(displayMetrics);
      DisplayMetrics displayMetrics;
      int j = (displayMetrics = new DisplayMetrics()).heightPixels;
      getDefaultDisplay().getRealMetrics(displayMetrics);
      int i;
      return ((i = (new DisplayMetrics()).heightPixels) > j) ? (i - j) : 0;
    } 
    return 0;
  }
  
  public double getPhysicalSize() {
    this();
    DisplayMetrics displayMetrics;
    ((WindowManager)this.context.getSystemService("window")).getDefaultDisplay().getMetrics(this);
    double d = Math.pow((getDisplayWidth() / this.xdpi), 2.0D);
    return Math.sqrt(Math.pow((getDisplayHeight() / this.ydpi), 2.0D) + d);
  }
  
  public float getFontScale() {
    return (this.context.getResources().getConfiguration()).fontScale;
  }
  
  public float getRefreshRate() {
    return ((WindowManager)this.context.getSystemService("window")).getDefaultDisplay().getRefreshRate();
  }
  
  public int getOrientation() {
    return (this.context.getResources().getConfiguration()).orientation;
  }
  
  public int getRotation() {
    int i;
    return ((i = ((WindowManager)this.context.getSystemService("window")).getDefaultDisplay().getRotation()) != 1) ? ((i != 2) ? ((i != 3) ? 0 : 270) : 180) : 90;
  }
  
  @RequiresApi(api = 26)
  public boolean isHdrCapable() {
    return this.context.getResources().getConfiguration().isScreenHdr();
  }
  
  @RequiresApi(api = 30)
  public boolean isNightModeActive() {
    return this.context.getResources().getConfiguration().isNightModeActive();
  }
  
  @RequiresApi(api = 23)
  public boolean isScreenRound() {
    return this.context.getResources().getConfiguration().isScreenRound();
  }
  
  @RequiresApi(api = 26)
  public boolean isScreenWideColorGamut() {
    return this.context.getResources().getConfiguration().isScreenWideColorGamut();
  }
  
  public boolean isBrightnessAutoMode() {
    try {
      return (Settings.System.getInt(this.context.getContentResolver(), "screen_brightness_mode") == 1);
    } catch (android.provider.Settings.SettingNotFoundException settingNotFoundException) {
      null.printStackTrace();
      return false;
    } 
  }
  
  public int getBrightnessLevel() {
    ContentResolver contentResolver;
    int i = 0;
    int j = 0;
    try {
      j = Settings.System.getInt(contentResolver = this.context.getContentResolver(), "screen_brightness_mode");
    } catch (android.provider.Settings.SettingNotFoundException settingNotFoundException) {
      null.printStackTrace();
    } 
    if (j == 1) {
      i = 1;
      Settings.System.putInt(this, "screen_brightness_mode", 0);
    } 
    i = Settings.System.getInt(this, "screen_brightness", 125);
    if (i == 1)
      Settings.System.putInt(this, "screen_brightness_mode", 1); 
    return i;
  }
  
  public void triggerBrightnessMode() {
    ContentResolver contentResolver;
    try {
      if (Settings.System.getInt(contentResolver = this.context.getContentResolver(), "screen_brightness_mode") == 1) {
      
      } else {
      
      } 
      Settings.System.putInt(this, "screen_brightness_mode", 1);
    } catch (android.provider.Settings.SettingNotFoundException settingNotFoundException) {
      null.printStackTrace();
    } 
  }
  
  public int getScreenTimeout() {
    try {
      return Settings.System.getInt(this.context.getContentResolver(), "screen_off_timeout");
    } catch (android.provider.Settings.SettingNotFoundException settingNotFoundException) {
      null.printStackTrace();
      return 0;
    } 
  }
}


/* Location:              C:\Users\ASUZE\Downloads\cryptoe\\upworkclient\classes.jar!\com\cashful\devicemetadata\device\DisplayInformation.class
 * Java compiler version: 8 (52.0)
 * JD-Core Version:       1.1.3
 */