import 'package:flutter/material.dart';
import 'package:mid_exam/pages/fly.dart';

class ProfilePage extends StatelessWidget {
  final Map<String, dynamic> data;

  ProfilePage({required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue, Colors.purple], // Add your gradient colors here
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Hero(
                  tag: data['imagePath'],
                  child: CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage(data['imagePath']!),
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 70.0),
                  child: Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        child: Text('Button 1'),
                      ),
                      SizedBox(width: 20),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text('Button 2'),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  data['name']!,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  'Random bio text goes here.',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 20),
                DefaultTabController(
                  length: 3,
                  child: Column(
                    children: <Widget>[
                      TabBar(
                        tabs: [
                          Tab(text: 'Portfolio'),
                          Tab(text: 'Skills'),
                          Tab(text: 'Articles'),
                        ],
                      ),
                      // Add your tab views here
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
