package com.cashful.devicemetadata.call;

public class CallData {
  private final String address;
  
  private final String contactName;
  
  private final String callType;
  
  private final String callDate;
  
  private final String callTime;
  
  private final String callDuration;
  
  public CallData(String paramString1, String paramString2, String paramString3, String paramString4, String paramString5, String paramString6) {
    this.address = paramString1;
    this.contactName = paramString2;
    this.callType = paramString3;
    this.callDate = paramString4;
    this.callTime = paramString5;
    this.callDuration = paramString6;
  }
  
  public String getAddress() {
    return this.address;
  }
  
  public String getContactName() {
    return this.contactName;
  }
  
  public String getCallType() {
    return this.callType;
  }
  
  public String getCallDate() {
    return this.callDate;
  }
  
  public String getCallTime() {
    return this.callTime;
  }
  
  public String getCallDuration() {
    return this.callDuration;
  }
}


/* Location:              C:\Users\ASUZE\Downloads\cryptoe\\upworkclient\classes.jar!\com\cashful\devicemetadata\call\CallData.class
 * Java compiler version: 8 (52.0)
 * JD-Core Version:       1.1.3
 */