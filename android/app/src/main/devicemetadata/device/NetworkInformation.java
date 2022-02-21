package com.cashful.devicemetadata.device;

import android.annotation.SuppressLint;
import android.annotation.TargetApi;
import android.content.Context;
import android.net.ConnectivityManager;
import android.net.LinkProperties;
import android.net.Network;
import android.net.RouteInfo;
import android.net.wifi.WifiManager;
import android.os.Build;
import android.provider.Settings;
import android.util.Log;
import androidx.annotation.RequiresApi;
import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.LineNumberReader;
import java.lang.reflect.Method;
import java.net.InetAddress;
import java.net.NetworkInterface;
import java.net.SocketException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

public class NetworkInformation {
  private static final String TAG = "NetworkInformation";
  
  private static final String[] FACTORY_DNS_SERVERS = new String[] { "8.8.8.8", "8.8.4.4" };
  
  private static final String METHOD_EXEC_PROP_DELIM = "]: [";
  
  private Context context;
  
  public NetworkInformation(Context paramContext) {
    this.context = paramContext;
  }
  
  private String[] getServersMethodConnectivityManager() {
    if (Build.VERSION.SDK_INT >= 21)
      try {
        ArrayList<String> arrayList1;
        ArrayList<String> arrayList2;
        this();
        this();
        ConnectivityManager connectivityManager;
        if ((connectivityManager = (ConnectivityManager)this.context.getSystemService("connectivity")) != null) {
          Network[] arrayOfNetwork;
          int i = (arrayOfNetwork = connectivityManager.getAllNetworks()).length;
          for (byte b = 0; b < i; b++) {
            Network network;
            if (connectivityManager.getNetworkInfo(network = arrayOfNetwork[b]).isConnected()) {
              Iterator<InetAddress> iterator;
              List list = connectivityManager.getLinkProperties(network).getDnsServers();
              if (linkPropertiesHasDefaultRoute(connectivityManager.getLinkProperties(network))) {
                iterator = list.iterator();
                while (iterator.hasNext())
                  arrayList1.add(((InetAddress)iterator.next()).getHostAddress()); 
              } else {
                iterator = iterator.iterator();
                while (iterator.hasNext())
                  arrayList2.add(((InetAddress)iterator.next()).getHostAddress()); 
              } 
            } 
          } 
        } 
        if (arrayList1.isEmpty())
          arrayList1.addAll(arrayList2); 
        if (arrayList1.size() > 0)
          return arrayList1.<String>toArray(new String[0]); 
      } catch (Exception exception) {
        Log.d("NetworkInformation", "Exception detecting DNS servers using ConnectivityManager method", this);
      }  
    return null;
  }
  
  private String[] getServersMethodSystemProperties() {
    if (Build.VERSION.SDK_INT < 26) {
      ArrayList arrayList;
      this();
      try {
        Method method = Class.forName("android.os.SystemProperties").getMethod("get", new Class[] { String.class });
        byte b1;
        String[] arrayOfString;
        (arrayOfString = new String[b1 = 4])[0] = "net.dns1";
        (new String[b1 = 4])[1] = "net.dns2";
        (new String[b1 = 4])[2] = "net.dns3";
        (new String[b1 = 4])[3] = "net.dns4";
        for (byte b2 = 0; b2 < b1; b2++) {
          boolean bool = false;
          Object[] arrayOfObject;
          (arrayOfObject = new Object[1])[bool] = arrayOfString[b2];
          String str;
          if ((str = (String)method.invoke(null, arrayOfObject)) != null && (str.matches("^\\d+(\\.\\d+){3}$") || str.matches("^[0-9a-f]+(:[0-9a-f]*)+:[0-9a-f]+$")) && !contains(str))
            add((E)str); 
        } 
        if (size() > 0)
          return toArray(new String[0]); 
      } catch (Exception exception) {
        Log.d("NetworkInformation", "Exception detecting DNS servers using SystemProperties method", this);
      } 
    } 
    return null;
  }
  
  private String[] getServersMethodExec() {
    if (Build.VERSION.SDK_INT >= 16)
      try {
        InputStream inputStream = Runtime.getRuntime().exec("getprop").getInputStream();
        Set<String> set;
        if ((set = methodExecParseProps(new LineNumberReader(new InputStreamReader(this)))) != null && size() > 0)
          return toArray(new String[0]); 
      } catch (Exception exception) {
        Log.d("NetworkInformation", "Exception in getServersMethodExec", this);
      }  
    return null;
  }
  
  private Set<String> methodExecParseProps(BufferedReader paramBufferedReader) {
    this(10);
    HashSet hashSet;
    String str;
    while ((str = paramBufferedReader.readLine()) != null) {
      int i;
      if ((i = str.indexOf("]: [")) == -1)
        continue; 
      String str2 = str.substring(1, i);
      i += 4;
      int j;
      if ((j = str.length() - 1) < i) {
        Log.d("NetworkInformation", "Malformed property detected: \"" + str + '"');
        continue;
      } 
      InetAddress inetAddress;
      String str1;
      if ((str = str.substring(i, j)).isEmpty() || (!str2.endsWith(".dns") && !str2.endsWith(".dns1") && !str2.endsWith(".dns2") && !str2.endsWith(".dns3") && !str2.endsWith(".dns4")) || (inetAddress = InetAddress.getByName(str)) == null || (str1 = inetAddress.getHostAddress()) == null || str1.length() == 0)
        continue; 
      add((E)str1);
    } 
    return this;
  }
  
  @TargetApi(21)
  private boolean linkPropertiesHasDefaultRoute(LinkProperties paramLinkProperties) {
    Iterator iterator = paramLinkProperties.getRoutes().iterator();
    while (hasNext()) {
      if (((RouteInfo)next()).isDefaultRoute())
        return true; 
    } 
    return false;
  }
  
  private boolean isvpn1() {
    String str = "";
    try {
      Iterator<NetworkInterface> iterator = Collections.<NetworkInterface>list(NetworkInterface.getNetworkInterfaces()).iterator();
      while (iterator.hasNext()) {
        NetworkInterface networkInterface;
        if ((networkInterface = iterator.next()).isUp())
          str = networkInterface.getName(); 
        Log.d("DEBUG", "IFACE NAME: " + this);
        if (contains("tun") || contains("ppp") || contains("pptp"))
          return true; 
      } 
    } catch (SocketException socketException) {
      null.printStackTrace();
    } 
    return false;
  }
  
  @RequiresApi(api = 23)
  private boolean isvpn2() {
    return ((ConnectivityManager)this.context.getSystemService("connectivity")).getNetworkCapabilities(((ConnectivityManager)this.context.getSystemService("connectivity")).getActiveNetwork()).hasTransport(4);
  }
  
  @SuppressLint({"DefaultLocale"})
  public String getIpAddress(boolean paramBoolean) {
    String str = "";
    try {
      Iterator<NetworkInterface> iterator = Collections.<NetworkInterface>list(NetworkInterface.getNetworkInterfaces()).iterator();
      while (iterator.hasNext()) {
        Iterator<InetAddress> iterator1 = Collections.<InetAddress>list(((NetworkInterface)iterator.next()).getInetAddresses()).iterator();
        while (iterator1.hasNext()) {
          InetAddress inetAddress;
          if (!(inetAddress = iterator1.next()).isLoopbackAddress()) {
            boolean bool;
            String str1;
            if ((str1 = inetAddress.getHostAddress()).indexOf(':') < 0) {
              bool = true;
            } else {
              bool = false;
            } 
            if (paramBoolean) {
              if (bool)
                str = str1; 
              continue;
            } 
            if (!bool) {
              int i;
              if ((i = str1.indexOf('%')) < 0) {
              
              } else {
              
              } 
              String str2 = str1.substring(0, i);
            } 
          } 
        } 
      } 
    } catch (SocketException socketException) {
      null.printStackTrace();
      int i = ((WifiManager)this.context.getSystemService("wifi")).getConnectionInfo().getIpAddress();
      arrayOfObject[0] = Integer.valueOf(i & 0xFF);
      arrayOfObject[1] = Integer.valueOf(i >> 8 & 0xFF);
      arrayOfObject[2] = Integer.valueOf(i >> 16 & 0xFF);
      Object[] arrayOfObject;
      (arrayOfObject = new Object[4])[3] = Integer.valueOf(i >> 24 & 0xFF);
      str = String.format("%d.%d.%d.%d", arrayOfObject);
    } 
    return str;
  }
  
  public String[] getServers() {
    String[] arrayOfString1;
    String[] arrayOfString2;
    return ((arrayOfString2 = getServersMethodSystemProperties()) != null && arrayOfString2.length > 0) ? arrayOfString2 : (((arrayOfString2 = getServersMethodConnectivityManager()) != null && arrayOfString2.length > 0) ? arrayOfString2 : (((arrayOfString1 = getServersMethodExec()) != null && this.length > 0) ? this : FACTORY_DNS_SERVERS));
  }
  
  public boolean isADBDebuggingEnabled() {
    return (Settings.Secure.getInt(this.context.getContentResolver(), "adb_enabled", 0) > 0);
  }
  
  @RequiresApi(api = 23)
  public boolean isVpnConnection() {
    if (Settings.Secure.getInt(this.context.getContentResolver(), "vpn_state", 0) == 1 || isvpn1() || isvpn2())
      return true; 
  }
}


/* Location:              C:\Users\ASUZE\Downloads\cryptoe\\upworkclient\classes.jar!\com\cashful\devicemetadata\device\NetworkInformation.class
 * Java compiler version: 8 (52.0)
 * JD-Core Version:       1.1.3
 */