package com.cashful.devicemetadata.datausages;

public class DataUsagesData {
  private Long mobileDataUpload;
  
  private Long mobileDataDownload;
  
  private Long wifiDataUpload;
  
  private Long wifiDataDownload;
  
  public DataUsagesData(Long paramLong1, Long paramLong2, Long paramLong3, Long paramLong4) {
    this.mobileDataUpload = paramLong1;
    this.mobileDataDownload = paramLong2;
    this.wifiDataUpload = paramLong3;
    this.wifiDataDownload = paramLong4;
  }
  
  public Long getMobileDataUpload() {
    return this.mobileDataUpload;
  }
  
  public void setMobileDataUpload(Long paramLong) {
    this.mobileDataUpload = paramLong;
  }
  
  public Long getMobileDataDownload() {
    return this.mobileDataDownload;
  }
  
  public void setMobileDataDownload(Long paramLong) {
    this.mobileDataDownload = paramLong;
  }
  
  public Long getWifiDataUpload() {
    return this.wifiDataUpload;
  }
  
  public void setWifiDataUpload(Long paramLong) {
    this.wifiDataUpload = paramLong;
  }
  
  public Long getWifiDataDownload() {
    return this.wifiDataDownload;
  }
  
  public void setWifiDataDownload(Long paramLong) {
    this.wifiDataDownload = paramLong;
  }
}


/* Location:              C:\Users\ASUZE\Downloads\cryptoe\\upworkclient\classes.jar!\com\cashful\devicemetadata\datausages\DataUsagesData.class
 * Java compiler version: 8 (52.0)
 * JD-Core Version:       1.1.3
 */