package com.cashful.devicemetadata.device;

import android.annotation.SuppressLint;
import android.content.Context;
import android.nfc.NfcAdapter;
import android.nfc.NfcManager;
import android.os.Build;
import android.provider.Settings;
import android.telephony.SubscriptionManager;
import android.telephony.TelephonyManager;
import android.text.TextUtils;
import androidx.annotation.RequiresApi;
import androidx.annotation.RequiresPermission;
import java.io.File;

public class DeviceInformation {
  private final Context context;
  
  public DeviceInformation(Context paramContext) {
    this.context = paramContext;
  }
  
  private String capitalize(String paramString) {
    if (TextUtils.isEmpty(paramString))
      return paramString; 
    boolean bool = true;
    this();
    StringBuilder stringBuilder;
    char[] arrayOfChar;
    int i = (arrayOfChar = paramString.toCharArray()).length;
    for (byte b = 0; b < i; b++) {
      char c = this[b];
      if (bool && Character.isLetter(c)) {
        bool = false;
      } else {
        if (Character.isWhitespace(c))
          bool = true; 
        stringBuilder.append(c);
      } 
    } 
    return stringBuilder.toString();
  }
  
  public String getModelName() {
    return Build.MODEL;
  }
  
  public String getDeviceName() {
    String str1 = Build.MANUFACTURER;
    String str2;
    return (str2 = Build.MODEL).startsWith(this) ? str2 : this;
  }
  
  public String getManafacturerName() {
    return Build.MANUFACTURER;
  }
  
  public String getBoardName() {
    return Build.BOARD;
  }
  
  public String getHardwareName() {
    return Build.HARDWARE;
  }
  
  public String getBrandName() {
    return Build.BRAND;
  }
  
  @SuppressLint({"HardwareIds"})
  public String getDeviceId() {
    return Settings.Secure.getString(this.context.getContentResolver(), "android_id");
  }
  
  public String getBuildFingerPrint() {
    return Build.FINGERPRINT;
  }
  
  public String getDeviceType() {
    int i;
    return ((i = ((TelephonyManager)this.context.getSystemService("phone")).getPhoneType()) == 2) ? "CDMA" : ((i == 1) ? "GSM" : ((i == 3) ? "SIP" : ""));
  }
  
  public boolean isUsbHostSupported() {
    return this.context.getPackageManager().hasSystemFeature("android.hardware.usb.host");
  }
  
  public int getNumberOfSimSlot() {
    return (Build.VERSION.SDK_INT >= 22) ? SubscriptionManager.from(this.context).getActiveSubscriptionInfoCountMax() : 1;
  }
  
  @Deprecated
  @RequiresApi(api = 23)
  @SuppressLint({"MissingPermission", "HardwareIds"})
  @RequiresPermission("android.permission.READ_PHONE_STATE")
  public String getImei(int paramInt) {
    return ((TelephonyManager)this.context.getSystemService("phone")).getDeviceId(paramInt);
  }
  
  public long getBuildTime() {
    return Build.TIME;
  }
  
  public String getProductName() {
    return Build.PRODUCT;
  }
  
  public String getCodeName() {
    return Build.VERSION.CODENAME;
  }
  
  public String getRadioVersion() {
    return Build.getRadioVersion();
  }
  
  public String getDisplayVersion() {
    return Build.DISPLAY;
  }
  
  public String getHost() {
    return Build.HOST;
  }
  
  public String getBuildUser() {
    return Build.USER;
  }
  
  public String getSerial() {
    return Build.SERIAL;
  }
  
  public boolean isRooted() {
    byte b1;
    String[] arrayOfString;
    (arrayOfString = new String[b1 = 8])[0] = "/sbin";
    (new String[b1 = 8])[1] = "/system/bin";
    (new String[b1 = 8])[2] = "/system/xbin/";
    (new String[b1 = 8])[3] = "/system/sd/xbin";
    (new String[b1 = 8])[4] = "/system/bin/failsafe/";
    (new String[b1 = 8])[5] = "/data/local/xbin/";
    (new String[b1 = 8])[6] = "/data/local/bin/";
    (new String[b1 = 8])[7] = "/data/local/";
    for (byte b2 = 0; b2 < b1; b2++) {
      String str = arrayOfString[b2];
      if ((new File(str + "su")).exists())
        return true; 
    } 
    return false;
  }
  
  public boolean hasNfc() {
    return (((NfcManager)this.context.getSystemService("nfc")).getDefaultAdapter() != null);
  }
  
  public boolean enabledNfc() {
    NfcAdapter nfcAdapter;
    return ((nfcAdapter = ((NfcManager)this.context.getSystemService("nfc")).getDefaultAdapter()) != null && isEnabled());
  }
}


/* Location:              C:\Users\ASUZE\Downloads\cryptoe\\upworkclient\classes.jar!\com\cashful\devicemetadata\device\DeviceInformation.class
 * Java compiler version: 8 (52.0)
 * JD-Core Version:       1.1.3
 */