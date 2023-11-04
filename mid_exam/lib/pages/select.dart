import 'package:flutter/material.dart';
import 'package:mid_exam/pages/about.dart';
import 'package:mid_exam/pages/gratitude.dart';

class Select extends StatefulWidget {

  @override
  State<Select> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Select> {
  String _howAreYou = "...";

  void _openPageGratitude({
    required BuildContext context,
    bool fullscreenDialog = false,
  }) async {
    final String? _gratitudeResponse = await Navigator.push(
      context,
      MaterialPageRoute(
        fullscreenDialog: fullscreenDialog,
        builder: (context) => Gratitude(
          radioGroupValue: -1,
        ),
      ),
    );
    setState(() {
      _howAreYou = _gratitudeResponse ?? '';
    });
  }

  void _openPageAbout({BuildContext? context, bool fullscreenDialog = false}) {
    Navigator.push(
      context!,
      MaterialPageRoute(
        fullscreenDialog: fullscreenDialog,
        builder: (context) => About(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            'Grateful for: $_howAreYou',
            style: TextStyle(fontSize: 32.0),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _openPageGratitude(context: context),
        tooltip: 'About',
        child: Icon(Icons.sentiment_satisfied),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}