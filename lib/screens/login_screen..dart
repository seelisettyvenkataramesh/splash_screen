import 'package:flutter/material.dart';

import 'home_screen..dart';

class LoginPageApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login Page',
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[200],
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.asset(
              'images/transmaa..png',
              height: 230.0,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 10.0),
            buildTextField(
              controller: nameController,
              labelText: 'Name',
              icon: Icons.person,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            SizedBox(height: 15.0),
            buildTextField(
              controller: phoneNumberController,
              labelText: 'Phone Number',
              icon: Icons.phone,
              fontSize: 18,
              fontWeight: FontWeight.bold,
              keyboardType: TextInputType.phone,
            ),
            SizedBox(height: 100.0),
            ElevatedButton(
              onPressed: () {
                // Show OTP dialog when "GET OTP" button is clicked
                showOtpDialog(context);
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                fixedSize: Size(140, 50), // Button background color
              ),
              child: Text(
                'GET OTP',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTextField({
    required TextEditingController controller,
    required String labelText,
    required IconData icon,
    double fontSize = 18,
    FontWeight fontWeight = FontWeight.normal,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        filled: true,
        fillColor: Colors.white,
        prefixIcon: Icon(icon, color: Colors.black),
      ),
      style: TextStyle(fontSize: fontSize,
          fontWeight: fontWeight,
          color: Colors.black
      ),
      keyboardType: keyboardType,
    );
  }

  void showOtpDialog(BuildContext context) {
    TextEditingController otpController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.teal[200], // Set background color of the AlertDialog
          title: Text('Enter OTP', style: TextStyle(color: Colors.black , fontWeight: FontWeight.bold)), // Set title color
          content: TextField(
            controller: otpController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: 'OTP' ,
                hintStyle: TextStyle(
                    fontWeight: FontWeight.bold ,
                    color: Colors.black
                )
            ),
          ),
          actions: [
            Center(
              child: ElevatedButton(
                onPressed: () {
                  print('Entered OTP: ${otpController.text}');
                  Navigator.of(context).pop();
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.white, // Button background color
                  fixedSize: Size(140, 50),
                ),
                child: Text(
                  'SUBMIT',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

}
