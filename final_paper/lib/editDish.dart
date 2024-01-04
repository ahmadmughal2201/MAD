import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class EditDishScreen extends StatefulWidget {
  final String dishId;

  const EditDishScreen({Key? key, required this.dishId}) : super(key: key);

  @override
  _EditDishScreenState createState() => _EditDishScreenState();
}

class _EditDishScreenState extends State<EditDishScreen> {
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

  @override
  void initState() {
    super.initState();
    // Initialize text field controllers with existing dish data
    _dishIdController.text = widget.dishId;
    // Fetch and set other dish details based on the dishId from your backend
    // _fetchDishDetails(widget.dishId);
  }

  // Implement _fetchDishDetails function to get the existing dish details
  // ...

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Dish'),
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
          _updateDish();
        },
        tooltip: 'Submit',
        child: Icon(Icons.check),
      ),
    );
  }

  void _updateDish() async {
    try {
      final response = await http.put(
        Uri.parse('http://localhost:3000/dish/dishes/${_dishIdController.text}'),
        body: {
          'dishName': _dishNameController.text,
          'dishPrice': _dishPriceController.text,
          'isAvailable': _isAvailable.toString(),
          'dishType': _selectedDishType,
          'restaurantId': _restaurantIdController.text,
        },
      );

      if (response.statusCode == 200) {
        print('Dish updated successfully');
        // Navigate back to the dish list or perform other actions
        // Navigator.pop(context);
      } else {
        print('Error updating dish: ${response.body}');
        // Handle error, show error message, etc.
      }
    } catch (e) {
      print('Error: $e');
      // Handle network error, show error message, etc.
    }
  }
}
