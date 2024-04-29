import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:location/location.dart';
import 'package:meat_mingle/constants/constants.dart';
import 'package:meat_mingle/screens/phone%20authentication/controllers/controllers.dart';

Location location = Location();
bool locationEnabled = false;

class UserDataModel extends StateNotifier {
  UserDataModel() : super(false);
  LocationData? _currentLocation;

  Future<void> getCurrentLocation(BuildContext context) async {
    try {
      bool serviceEnabled = await location.serviceEnabled();
      locationEnabled = serviceEnabled; // Set the flag
      if (!serviceEnabled) {
        showCustomSnackbar(
          context,
          "Alert",
          "Please enable location services to proceed.",
        );

        serviceEnabled = await location.requestService();
        if (!serviceEnabled) {
          return; // Exit if the user does not enable location services
        } else {
          locationEnabled = true;
          showCustomSnackbar(
            context,
            "Got It!!!",
            "Your location has been saved. You can now proceed.",
          );
        }
      } else {
        locationEnabled = true;
        showCustomSnackbar(
          context,
          "Got It!!!",
          "Your location has been saved. You can now proceed.",
        );
      }

      PermissionStatus permissionStatus = await location.hasPermission();
      if (permissionStatus == PermissionStatus.denied) {
        permissionStatus = await location.requestPermission();
        if (permissionStatus != PermissionStatus.granted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Please grant location permissions to proceed'),
            ),
          );
          return; // Exit if the user does not grant location permissions
        }
      }

      LocationData currentLocation = await location.getLocation();
      _currentLocation = currentLocation;

      print('Latitude: ${_currentLocation?.latitude}');
      print('Longitude: ${_currentLocation?.longitude}');

      // Add location data to Firebase
      await addUserData();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
              'Failed to get current location. Please check your settings.'),
        ),
      );
    }
  }

  Future<void> addUserData() async {
    state = true; // Set isLoading to true before starting loading
    try {
      await FirebaseFirestore.instance
          .collection('Users')
          .doc(FirebaseAuth.instance.currentUser?.uid)
          .update({
        'userName': nameController.text,
        'userLat': _currentLocation?.longitude,
        'userLong': _currentLocation?.latitude,
      });
    } catch (e) {
      // Handle error
    } finally {
      state = false; // Set isLoading back to false after loading completes
    }
  }

  Future<void> updateUserData() async {
    await FirebaseFirestore.instance
        .collection('Users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .update({
      'userLat': _currentLocation?.longitude,
      'userLong': _currentLocation?.latitude,
    });
    print('User data updated');
  }
}
