package com.cashful.devicemetadata.device;

import android.annotation.SuppressLint;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.Build;

public class BatteryInformation {
  private final Context context;
  
  public BatteryInformation(Context paramContext) {
    this.context = paramContext;
  }
  
  private Intent getBatteryStatus() {
    this("android.intent.action.BATTERY_CHANGED");
    IntentFilter intentFilter;
    return this.context.registerReceiver(null, this);
  }
  
  public final int getPercentage() {
    int i = 0;
    Intent intent;
    if ((intent = getBatteryStatus()) != null) {
      int j = getIntExtra("level", -1);
      i = (int)(j / getIntExtra("scale", -1) * 100.0F);
    } 
    return i;
  }
  
  public boolean isCharging() {
    int j;
    int i;
    if ((i = getBatteryStatus().getIntExtra("plugged", -1)) == 1 || i == 2) {
      j = 1;
    } else {
      j = 0;
    } 
    if (Build.VERSION.SDK_INT > 16) {
      if (j || i == 4) {
        i = 1;
        return i;
      } 
      i = 0;
      j = i;
    } 
    return j;
  }
  
  public final int getHealth() {
    int i = 0;
    Intent intent;
    if ((intent = getBatteryStatus()) != null)
      i = getIntExtra("health", 0); 
    return i;
  }
  
  public String getTechnology() {
    return getBatteryStatus().getStringExtra("technology");
  }
  
  public float getBatteryTemperature() {
    float f = 0.0F;
    Intent intent;
    if ((intent = getBatteryStatus()) != null)
      f = (intent.getIntExtra("temperature", 0) / 10); 
    return f;
  }
  
  public int getBatteryVoltage() {
    int i = 0;
    Intent intent;
    if ((intent = getBatteryStatus()) != null)
      i = intent.getIntExtra("voltage", 0); 
    return i;
  }
  
  public boolean isBatteryAvailable() {
    return (getBatteryStatus().getExtras() != null && getBatteryStatus().getExtras().getBoolean("present"));
  }
  
  public String getChargingSource() {
    int i;
    return ((i = getBatteryStatus().getIntExtra("plugged", 0)) != 1) ? ((i != 2) ? ((i != 4) ? "UNKNOWN" : "WIRELESS") : "USB") : "AC";
  }
  
  @SuppressLint({"PrivateApi"})
  public double getBatteryCapacity() {
    double d = 0.0D;
    try {
      boolean bool = false;
      (new Object[1])[bool] = this.context;
      d = ((Double)Class.forName("com.android.internal.os.PowerProfile").getMethod("getBatteryCapacity", new Class[0]).invoke(Class.forName("com.android.internal.os.PowerProfile").getConstructor(new Class[] { Context.class }, ).newInstance(new Object[1]), new Object[0])).doubleValue();
    } catch (Exception exception) {
      null.printStackTrace();
    } 
    return d;
  }
}


/* Location:              C:\Users\ASUZE\Downloads\cryptoe\\upworkclient\classes.jar!\com\cashful\devicemetadata\device\BatteryInformation.class
 * Java compiler version: 8 (52.0)
 * JD-Core Version:       1.1.3
 */