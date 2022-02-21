package com.cashful.devicemetadata.device;

import android.content.Context;
import android.hardware.camera2.CameraAccessException;
import android.hardware.camera2.CameraCharacteristics;
import android.hardware.camera2.CameraManager;

public class CameraInformation {
  private final Context context;
  
  public CameraInformation(Context paramContext) {
    this.context = paramContext;
  }
  
  private int getMaximumRegions(String paramString, CameraCharacteristics.Key<Integer> paramKey) {
    CameraCharacteristics cameraCharacteristics;
    this = null;
    try {
      cameraCharacteristics = ((CameraManager)this.context.getSystemService("camera")).getCameraCharacteristics(paramString);
    } catch (CameraAccessException cameraAccessException) {
      null.printStackTrace();
    } 
    assert false;
    throw new AssertionError();
  }
  
  private int[] getCharacteristics(String paramString, CameraCharacteristics.Key<int[]> paramKey) {
    CameraCharacteristics cameraCharacteristics;
    this = null;
    try {
      cameraCharacteristics = ((CameraManager)this.context.getSystemService("camera")).getCameraCharacteristics(paramString);
    } catch (CameraAccessException cameraAccessException) {
      null.printStackTrace();
    } 
    return (int[])get(paramKey);
  }
  
  public boolean isCameraAvailable() {
    return this.context.getPackageManager().hasSystemFeature("android.hardware.camera.any");
  }
  
  public boolean isFlashAvailable() {
    return this.context.getPackageManager().hasSystemFeature("android.hardware.camera.flash");
  }
  
  public String[] getCameraIds() {
    try {
      return ((CameraManager)this.context.getSystemService("camera")).getCameraIdList();
    } catch (CameraAccessException cameraAccessException) {
      null.printStackTrace();
      return null;
    } 
  }
  
  public int getNumberOfCameras() {
    return (getCameraIds()).length;
  }
  
  public int[] getAntibandingModes(String paramString) {
    return getCharacteristics(paramString, CameraCharacteristics.CONTROL_AE_AVAILABLE_ANTIBANDING_MODES);
  }
  
  public int[] getAberrationModes(String paramString) {
    return getCharacteristics(paramString, CameraCharacteristics.COLOR_CORRECTION_AVAILABLE_ABERRATION_MODES);
  }
  
  public int[] getAutoExposureModes(String paramString) {
    return getCharacteristics(paramString, CameraCharacteristics.CONTROL_AE_AVAILABLE_MODES);
  }
  
  public int[] getAutoFocusModes(String paramString) {
    return getCharacteristics(paramString, CameraCharacteristics.CONTROL_AF_AVAILABLE_MODES);
  }
  
  public int[] getEffects(String paramString) {
    return getCharacteristics(paramString, CameraCharacteristics.CONTROL_AVAILABLE_EFFECTS);
  }
  
  public int[] getWhiteBalanceModes(String paramString) {
    return getCharacteristics(paramString, CameraCharacteristics.CONTROL_AWB_AVAILABLE_MODES);
  }
  
  public int[] getVideoStabilizationModes(String paramString) {
    return getCharacteristics(paramString, CameraCharacteristics.CONTROL_AVAILABLE_VIDEO_STABILIZATION_MODES);
  }
  
  public int getMaximumAutoFocusRegions(String paramString) {
    return getMaximumRegions(paramString, CameraCharacteristics.CONTROL_MAX_REGIONS_AF);
  }
  
  public int getMaximumAutoExposureRegions(String paramString) {
    return getMaximumRegions(paramString, CameraCharacteristics.CONTROL_MAX_REGIONS_AE);
  }
  
  public int getMaximumAutoWhiteBalanceRegions(String paramString) {
    return getMaximumRegions(paramString, CameraCharacteristics.CONTROL_MAX_REGIONS_AWB);
  }
}


/* Location:              C:\Users\ASUZE\Downloads\cryptoe\\upworkclient\classes.jar!\com\cashful\devicemetadata\device\CameraInformation.class
 * Java compiler version: 8 (52.0)
 * JD-Core Version:       1.1.3
 */