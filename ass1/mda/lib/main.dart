import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shopping Cart App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ShoppingCart(),
    );
  }
}

class ShoppingCart extends StatefulWidget {
  @override
  _ShoppingCartState createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  List<String> items = [];
  TextEditingController itemControl = TextEditingController();

  void addItem(String item) {
    setState(() {
      if(item !=" ")
      items.add(item);

      itemControl.clear(); // Clear the text field after adding an item
    });
  }

  void clearCart() {
    setState(() {
      items.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping Cart'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: itemControl,
              decoration: InputDecoration(
                labelText: 'Item Name',
                hintText: 'Enter item name',
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(items[index]),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              addItem(itemControl.text);
            },
            shape: StadiumBorder(),
            child: Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: () {
              clearCart();
            },
            shape: StadiumBorder(),
            child: Icon(Icons.delete),
          ),
        ],
      ),
    );
  }
}