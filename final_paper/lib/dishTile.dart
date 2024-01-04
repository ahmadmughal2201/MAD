import 'package:flutter/material.dart';

class DishTile extends StatelessWidget {
  final String dishId;
  final String dishName;
  final String dishType;
  final double dishPrice;
  final Function() onEditPressed;

  DishTile({
    required this.dishId,
    required this.dishName,
    required this.dishType,
    required this.dishPrice,
    required this.onEditPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset('assets/images/1.jpg'), // Replace with the actual image path
      title: Text(dishName),
      subtitle: RichText(
        text: TextSpan(
          text: dishType + '\n',
          style: DefaultTextStyle.of(context).style,
          children: <TextSpan>[

            TextSpan(
              text: '\$${dishPrice.toStringAsFixed(2)}',
              style: TextStyle(fontWeight: FontWeight.bold),

            ),
          ],
        ),
      ),      trailing: ElevatedButton(
        onPressed: onEditPressed,
        child: Text('Edit'),
      ),
      contentPadding: EdgeInsets.all(8.0),
      onTap: () {
        // Handle tap, e.g., navigate to dish details page
        print('Tapped on dish with ID: $dishId');
      },
      isThreeLine: true,
      dense: true,
    );
  }
}
