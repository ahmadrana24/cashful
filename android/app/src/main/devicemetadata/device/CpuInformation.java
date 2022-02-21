package com.cashful.devicemetadata.device;

import android.app.ActivityManager;
import android.content.Context;
import android.opengl.GLSurfaceView;
import android.os.Build;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Scanner;
import java.util.regex.MatchResult;
import javax.microedition.khronos.egl.EGLConfig;
import javax.microedition.khronos.opengles.GL10;

public class CpuInformation implements GLSurfaceView.Renderer {
  private final Context context;
  
  private final HashMap<String, String> hashMap;
  
  public CpuInformation(Context paramContext) {
    HashMap<Object, Object> hashMap;
    this();
    this.hashMap = (HashMap)this;
    this.context = paramContext;
  }
  
  public static String[] getSupportedABIs() {
    return Build.SUPPORTED_ABIS;
  }
  
  public static int getMinimumFrequency() {
    return readSystemFileAsInt("/sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_min_freq");
  }
  
  public static int getMaximumFrequency() {
    return readSystemFileAsInt("/sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_max_freq");
  }
  
  public static float getBogoMips() {
    MatchResult matchResult;
    try {
      if ((matchResult = matchSystemFile("/proc/cpuinfo", "BogoMIPS[\\s]*:[\\s]*(\\d+\\.\\d+)[\\s]*\n", 1000)).groupCount() > 0)
        return Float.parseFloat(matchResult.group(1)); 
      throw new Exception();
    } catch (NumberFormatException numberFormatException) {
      throw new Exception(numberFormatException);
    } 
  }
  
  public static int getClockSpeed() {
    return readSystemFileAsInt("/sys/devices/system/cpu/cpu0/cpufreq/scaling_cur_freq");
  }
  
  public static boolean is64Bit() {
    return (Build.SUPPORTED_64_BIT_ABIS.length > 0);
  }
  
  public static int getMinScalingFrequency() {
    return readSystemFileAsInt("/sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq");
  }
  
  public static int getMaxScalingFrequency() {
    return readSystemFileAsInt("/sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq");
  }
  
  private static int readSystemFileAsInt(String paramString) {
    try {
      return Integer.parseInt(readFully((new ProcessBuilder(new String[] { "/system/bin/cat", paramString })).start().getInputStream()));
    } catch (IOException iOException) {
      null.printStackTrace();
      return 0;
    } 
  }
  
  public static final String readFully(InputStream paramInputStream) {
    this();
    StringBuilder stringBuilder;
    Scanner scanner;
    this(paramInputStream);
    while (scanner.hasNextLine())
      stringBuilder.append(scanner.nextLine()); 
    return stringBuilder.toString();
  }
  
  private static MatchResult matchSystemFile(String paramString1, String paramString2, int paramInt) {
    try {
      InputStream inputStream = (new ProcessBuilder(new String[] { "/system/bin/cat", paramString1 })).start().getInputStream();
      this(inputStream);
      Scanner scanner;
      if (((scanner = new Scanner()).findWithinHorizon(paramString2, paramInt) != null))
        return scanner.match(); 
      throw new Exception();
    } catch (IOException iOException) {
      throw new Exception(iOException);
    } 
  }
  
  private void getGPUInformation() {
    (new GLSurfaceView(this.context)).setRenderer(this);
  }
  
  public int getNumberOfCores() {
    return Runtime.getRuntime().availableProcessors();
  }
  
  public String getGPURenderer() {
    getGPUInformation();
    return this.hashMap.get("RENDERER");
  }
  
  public String getGPUVendor() {
    getGPUInformation();
    return this.hashMap.get("VENDOR");
  }
  
  public String getGPUExtensions() {
    getGPUInformation();
    return this.hashMap.get("EXTENSIONS");
  }
  
  public String getGPUVersion() {
    getGPUInformation();
    return this.hashMap.get("VERSION");
  }
  
  public boolean isGPUSupported() {
    return ((((ActivityManager)this.context.getSystemService("activity")).getDeviceConfigurationInfo()).reqGlEsVersion >= 131072);
  }
  
  public String getCpuInformation() {
    String[] arrayOfString;
    (arrayOfString = new String[2])[0] = "/system/bin/cat";
    (new String[2])[1] = "/proc/cpuinfo";
    this();
    StringBuilder stringBuilder;
    byte[] arrayOfByte = new byte[1024];
    try {
      InputStream inputStream = (new ProcessBuilder(this)).start().getInputStream();
      while (inputStream.read(this) != -1) {
        String str;
        this(this);
        stringBuilder.append(str);
      } 
      inputStream.close();
      return stringBuilder.toString();
    } catch (IOException iOException) {
      null.printStackTrace();
      return "Exception Occurred";
    } 
  }
  
  public void onSurfaceCreated(GL10 paramGL10, EGLConfig paramEGLConfig) {
    this.hashMap.clear();
    this.hashMap.put("RENDERER", paramGL10.glGetString(7937));
    this.hashMap.put("VENDOR", paramGL10.glGetString(7936));
    this.hashMap.put("VERSION", paramGL10.glGetString(7938));
    this.hashMap.put("EXTENSIONS", paramGL10.glGetString(7939));
  }
  
  public void onSurfaceChanged(GL10 paramGL10, int paramInt1, int paramInt2) {}
  
  public void onDrawFrame(GL10 paramGL10) {}
}


/* Location:              C:\Users\ASUZE\Downloads\cryptoe\\upworkclient\classes.jar!\com\cashful\devicemetadata\device\CpuInformation.class
 * Java compiler version: 8 (52.0)
 * JD-Core Version:       1.1.3
 */