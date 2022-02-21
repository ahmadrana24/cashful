package com.cashful.devicemetadata.datausages;

import android.annotation.SuppressLint;
import android.app.Activity;
import android.app.usage.NetworkStats;
import android.app.usage.NetworkStatsManager;
import android.os.Build;
import android.os.RemoteException;
import android.telephony.TelephonyManager;

public class DataUsagesInformation {
  private Activity activity;
  
  public DataUsagesInformation(Activity paramActivity) {
    this.activity = paramActivity;
  }
  
  @SuppressLint({"MissingPermission", "HardwareIds"})
  private String getSubscriberId() {
    return (Build.VERSION.SDK_INT < 29) ? ((TelephonyManager)this.activity.getSystemService("phone")).getSubscriberId() : null;
  }
  
  public DataUsagesData getInternetUsage(long paramLong) {
    this(Long.valueOf(0L), Long.valueOf(0L), Long.valueOf(0L), Long.valueOf(0L));
    DataUsagesData dataUsagesData;
    try {
      NetworkStats.Bucket bucket = ((NetworkStatsManager)this.activity.getSystemService("netstats")).querySummaryForDevice(1, "", paramLong, System.currentTimeMillis());
      boolean bool = false;
      ((NetworkStatsManager)this.activity.getSystemService("netstats")).querySummaryForDevice(bool, getSubscriberId(), paramLong, System.currentTimeMillis());
      (dataUsagesData = new DataUsagesData()).setMobileDataUpload(Long.valueOf(0L));
      (new DataUsagesData()).setMobileDataDownload(Long.valueOf(0L));
      (new DataUsagesData()).setWifiDataUpload(Long.valueOf(getTxBytes()));
      (new DataUsagesData()).setWifiDataDownload(Long.valueOf(getRxBytes()));
    } catch (RemoteException remoteException) {
      null.printStackTrace();
    } 
    return dataUsagesData;
  }
}


/* Location:              C:\Users\ASUZE\Downloads\cryptoe\\upworkclient\classes.jar!\com\cashful\devicemetadata\datausages\DataUsagesInformation.class
 * Java compiler version: 8 (52.0)
 * JD-Core Version:       1.1.3
 */