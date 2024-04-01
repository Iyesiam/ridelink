import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Forgot Password'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // Email input field with validation
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Email',
                prefixIcon: Icon(Icons.email),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                }
                if (!value.contains('@')) {
                  return 'Please enter a valid email address';
                }
                return null;
              },
            ),
            SizedBox(height: 20.0),
            // Submit button with black background and white foreground
            ElevatedButton(
              onPressed: () {
                // Handle form submission logic here
                // Typically, send a password reset email to the provided email address
                // You can use Firebase Authentication or another authentication service for this
              },
              style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,// Set text color to white
                shape: RoundedRectangleBorder( // Set button shape to flat
                  borderRadius: BorderRadius.zero,
                ),
              ),
              child: Text('Reset Password'),
            ),
          ],
        ),
      ),
    );
  }
}
