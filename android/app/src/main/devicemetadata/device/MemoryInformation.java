package com.cashful.devicemetadata.device;

import android.app.ActivityManager;
import android.content.Context;
import android.os.Environment;
import android.os.StatFs;
import java.io.File;

public class MemoryInformation {
  private Context context;
  
  public MemoryInformation(Context paramContext) {
    this.context = paramContext;
  }
  
  private ActivityManager.MemoryInfo memoryInfo() {
    ActivityManager activityManager = (ActivityManager)this.context.getSystemService("activity");
    getMemoryInfo(new ActivityManager.MemoryInfo());
    return new ActivityManager.MemoryInfo();
  }
  
  public long getTotalRam() {
    return (memoryInfo()).totalMem;
  }
  
  public long getAvailableRam() {
    return (memoryInfo()).availMem;
  }
  
  public long getUsedRam() {
    return getTotalRam() - getAvailableRam();
  }
  
  public boolean isExternalMemoryAvailable() {
    return Environment.getExternalStorageState().equals("mounted");
  }
  
  public long getAvailableInternalMemorySize() {
    File file = Environment.getDataDirectory();
    long l = (new StatFs(getPath())).getBlockSizeLong();
    return (new StatFs(getPath())).getAvailableBlocksLong() * l;
  }
  
  public long getTotalInternalMemorySize() {
    File file = Environment.getDataDirectory();
    long l = (new StatFs(getPath())).getBlockSizeLong();
    return (new StatFs(getPath())).getBlockCountLong() * l;
  }
  
  public long getUsedInternalMemorySize() {
    return (getTotalInternalMemorySize() > getAvailableInternalMemorySize()) ? (getTotalInternalMemorySize() - getAvailableInternalMemorySize()) : -11111111L;
  }
  
  public long getTotalExternalStorageSize() {
    if (isExternalMemoryAvailable()) {
      File file = Environment.getExternalStorageDirectory();
      long l = (new StatFs(getPath())).getBlockSizeLong();
      return (new StatFs(getPath())).getBlockCountLong() * l;
    } 
    return -1111111111L;
  }
  
  public long getAvailableExternalStorageSize() {
    if (isExternalMemoryAvailable()) {
      File file = Environment.getExternalStorageDirectory();
      long l = (new StatFs(getPath())).getBlockSizeLong();
      return (new StatFs(getPath())).getAvailableBlocksLong() * l;
    } 
    return -1111111111L;
  }
  
  public long getUsedExternalStorageSize() {
    return isExternalMemoryAvailable() ? ((getTotalExternalStorageSize() > getAvailableExternalStorageSize()) ? (getTotalExternalStorageSize() - getAvailableExternalStorageSize()) : -1111111111L) : -1111111111L;
  }
}


/* Location:              C:\Users\ASUZE\Downloads\cryptoe\\upworkclient\classes.jar!\com\cashful\devicemetadata\device\MemoryInformation.class
 * Java compiler version: 8 (52.0)
 * JD-Core Version:       1.1.3
 */