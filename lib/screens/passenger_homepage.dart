// passenger_homepage.dart

import 'package:flutter/material.dart';

class PassengerHomepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Passenger Homepage'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Passenger Homepage',
              style: TextStyle(fontSize: 24),
            ),
            // Add your widgets and features here
          ],
        ),
      ),
    );
  }
}
