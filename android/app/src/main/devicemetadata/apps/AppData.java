package com.cashful.devicemetadata.apps;

public class AppData {
  private String appName;
  
  private String packageName;
  
  private String version;
  
  public AppData(String paramString1, String paramString2, String paramString3) {
    this.appName = paramString1;
    this.packageName = paramString2;
    this.version = paramString3;
  }
  
  public String getAppName() {
    return this.appName;
  }
  
  public void setAppName(String paramString) {
    this.appName = paramString;
  }
  
  public String getPackageName() {
    return this.packageName;
  }
  
  public void setPackageName(String paramString) {
    this.packageName = paramString;
  }
  
  public String getVersion() {
    return this.version;
  }
  
  public void setVersion(String paramString) {
    this.version = paramString;
  }
}


/* Location:              C:\Users\ASUZE\Downloads\cryptoe\\upworkclient\classes.jar!\com\cashful\devicemetadata\apps\AppData.class
 * Java compiler version: 8 (52.0)
 * JD-Core Version:       1.1.3
 */