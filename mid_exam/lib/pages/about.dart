import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: About(),
  ));
}

class About extends StatefulWidget {
  @override
  _MyTabBarState createState() => _MyTabBarState();
}

class _MyTabBarState extends State<About> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
        children: <Widget>[
          TabBar(
            controller: _tabController,
            tabs: <Widget>[
              Tab(
                text: 'Tab 1',
                icon: Icon(Icons.directions_car, color: Colors.blue),
              ),
              Tab(
                text: 'Tab 2',
                icon: Icon(Icons.directions_transit,color: Colors.blue),
              ),
              Tab(
                text: 'Tab 3',
                icon: Icon(Icons.directions_bike,color: Colors.blue),
              ),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: <Widget>[
                Center(
                  child: Text('Tab 1 Car'),
                ),
                Center(
                  child: Text('Tab 2 Diretion'),
                ),
                Center(
                  child: Text('Tab 3 Bike'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
