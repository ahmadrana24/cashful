package com.cashful.devicemetadata.sms;

public class SmsData {
  private final String id;
  
  private final String address;
  
  private final String message;
  
  private final String readState;
  
  private final String time;
  
  private final String folderName;
  
  public SmsData(String paramString1, String paramString2, String paramString3, String paramString4, String paramString5, String paramString6) {
    this.id = paramString1;
    this.address = paramString2;
    this.message = paramString3;
    this.readState = paramString4;
    this.time = paramString5;
    this.folderName = paramString6;
  }
  
  public String getId() {
    return this.id;
  }
  
  public String getAddress() {
    return this.address;
  }
  
  public String getMessage() {
    return this.message;
  }
  
  public String getReadState() {
    return this.readState;
  }
  
  public String getTime() {
    return this.time;
  }
  
  public String getFolderName() {
    return this.folderName;
  }
}


/* Location:              C:\Users\ASUZE\Downloads\cryptoe\\upworkclient\classes.jar!\com\cashful\devicemetadata\sms\SmsData.class
 * Java compiler version: 8 (52.0)
 * JD-Core Version:       1.1.3
 */