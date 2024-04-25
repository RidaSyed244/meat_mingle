import 'package:flutter/material.dart';

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
