package com.cashful.devicemetadata.device;

import android.content.Context;
import android.os.Build;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.Calendar;
import java.util.Date;
import java.util.Locale;

public class SystemInformation {
  private final Context context;
  
  public SystemInformation(Context paramContext) {
    this.context = paramContext;
  }
  
  public int getApiLevel() {
    return Build.VERSION.SDK_INT;
  }
  
  public String getVersionName() {
    String str;
    if ((str = Build.VERSION_CODES.class.getFields()[Build.VERSION.SDK_INT + 1].getName()).equals("O"))
      str = "Oreo"; 
    if (equals("N"))
      str = "Nougat"; 
    if (equals("M"))
      str = "Marshmallow"; 
    if (startsWith("O_"))
      str = "Oreo++"; 
    if (startsWith("N_"))
      str = "Nougat++"; 
    return this;
  }
  
  public String getSecurityPathDate() {
    if (Build.VERSION.SDK_INT >= 23)
      return Build.VERSION.SECURITY_PATCH; 
    try {
      StringBuilder stringBuilder;
      BufferedReader bufferedReader;
      Process process;
      InputStream inputStream = (process = (new ProcessBuilder(new String[0])).command(new String[] { "/system/bin/getprop" }).redirectErrorStream(true).start()).getInputStream();
      this(new InputStreamReader(inputStream));
      this();
      String str;
      while ((str = bufferedReader.readLine()) != null) {
        stringBuilder.append(str).append("\n");
        if (stringBuilder.toString().contains("security_patch")) {
          String[] arrayOfString;
          if ((arrayOfString = str.split(":")).length == 2)
            return arrayOfString[1]; 
          break;
        } 
      } 
      bufferedReader.close();
      destroy();
    } catch (IOException iOException) {
      null.printStackTrace();
    } 
    return "";
  }
  
  public Date getAndroidSdkReleaseDate() {
    Calendar calendar = Calendar.getInstance();
    int i;
    if ((i = Build.VERSION.SDK_INT) == 1) {
      calendar.set(2, 8);
      calendar.set(5, 23);
      i = 1;
    } else {
      calendar.set(2, 1);
      calendar.set(5, 9);
      i = 1;
      calendar.set(2, 3);
      calendar.set(5, 27);
      i = 1;
      calendar.set(2, 8);
      calendar.set(5, 15);
      i = 1;
      calendar.set(2, 9);
      calendar.set(5, 27);
      i = 1;
      calendar.set(2, 11);
      calendar.set(5, 3);
      i = 1;
      calendar.set(2, 0);
      calendar.set(5, 11);
      i = 1;
      calendar.set(2, 4);
      calendar.set(5, 20);
      i = 1;
      calendar.set(2, 11);
      calendar.set(5, 6);
      i = 1;
      calendar.set(2, 1);
      calendar.set(5, 9);
      i = 1;
      calendar.set(2, 1);
      calendar.set(5, 22);
      i = 1;
      calendar.set(2, 4);
      calendar.set(5, 10);
      i = 1;
      calendar.set(2, 6);
      calendar.set(5, 15);
      i = 1;
      calendar.set(2, 9);
      calendar.set(5, 18);
      i = 1;
      calendar.set(2, 11);
      calendar.set(5, 16);
      i = 1;
      calendar.set(2, 6);
      calendar.set(5, 9);
      i = 1;
      calendar.set(2, 10);
      calendar.set(5, 13);
      i = 1;
      calendar.set(2, 6);
      calendar.set(5, 24);
      i = 1;
      calendar.set(2, 9);
      calendar.set(5, 31);
      i = 1;
      calendar.set(2, 5);
      calendar.set(5, 25);
      i = 1;
      calendar.set(2, 10);
      calendar.set(5, 4);
      i = 1;
      calendar.set(2, 2);
      calendar.set(5, 2);
      i = 1;
      calendar.set(2, 9);
      calendar.set(5, 2);
      i = 1;
      calendar.set(2, 7);
      calendar.set(5, 22);
      i = 1;
      calendar.set(2, 9);
      calendar.set(5, 4);
      i = 1;
      calendar.set(2, 6);
      calendar.set(5, 21);
      i = 1;
      calendar.set(2, 11);
      calendar.set(5, 5);
      i = 1;
      calendar.set(2, 6);
      calendar.set(5, 6);
      i = 1;
      calendar.set(2, 8);
      calendar.set(5, 7);
      i = 1;
      if (i == 30) {
        calendar.set(2, 8);
        calendar.set(5, 8);
        i = 1;
      } else {
        return null;
      } 
    } 
    Object object = (i == 2) ? 'ߙ' : ((i == 3) ? 'ߙ' : ((i == 4) ? 'ߙ' : ((i == 5) ? 'ߙ' : ((i == 6) ? 'ߙ' : ((i == 7) ? 'ߚ' : ((i == 8) ? 'ߚ' : ((i == 9) ? 'ߚ' : ((i == 10) ? 'ߛ' : ((i == 11) ? 'ߛ' : ((i == 12) ? 'ߛ' : ((i == 13) ? 'ߛ' : ((i == 14) ? 'ߛ' : ((i == 15) ? 'ߛ' : ((i == 16) ? 'ߜ' : ((i == 17) ? 'ߜ' : ((i == 18) ? 'ߝ' : ((i == 19) ? 'ߝ' : ((i == 20) ? 'ߞ' : ((i == 21) ? 'ߞ' : ((i == 22) ? 'ߟ' : ((i == 23) ? 'ߟ' : ((i == 24) ? 'ߠ' : ((i == 25) ? 'ߠ' : ((i == 26) ? 'ߡ' : ((i == 27) ? 'ߡ' : ((i == 28) ? 'ߢ' : ((i == 29) ? 'ߣ' : "JD-Core does not support Kotlin")))))))))))))))))))))))))));
    calendar.set(i, object);
    return calendar.getTime();
  }
  
  public String getBootloader() {
    return Build.BOOTLOADER;
  }
  
  public String getKernalVersion() {
    Process process;
    this = null;
    try {
      process = Runtime.getRuntime().exec("uname -a");
    } catch (IOException iOException) {
      null.printStackTrace();
    } 
    try {
      BufferedReader bufferedReader;
      if (waitFor() == 0) {
      
      } else {
      
      } 
      InputStream inputStream = getErrorStream();
      this(new InputStreamReader(this));
      bufferedReader.close();
      return (new BufferedReader()).readLine();
    } catch (InterruptedException interruptedException) {
      null.printStackTrace();
      return "Error";
    } catch (IOException iOException) {
      null.printStackTrace();
      return "Error";
    } 
  }
  
  public String getLanguage() {
    return Locale.getDefault().getLanguage();
  }
  
  public String getIso3Language() {
    return Locale.getDefault().getISO3Language();
  }
  
  public String getCountry() {
    return Locale.getDefault().getCountry();
  }
  
  public String getIso3Country() {
    return Locale.getDefault().getISO3Country();
  }
  
  public String getDisplayCountry() {
    return Locale.getDefault().getDisplayCountry();
  }
  
  public String getDisplayName() {
    return Locale.getDefault().getDisplayName();
  }
  
  public String getDisplayLanguage() {
    return Locale.getDefault().getDisplayLanguage();
  }
  
  public String getLanguageTag() {
    return Locale.getDefault().toLanguageTag();
  }
}


/* Location:              C:\Users\ASUZE\Downloads\cryptoe\\upworkclient\classes.jar!\com\cashful\devicemetadata\device\SystemInformation.class
 * Java compiler version: 8 (52.0)
 * JD-Core Version:       1.1.3
 */