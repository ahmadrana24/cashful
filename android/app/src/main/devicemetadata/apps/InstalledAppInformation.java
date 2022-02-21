package com.cashful.devicemetadata.apps;

import android.app.Activity;
import android.content.pm.PackageInfo;
import java.util.ArrayList;
import java.util.List;

public class InstalledAppInformation {
  private final Activity activity;
  
  public InstalledAppInformation(Activity paramActivity) {
    this.activity = paramActivity;
  }
  
  public ArrayList<AppData> getInstalledApps() {
    this();
    ArrayList<AppData> arrayList;
    List list = this.activity.getPackageManager().getInstalledPackages(0);
    for (byte b = 0; b < list.size(); b++) {
      String str1 = ((PackageInfo)list.get(b)).applicationInfo.loadLabel(this.activity.getPackageManager()).toString();
      String str2 = ((PackageInfo)list.get(b)).applicationInfo.packageName;
      String str3 = ((PackageInfo)list.get(b)).versionName;
      arrayList.add(new AppData(str1, str2, str3));
    } 
    if (arrayList.size() > 5) {
      ArrayList arrayList1;
      this();
      for (byte b1 = 0; b1 < 5; b1++)
        add((E)arrayList.get(b1)); 
      return this;
    } 
    return arrayList;
  }
}


/* Location:              C:\Users\ASUZE\Downloads\cryptoe\\upworkclient\classes.jar!\com\cashful\devicemetadata\apps\InstalledAppInformation.class
 * Java compiler version: 8 (52.0)
 * JD-Core Version:       1.1.3
 */