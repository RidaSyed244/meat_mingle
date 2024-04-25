import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:location/location.dart';
import 'package:meat_mingle/constants/constants.dart';
import 'package:meat_mingle/screens/phone%20authentication/controllers/controllers.dart';

class UserDataModel extends StateNotifier {
  UserDataModel() : super(false);
  LocationData? _currentLocation;

  Future<void> getCurrentLocation(BuildContext context) async {
    try {
      Location location = Location();
      bool serviceEnabled = await location.serviceEnabled();
      if (!serviceEnabled) {
        serviceEnabled = await location.requestService();
        if (!serviceEnabled) {
          return;
        }
      }

      PermissionStatus permissionStatus = await location.hasPermission();
      if (permissionStatus == PermissionStatus.denied) {
        permissionStatus = await location.requestPermission();
        if (permissionStatus != PermissionStatus.granted) {
          return;
        }
      }

      LocationData currentLocation = await location.getLocation();
      _currentLocation = currentLocation;

      print('Latitude: ${_currentLocation?.latitude}');
      print('Longitude: ${_currentLocation?.longitude}');
    } catch (e) {
      showCustomSnackbar(
        context,
        'Error',
        'Failed to get current location. Please check your settings.',
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
