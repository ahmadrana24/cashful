package com.cashful.devicemetadata.location;

import android.app.Activity;
import android.content.Context;
import android.location.Address;
import android.location.Geocoder;
import android.location.Location;
import android.location.LocationManager;
import android.os.Build;
import android.provider.Settings;
import androidx.annotation.RequiresApi;
import androidx.core.app.ActivityCompat;
import java.io.IOException;
import java.util.Locale;

@RequiresApi(api = 23)
public class LocationInformation {
  private final Context context;
  
  public LocationInformation(Context paramContext) {
    this.context = paramContext;
  }
  
  private String getStringAddress(double paramDouble1, double paramDouble2, int paramInt) {
    String str = "";
    this(this.context, Locale.getDefault());
    Geocoder geocoder;
    try {
      Address address = (geocoder = new Geocoder()).getFromLocation(paramDouble1, paramDouble2, 1).get(0);
      if (paramInt == 1) {
      
      } else if (paramInt == 4) {
      
      } else {
        return str;
      } 
      String str1 = (paramInt == 2) ? getLocality() : ((paramInt == 3) ? getCountryName() : "JD-Core does not support Kotlin");
      str = this;
    } catch (IOException iOException) {
      null.printStackTrace();
    } 
    return str;
  }
  
  public Location getLocation() {
    LocationManager locationManager = (LocationManager)this.context.getSystemService("location");
    if (ActivityCompat.checkSelfPermission(this.context, "android.permission.ACCESS_FINE_LOCATION") != 0 && ActivityCompat.checkSelfPermission(this.context, "android.permission.ACCESS_COARSE_LOCATION") != 0)
      ActivityCompat.requestPermissions((Activity)this.context, new String[] { "android.permission.ACCESS_FINE_LOCATION", "android.permission.ACCESS_COARSE_LOCATION" }, 1); 
    Location location;
    if ((location = locationManager.getLastKnownLocation("gps")) == null)
      location = locationManager.getLastKnownLocation("network"); 
    return this;
  }
  
  public double getCurrentLatitude() {
    return (getLocation() == null) ? 0.0D : getLocation().getLatitude();
  }
  
  public double getCurrentLongitude() {
    return (getLocation() == null) ? 0.0D : getLocation().getLongitude();
  }
  
  public boolean IsLocationServicesEnabled() {
    return (Build.VERSION.SDK_INT >= 28) ? ((LocationManager)this.context.getSystemService("location")).isLocationEnabled() : ((Settings.Secure.getInt(this.context.getContentResolver(), "location_mode", 0) != 0));
  }
  
  public String getStreetAddress(double paramDouble1, double paramDouble2) {
    return getStringAddress(paramDouble1, paramDouble2, 1);
  }
  
  public String getCity(double paramDouble1, double paramDouble2) {
    return getStringAddress(paramDouble1, paramDouble2, 2);
  }
  
  public String getCountryName(double paramDouble1, double paramDouble2) {
    return getStringAddress(paramDouble1, paramDouble2, 3);
  }
  
  public String getPostalCode(double paramDouble1, double paramDouble2) {
    return getStringAddress(paramDouble1, paramDouble2, 4);
  }
}


/* Location:              C:\Users\ASUZE\Downloads\cryptoe\\upworkclient\classes.jar!\com\cashful\devicemetadata\location\LocationInformation.class
 * Java compiler version: 8 (52.0)
 * JD-Core Version:       1.1.3
 */