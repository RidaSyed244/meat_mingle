import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:location/location.dart';
import 'package:meat_mingle/screens/phone%20authentication/controllers/controllers.dart';

class UserDataModel extends StateNotifier {
  UserDataModel() : super(0);
  LocationData? _currentLocation;
  bool isLoading = false; // Track loading state

  setSelectedOption(int value) {
    state = value;
  }

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
    } finally {
      isLoading = false;
    }
  }

  Future<void> addUserData() async {
    await FirebaseFirestore.instance
        .collection('Users')
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .update({
      'userName': nameController.text,
      'userLat': _currentLocation?.longitude,
      'userLong': _currentLocation?.latitude,
    });
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

  void showCustomSnackbar(
      BuildContext context, String title, String description) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating, // Set behavior to floating
        backgroundColor: Colors.black, // Set background color to black
        content: Padding(
          padding: EdgeInsets.all(16.0), // Add padding around the content
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: Colors.white, // Set title text color to white
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 4),
              Text(
                description,
                style: TextStyle(
                  color: Colors.white, // Set description text color to white
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
