import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.lightGreen,

      ),
      home: ThirdScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () { },
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
    flexibleSpace: SafeArea(
    child: Icon(
      Icons.photo_camera,
      size: 75.0,
      color: Colors.white70,
    ),
    ),
        bottom: PreferredSize(
          child: Container(
            color: Colors.lightGreen.shade100,
            height: 75.0,
            width: double.infinity,
            child: Center(
              child: Text('Bottom'),
            ),
          ),
          preferredSize: Size.fromHeight(75.0),
        ),

      ),
    body: Padding(
    padding: EdgeInsets.all(16.0),
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[Container( height: 100.0,

                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.white,
                        Colors.lightGreen.shade500,
                      ],
                    ),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(100.0),
                      bottomRight: Radius.circular(10.0),

                )

            ),

              child: Center(
                child: RichText(
                  text: TextSpan(
                    text: 'Flutter World',
                    style: TextStyle(
                      fontSize: 24.0,
                      color: Colors.deepPurple,
                      decoration: TextDecoration.underline,
                      decorationColor: Colors.deepPurpleAccent,
                      decorationStyle: TextDecorationStyle.dotted,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.normal,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: ' for',
                      ),
                      TextSpan(
                        text: ' Mobile',
                        style: TextStyle(
                            color: Colors.deepOrange,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
              ),Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Text('Column 1'),
            Divider(),
            Text('Column 2'),
            Divider(),
            Text('Column 3'),
          ],
        ),Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text('Row 1'),
                    Padding(padding: EdgeInsets.all(16.0),),
                    Text('Row 2'),
                    Padding(padding: EdgeInsets.all(16.0),),
                    Text('Row 3'),
                  ],
                ),
              ],
            ),


          ],
          ),
        ),
      ),
    ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.play_arrow),
        backgroundColor: Colors.lightGreen.shade100,
      ),
// or
// This creates a Stadium Shape FloatingActionButton
// floatingActionButton: FloatingActionButton.extended(
// onPressed: () {},
// icon: Icon(Icons.play_arrow),
// label: Text('Play'),
// ),
//
      bottomNavigationBar: BottomAppBar(
        color: Colors.lightGreen.shade100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Icon(Icons.pause),
            Icon(Icons.stop),
            Icon(Icons.access_time),
            Padding(
              padding: EdgeInsets.all(32.0),
            ),
          ],
        ),
      ),
    );
  }
}

class Order {
   String item="";
  int quantity=0;
}
//_________________Second screen_________________

class SecondScreen extends StatefulWidget{
  @override
  State<SecondScreen> createState() => _SecondScreen();

}


class _SecondScreen extends State<SecondScreen>
{
  Order _order = Order();
  String _validateItemRequired(String value) {
    return value.isEmpty ? 'Item Required' : "";
  }
  String _validateItemCount(String value) {
    int _valueAsInteger = value as int;
    return _valueAsInteger == 0 ? 'At least one Item is Required' : "null";
  }
    @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("Second Screen"),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () { },
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Image(
                      image: AssetImage("assets/images/logo.png"),
                      //color: Colors.orange,
                      fit: BoxFit.cover,
                      width: MediaQuery.of(context).size.width / 3,
                    ),

                    Icon(
                      Icons.brush,
                      color: Colors.lightBlue,
                      size: 48.0,
                    ),
                  ],
                ),
                Container(
                  height: 100.0,
                  width: 100.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.
                    circular(20.0)),
                    color: Colors.orange,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 10.0,
                        offset: Offset(0.0, 10.0),
                      )
                    ],
                  ),
                ),
            TextField( keyboardType: TextInputType.text,
              style: TextStyle(
                color: Colors.grey.shade800,
                fontSize: 16.0,
              ),
              decoration: InputDecoration(
                labelText: "Notes",
                labelStyle: TextStyle(color: Colors.purple),
                //border: UnderlineInputBorder(),
                border: OutlineInputBorder(),

              ),
            ),
// TextFormField
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Enter your notes',
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
//_________________Third screen_________________
class OrientationLayoutIconsWidget extends StatelessWidget {
  const OrientationLayoutIconsWidget({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Orientation _orientation = MediaQuery.of(context).orientation;
    return _orientation == Orientation.portrait
        ? Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          Icons.school,
          size: 48.0,
        ),
      ],
    )
        : Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          Icons.school,
          size: 48.0,
        ),
        Icon(
          Icons.brush,
          size: 48.0,
        ),
      ],
    );
  }
}

class ThirdScreen extends StatefulWidget{
  @override
  State<ThirdScreen> createState() => _ThirdScreen();

}
 class _ThirdScreen extends State<ThirdScreen>
 {
  @override
  Widget build(BuildContext context) {
   return Scaffold(

     appBar: AppBar(
       // Here we take the value from the MyHomePage object that was created by
       // the App.build method, and use it to set our appbar title.
       title: Text("Orientation"),
       leading: IconButton(
         icon: Icon(Icons.menu),
         onPressed: () { },
       ),
       actions: <Widget>[
         IconButton(
           icon: Icon(Icons.search),
           onPressed: () {},
         ),
         IconButton(
           icon: Icon(Icons.more_vert),
           onPressed: () {},
         ),
       ],
     ),
       body: SafeArea(
       child: SingleChildScrollView(
       child: Padding(
       padding: EdgeInsets.all(16.0),
    child: Column(
    children: <Widget>[
      const OrientationLayoutIconsWidget()
    ],
    ),
    ),
    ),
   ),);
  }

 }