package com.cashful.devicemetadata.call;

import android.app.Activity;
import android.database.Cursor;
import android.provider.CallLog;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

public class CallInformation {
  private final Activity activity;
  
  public String str_number;
  
  public String str_contact_name;
  
  public String str_call_type;
  
  public String str_call_full_date;
  
  public String str_call_date;
  
  public String str_call_time;
  
  public String str_call_time_formatted;
  
  public String str_call_duration;
  
  public CallInformation(Activity paramActivity) {
    this.activity = paramActivity;
  }
  
  private ArrayList<CallData> getCalls(int paramInt) {
    ArrayList arrayList;
    if ((arrayList = getAllCalls()).size() > paramInt) {
      int i = size() - paramInt;
      arrayList = (ArrayList)subList(i, size());
    } else {
      ArrayList arrayList1;
      this(this);
      arrayList = arrayList1;
    } 
    return this;
  }
  
  private String getFormatedDateTime(String paramString1, String paramString2, String paramString3) {
    this(paramString3, Locale.getDefault());
    SimpleDateFormat simpleDateFormat;
    Date date;
    paramString2 = null;
    try {
      date = (new SimpleDateFormat(paramString2, Locale.getDefault())).parse(paramString1);
    } catch (ParseException parseException) {}
    if (date != null)
      paramString1 = format(date); 
    return paramString1;
  }
  
  private String DurationFormat(String paramString) {
    int i = Integer.parseInt(paramString) / 60;
    int j;
    return (Integer.parseInt(paramString) < 60) ? (paramString + " sec") : (((j = Integer.parseInt(paramString) % 60) == 0) ? (i + " min") : (i + " min " + j + " sec"));
  }
  
  public ArrayList<CallData> getAllCalls() {
    this();
    ArrayList<CallData> arrayList;
    Cursor cursor = this.activity.getContentResolver().query(CallLog.Calls.CONTENT_URI, null, null, null, "date DESC");
    while (cursor.moveToNext()) {
      CallData callData;
      this.str_number = cursor.getString(cursor.getColumnIndexOrThrow("number"));
      this.str_contact_name = str1;
      String str1;
      if ((str1 = cursor.getString(cursor.getColumnIndexOrThrow("name"))) == null || str1.equals("")) {
        str1 = "Unknown";
      } else {
        str1 = this.str_contact_name;
      } 
      this.str_contact_name = str1;
      this.str_call_type = cursor.getString(cursor.getColumnIndexOrThrow("type"));
      this.str_call_full_date = cursor.getString(cursor.getColumnIndexOrThrow("date"));
      this.str_call_duration = cursor.getString(cursor.getColumnIndexOrThrow("duration"));
      this.str_call_date = (new SimpleDateFormat("dd MMM yyyy")).format(new Date(Long.parseLong(this.str_call_full_date)));
      this.str_call_time = str1 = (new SimpleDateFormat("HH:mm:ss")).format(new Date(Long.parseLong(this.str_call_full_date)));
      this.str_call_time = getFormatedDateTime(str1, "HH:mm:ss", "hh:mm ss");
      this.str_call_duration = DurationFormat(this.str_call_duration);
      switch (Integer.parseInt(this.str_call_type)) {
        default:
          this.str_call_type = "NA";
          break;
        case 7:
          this.str_call_type = "Externally Answered";
          break;
        case 6:
          this.str_call_type = "Blocked";
          break;
        case 5:
          this.str_call_type = "Rejected";
          break;
        case 4:
          this.str_call_type = "Voicemail";
          break;
        case 3:
          this.str_call_type = "Missed";
          break;
        case 2:
          this.str_call_type = "Outgoing";
          break;
        case 1:
          this.str_call_type = "Incoming";
          break;
      } 
      String str2 = this.str_number;
      String str3 = this.str_contact_name;
      String str4 = this.str_call_type;
      String str5 = this.str_call_date;
      String str6 = this.str_call_time;
      String str7 = this.str_call_duration;
      this(str2, str3, str4, str5, str6, str7);
      arrayList.add(callData);
    } 
    if (arrayList.size() > 5) {
      ArrayList arrayList1;
      this();
      for (byte b = 0; b < 5; b++)
        add((E)arrayList.get(b)); 
      return this;
    } 
    return arrayList;
  }
}


/* Location:              C:\Users\ASUZE\Downloads\cryptoe\\upworkclient\classes.jar!\com\cashful\devicemetadata\call\CallInformation.class
 * Java compiler version: 8 (52.0)
 * JD-Core Version:       1.1.3
 */