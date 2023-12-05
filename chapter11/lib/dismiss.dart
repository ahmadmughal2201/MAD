import 'package:flutter/material.dart';

class Trip {
  String id;
  String tripName;
  String tripLocation;
  Trip({required this.id, required this.tripName, required this.tripLocation});
}

class CheckTrip extends StatefulWidget {
  @override
  _CheckState createState() => _CheckState();
}

class _CheckState extends State<CheckTrip> {
  List<Trip> _trips = <Trip>[];

  @override
  void initState() {
    super.initState();
    _trips
      ..add(Trip(id: '0', tripName: 'Rome', tripLocation: 'Italy'))
      ..add(Trip(id: '1', tripName: 'Paris', tripLocation: 'France'))
      ..add(Trip(id: '2', tripName: 'New York', tripLocation: 'USA - New York'))
      ..add(Trip(id: '3', tripName: 'Cancun', tripLocation: 'Mexico'))
      ..add(Trip(id: '4', tripName: 'London', tripLocation: 'England'))
      ..add(Trip(id: '5', tripName: 'Sydney', tripLocation: 'Australia'))
      ..add(Trip(id: '6', tripName: 'Miami', tripLocation: 'USA - Florida'))
      ..add(Trip(id: '7', tripName: 'Rio de Janeiro', tripLocation: 'Brazil'))
      ..add(Trip(id: '8', tripName: 'Cusco', tripLocation: 'Peru'))
      ..add(Trip(id: '9', tripName: 'New Delhi', tripLocation: 'India'))
      ..add(Trip(id: '10', tripName: 'Tokyo', tripLocation: 'Japan'));
  }

  void _markTripCompleted() {
    print('Trip marked completed');
  }

  void _deleteTrip() {
    print('Trip deleted');
  }

  ListTile _buildListTile(int index) {
    return ListTile(
      title: Text('${_trips[index].tripName}'),
      subtitle: Text(_trips[index].tripLocation),
      leading: Icon(Icons.flight),
      trailing: Icon(Icons.fastfood),
    );
  }

  Container _buildCompleteTrip() {
    return Container(
      color: Colors.green,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Icon(
              Icons.done,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }

  Container _buildRemoveTrip() {
    return Container(
      color: Colors.red,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Icon(
              Icons.delete,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: _trips.length,
        itemBuilder: (BuildContext context, int index) {
          return Dismissible(
            key: Key(_trips[index].id),
            child: _buildListTile(index),
            background: _buildCompleteTrip(),
            secondaryBackground: _buildRemoveTrip(),
            onDismissed: (DismissDirection direction) {
              if (direction == DismissDirection.startToEnd) {
                _markTripCompleted();
              } else {
                _deleteTrip();
              }
              setState(() {
                _trips.removeAt(index);
              });
            },
          );
        },

    );
  }
}