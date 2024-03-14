import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:location/location.dart';
import 'package:meat_mingle/screens/phone%20authentication/controllers/controllers.dart';

class UserDataModel extends StateNotifier {
  UserDataModel() : super(0);
  LocationData? _currentLocation;

  setSelectedOption(int value) {
    state = value;
  }

  Future<void> getCurrentLocation() async {
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

    print('Latitude: ${_currentLocation!.latitude}');
    print('Longitude: ${_currentLocation!.longitude}');
  }

  Future<void> addUserData() async {
    await FirebaseFirestore.instance
        .collection('Users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .set({
      'userName': nameController.text,
      'userLat': _currentLocation?.longitude,
      'userLong': _currentLocation?.latitude,
    });
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
