import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart' hide Location;
import 'package:location/location.dart';

class LocationUtils {
  static Future<String> getAddressFromLatLng() async {
    String currentAddress;

    try {
      Location location = Location();

      bool serviceEnabled;
      PermissionStatus permissionGranted;
      LocationData locationData;

      serviceEnabled = await location.serviceEnabled();
      if (!serviceEnabled) {
        serviceEnabled = await location.requestService();
        if (!serviceEnabled) {
          return '';
        }
      }

      permissionGranted = await location.hasPermission();
      if (permissionGranted == PermissionStatus.denied) {
        permissionGranted = await location.requestPermission();
        if (permissionGranted != PermissionStatus.granted) {
          return '';
        }
      }

      locationData = await location.getLocation();
      debugPrint("${locationData.latitude}");
      debugPrint("${locationData.longitude}");

      List<Placemark> placeMarks = await placemarkFromCoordinates(
        locationData.latitude!,
        locationData.longitude!,
      );

      Placemark place = placeMarks[0];
      currentAddress =
          "${place.subAdministrativeArea != "" ? "${place.subAdministrativeArea}, " : ""}"
          "${place.administrativeArea != "" ? "${place.administrativeArea}, " : ""}"
          "${place.country != "" ? "${place.country}, " : ""}"
          "\n${locationData.latitude}, ${"${locationData.longitude}"}";

      return currentAddress;
    } catch (e) {
      debugPrint("$e");
      return '';
    }
  }
}
