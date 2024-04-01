import 'package:flutter/material.dart';
import 'package:ridelink/utils/constants.dart';
import 'package:ridelink/screens/auth/login_screen.dart'; // Import the login screen

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Set up a timer to navigate to the LoginScreen after a specified duration
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Use the deep red color for the background
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Icon instead of Image
            Icon(
              Icons.directions_car,
              size: 100,
              color: AppColors.black, // Use the vibrant yellow color for the icon
            ),
            SizedBox(height: 20),
            Text(
              'Ride Link',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColors.black, // Use the vibrant yellow color for the text
              ),
            ),
          ],
        ),
      ),
    );
  }
}
