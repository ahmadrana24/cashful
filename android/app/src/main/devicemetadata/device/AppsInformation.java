package com.cashful.devicemetadata.device;

import android.content.Context;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.graphics.drawable.Drawable;
import java.util.List;

public class AppsInformation {
  private final Context context;
  
  public AppsInformation(Context paramContext) {
    this.context = paramContext;
  }
  
  private String getApplicationInfo(String paramString, int paramInt) {
    try {
      PackageInfo packageInfo = this.context.getPackageManager().getPackageInfo(paramString, 128);
      return (paramInt == 1) ? this.versionName : ((paramInt == 2) ? Integer.toString(this.versionCode) : "0");
    } catch (android.content.pm.PackageManager.NameNotFoundException nameNotFoundException) {
      null.printStackTrace();
      return "0";
    } 
  }
  
  public List<ApplicationInfo> getListOfApplicationInfo() {
    return this.context.getPackageManager().getInstalledApplications(128);
  }
  
  public String[] getAllAppsPackageName() {
    List<ApplicationInfo> list;
    String[] arrayOfString = new String[(list = getListOfApplicationInfo()).size()];
    for (byte b = 0; b < size(); b++)
      arrayOfString[b] = ((ApplicationInfo)get(b)).packageName; 
    return arrayOfString;
  }
  
  public String getApplicationName(String paramString) {
    try {
      return (String)this.context.getPackageManager().getApplicationLabel(this.context.getPackageManager().getApplicationInfo(paramString, 128));
    } catch (android.content.pm.PackageManager.NameNotFoundException nameNotFoundException) {
      null.printStackTrace();
      return "Unknown";
    } 
  }
  
  public String getVersionName(String paramString) {
    return getApplicationInfo(paramString, 1);
  }
  
  public int getVersionCode(String paramString) {
    return Integer.parseInt(getApplicationInfo(paramString, 2));
  }
  
  public Drawable getApplicationIcon(String paramString) {
    try {
      return this.context.getPackageManager().getApplicationIcon(paramString);
    } catch (android.content.pm.PackageManager.NameNotFoundException nameNotFoundException) {
      null.printStackTrace();
      return null;
    } 
  }
  
  public long getInstalledTime(String paramString) {
    try {
      return (this.context.getPackageManager().getPackageInfo(paramString, 128)).firstInstallTime;
    } catch (android.content.pm.PackageManager.NameNotFoundException nameNotFoundException) {
      null.printStackTrace();
      return 0L;
    } 
  }
  
  public long getLastUpdatedTime(String paramString) {
    try {
      return (this.context.getPackageManager().getPackageInfo(paramString, 128)).lastUpdateTime;
    } catch (android.content.pm.PackageManager.NameNotFoundException nameNotFoundException) {
      null.printStackTrace();
      return 0L;
    } 
  }
  
  public String[] getRequestedPermissions(String paramString) {
    try {
      return (this.context.getPackageManager().getPackageInfo(paramString, 128)).requestedPermissions;
    } catch (android.content.pm.PackageManager.NameNotFoundException nameNotFoundException) {
      null.printStackTrace();
      return null;
    } 
  }
}


/* Location:              C:\Users\ASUZE\Downloads\cryptoe\\upworkclient\classes.jar!\com\cashful\devicemetadata\device\AppsInformation.class
 * Java compiler version: 8 (52.0)
 * JD-Core Version:       1.1.3
 */