import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AddDishScreen extends StatefulWidget {
  @override
  _AddDishScreenState createState() => _AddDishScreenState();
}

class _AddDishScreenState extends State<AddDishScreen> {
  // Text field controllers
  TextEditingController _dishIdController = TextEditingController();
  TextEditingController _dishNameController = TextEditingController();
  TextEditingController _dishPriceController = TextEditingController();
  TextEditingController _restaurantIdController = TextEditingController();

  // Radio button group value
  bool _isAvailable = true;

  // Drop-down menu value
  String _selectedDishType = 'Desert';
  List<String> _dishTypes = ['Desert', 'Beverage', 'Meal'];

  void _submitDish() async {
    final dishData = {
      'dishId': _dishIdController.text,
      'dishName': _dishNameController.text,
      'dishPrice': _dishPriceController.text,
      'isAvailable': _isAvailable.toString(),
      'dishType': _selectedDishType,
      'restaurantId': _restaurantIdController.text,
    };

    try {
      final response = await http.post(
        Uri.parse('http://localhost:3000/dish/adddish'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(dishData),
      );

      if (response.statusCode == 201) {
        print('Dish added successfully!');
        // Reset the form or navigate to the next screen
        // ...
      } else {
        print('Error adding dish: ${response.body}');
        // Handle error, show error message, etc.
      }
    } catch (e) {
      print('Error: $e');
      // Handle network error, show error message, etc.
    }
  }

  @override
  void initState() {
    super.initState();
    // Generate a random 4-digit dish ID
    _dishIdController.text = _generateRandomDishId();
  }

  String _generateRandomDishId() {
    // Generate a random 4-digit ID
    return (1000 + (DateTime.now().millisecondsSinceEpoch % 9000)).toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Dish'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: _dishIdController,
                decoration: InputDecoration(labelText: 'Dish ID'),
                readOnly: true,
              ),
              SizedBox(height: 10),
              TextField(
                controller: _dishNameController,
                decoration: InputDecoration(labelText: 'Dish Name'),
              ),
              SizedBox(height: 10),
              TextField(
                controller: _dishPriceController,
                decoration: InputDecoration(labelText: 'Dish Price'),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Text('Availability:'),
                  SizedBox(width: 10),
                  Row(
                    children: [
                      Radio(
                        value: true,
                        groupValue: _isAvailable,
                        onChanged: (bool? value) {
                          setState(() {
                            _isAvailable = value!;
                          });
                        },
                      ),
                      Text('Available'),
                    ],
                  ),
                  Row(
                    children: [
                      Radio(
                        value: false,
                        groupValue: _isAvailable,
                        onChanged: (bool? value) {
                          setState(() {
                            _isAvailable = value!;
                          });
                        },
                      ),
                      Text('Unavailable'),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 10),
              DropdownButton<String>(
                value: _selectedDishType,
                onChanged: (String? value) {
                  setState(() {
                    _selectedDishType = value!;
                  });
                },
                items: _dishTypes.map((String type) {
                  return DropdownMenuItem<String>(
                    value: type,
                    child: Text(type),
                  );
                }).toList(),
                isExpanded: true,
                hint: Text('Select Dish Type'),
              ),
              SizedBox(height: 10),
              TextField(
                controller: _restaurantIdController,
                decoration: InputDecoration(labelText: 'Restaurant ID'),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your submit logic here
          _submitDish();
        },
        tooltip: 'Submit',
        child: Icon(Icons.check),
      ),
    );
  }

}
