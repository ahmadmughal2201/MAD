import 'package:flutter/material.dart';
import 'profile.dart';

class People extends StatelessWidget {
  List<Map<String, dynamic>> dummyData = [
    {
      'name': 'John Doe',
      'email': 'johndoe@example.com',
      'imagePath': 'assets/images/1.jpg',
    },
    {
      'name': 'Jane Smith',
      'email': 'janesmith@example.com',
      'imagePath': 'assets/images/1.jpg',
    },
    {
      'name': 'Michael Johnson',
      'email': 'michaeljohnson@example.com',
      'imagePath': 'assets/images/1.jpg',
    },
    {
      'name': 'Emily Williams',
      'email': 'emilywilliams@example.com',
      'imagePath': 'assets/images/1.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('ListTile with CircleAvatar'),
        ),
        body: ListView.builder(
          itemCount: dummyData.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfilePage(data: dummyData[index]),
                  ),
                );
              },
              child: ListTile(
                leading: Hero(
                  tag: dummyData[index]['imagePath'],
                  child: CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage(dummyData[index]['imagePath']!),
                  ),
                ),
                title: Text(dummyData[index]['name']!),
                subtitle: Text(dummyData[index]['email']!),
              ),
            );
          },
        ),
      ),
    );
  }
}
