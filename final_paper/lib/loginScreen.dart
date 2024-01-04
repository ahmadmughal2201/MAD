import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  TextEditingController _fullNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  Future<void> registerUser() async {
    final String apiUrl = 'http://localhost:3000/api/register'; // Replace with your actual backend URL

    final Map<String, String> registrationData = {
      "username": _fullNameController.text,
      "email": _emailController.text,
      "password": _passwordController.text,
    };

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode(registrationData),
      );

      if (response.statusCode == 200) {
        // Registration successful
        print("User registered successfully!");
      } else {
        // Registration failed
        print("Registration failed: ${response.body}");
        // Handle error or show a message to the user
      }
    } catch (e) {
      print("Error during registration: $e");
      // Handle error or show a message to the user
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            ElevatedButton(
              onPressed: () {
                registerUser();
              },
              child: Text('Login'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // // Navigate to a screen showing all registered users
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => UserListScreen()),
                // );
              },
              child: Text('View Registered Users'),
            ),
          ],
        ),
      ),
    );
  }
}
