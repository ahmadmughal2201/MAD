import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'addDish.dart';
import 'dishTile.dart';
import 'editDish.dart';

class AllDishesScreen extends StatefulWidget {
  @override
  _AllDishesScreenState createState() => _AllDishesScreenState();
}

class _AllDishesScreenState extends State<AllDishesScreen> {
  List<Map<String, dynamic>> _dishes = [];

  @override
  void initState() {
    super.initState();
    // Fetch dishes data when the screen is initialized
    _fetchDishes();
  }

  Future<void> _fetchDishes() async {
    try {
      final response =
          await http.get(Uri.parse('http://localhost:3000/dish/getAllDishes'));

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        setState(() {
          _dishes = List<Map<String, dynamic>>.from(data);
        });
      } else {
        print('Error fetching dishes: ${response.body}');
        // Handle error, show error message, etc.
      }
    } catch (e) {
      print('Error: $e');
      // Handle network error, show error message, etc.
    }
  }

  void _navigateToEditDish(String dishId) {
    // Navigate to EditDishScreen and pass dishId as an argument
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditDishScreen(dishId: dishId),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Dishes'),
      ),
      body: ListView.builder(
        itemCount: _dishes.length,
        itemBuilder: (context, index) {
          final dish = _dishes[index];
          return DishTile(
            dishId: dish['dishId'],
            dishName: dish['dishName'],
            dishType: dish['dishType'],
            dishPrice: dish['dishPrice'],
            onEditPressed: () {
              // Handle edit button press
              _navigateToEditDish(dish['dishId']);
            },
          );
        },
      ),
    floatingActionButton: FloatingActionButton(
    onPressed: () {
    Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => AddDishScreen()),
    );}
    )

    );
  }
}
