import 'package:flutter/material.dart';
import 'package:ridelink/utils/constants.dart';
import 'package:file_picker/file_picker.dart'; // Import file_picker package

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _formKey = GlobalKey<FormState>(); // GlobalKey for FormState
  String? _selectedRole;
  final List<String> _roles = ['Temporary Driver', 'Private Driver', 'Passenger'];

  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: Text('Register'),
        backgroundColor: Color.fromARGB(255, 249, 251, 252),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Sign Up',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Helvetica Neue',
                    color: AppColors.black,
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  'Fill In Your Information',
                  style: TextStyle(
                    fontSize: 16,
                    color: Color.fromARGB(255, 199, 203, 201),
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: 'Name',
                    prefixIcon: Icon(Icons.person, color: AppColors.black),
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: _phoneController,
                  decoration: InputDecoration(
                    labelText: 'Phone',
                    prefixIcon: Icon(Icons.phone, color: AppColors.black),
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your phone number';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    prefixIcon: Icon(Icons.email, color: AppColors.black),
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    // Add more sophisticated validation logic here if needed
                    return null;
                  },
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    prefixIcon: Icon(Icons.lock, color: AppColors.black),
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a password';
                    } else if (value.length < 8) {
                      return 'Password must be at least 8 characters long';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: 'Select Role',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.group, color: AppColors.black),
                  ),
                  value: _selectedRole,
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedRole = newValue;
                    });
                  },
                  items: _roles.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  validator: (value) => value == null ? 'Please select a role' : null,
                ),
                SizedBox(height: 24),
                if (_selectedRole == 'Private Driver')
                  uploadSection(['Driver\'s License', 'Vehicle Registration', 'ID']),
                if (_selectedRole == 'Temporary Driver')
                  uploadSection(['Driver\'s License', 'ID']),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.black,
                    minimumSize: Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Proceed with the registration logic
                      // You can add your registration logic here without Firebase Authentication
                    }
                  },
                  child: Text(
                    'Register',
                    style: TextStyle(color: AppColors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget uploadSection(List<String> documents) {
    return Column(
      children: documents.map((document) => Column(
        children: [
          SizedBox(height: 16),
          ElevatedButton.icon(
            icon: Icon(Icons.upload_file, color: AppColors.white),
            label: Text('Upload $document', style: TextStyle(color: AppColors.white)),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.zero,
              ),
            ),
            onPressed: () async {
              // Open file picker dialog
              FilePickerResult? result = await FilePicker.platform.pickFiles();
              if (result != null) {
                PlatformFile file = result.files.first;
                // Process the selected file (e.g., upload to server)
                print('Selected file: ${file.name}');
              } else {
                // User canceled the picker
                print('File picker canceled');
              }
            },
          ),
        ],
      )).toList(),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
