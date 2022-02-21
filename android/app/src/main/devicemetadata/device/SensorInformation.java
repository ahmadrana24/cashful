package com.cashful.devicemetadata.device;

import android.content.Context;
import android.hardware.Sensor;
import android.hardware.SensorManager;
import java.util.List;

public class SensorInformation {
  private final Context context;
  
  public SensorInformation(Context paramContext) {
    this.context = paramContext;
  }
  
  public List<Sensor> getSensorList() {
    return ((SensorManager)this.context.getSystemService("sensor")).getSensorList(-1);
  }
  
  public int getTotalNumberOfSensors() {
    return getSensorList().size();
  }
  
  public String getSensorVendor(Sensor paramSensor) {
    return paramSensor.getVendor();
  }
  
  public int getSensorVersion(Sensor paramSensor) {
    return paramSensor.getVersion();
  }
  
  public float getSensorResolution(Sensor paramSensor) {
    return paramSensor.getResolution();
  }
  
  public float getSensorPower(Sensor paramSensor) {
    return paramSensor.getPower();
  }
  
  public float getSensorMaximumRange(Sensor paramSensor) {
    return paramSensor.getMaximumRange();
  }
  
  public String getSensorName(Sensor paramSensor) {
    int i;
    if ((i = paramSensor.getType()) != 1) {
      if (i != 2) {
        if (i != 15) {
          if (i != 31) {
            switch (i) {
              default:
                switch (i) {
                  default:
                    switch (i) {
                      default:
                        return "Unknown";
                      case 21:
                        return "Heart Rate";
                      case 20:
                        return "Geomagnetic Rotation Vector";
                      case 19:
                        return "Step Counter";
                      case 18:
                        return "Step Detector";
                      case 17:
                        break;
                    } 
                    return "Significant Motion";
                  case 13:
                    return "Ambient Temperature";
                  case 12:
                    return "Humidity";
                  case 11:
                    return "Rotation Vector";
                  case 10:
                    return "Linear Acceleration";
                  case 9:
                    break;
                } 
                return "Gravity";
              case 6:
                return "Pressure";
              case 5:
                return "Light";
              case 4:
                break;
            } 
            return "Gyroscope";
          } 
          return "Heart Beat";
        } 
        return "Game Rotation Vector";
      } 
      return "Magnetic Field";
    } 
    return "Accelerometer";
  }
}


/* Location:              C:\Users\ASUZE\Downloads\cryptoe\\upworkclient\classes.jar!\com\cashful\devicemetadata\device\SensorInformation.class
 * Java compiler version: 8 (52.0)
 * JD-Core Version:       1.1.3
 */