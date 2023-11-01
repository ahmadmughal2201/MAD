import 'package:flutter/material.dart';
import 'package:chapter8/pages/fly.dart';

class UI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
          child: Column(
          children: [
            UI1(),
            Divider(),
            UI2(),
          ],
        ),
      )),
    );
  }
}

class UI1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
          padding: EdgeInsets.all(2.0),
          child: Container(
            height: 350,
            decoration: BoxDecoration(color: Colors.white),
            child: Expanded(
              child: Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      radius: 15,
                      backgroundColor: Colors.orangeAccent,
                      child: Icon(Icons.lock, color: Colors.deepOrange),
                    ),
                    title: Text(
                      'Forgot Password?',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    trailing: Icon(Icons.close),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 20),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Text(
                              'simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown p'),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Row(
                            children: [
                              Text(
                                'Label',
                                style: TextStyle(fontSize: 12),
                              ),
                              Text(
                                '*',
                                style: TextStyle(
                                  color: Colors.red,
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Enter your Email.',
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 0.0, horizontal: 10.0),
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12.0)),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.blueGrey, width: 1.0),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12.0)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.blueAccent, width: 2.0),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12.0)),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Container(
                            width: 300,
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius:
                                  BorderRadius.circular(10), // radius of 10
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                  child: Text(
                                'Send Link',
                                style: TextStyle(
                                    fontSize: 15, color: Colors.white),
                              )),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Divider(),
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Row(
                            children: [
                              Text(
                                'Forgot your Email? ',
                                style: TextStyle(fontSize: 13),
                              ),
                              Text(
                                'Try Phone Number',
                                style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.blueAccent,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
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

class UI2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
          padding: EdgeInsets.all(2.0),
          child: Container(
            height: 400,
            decoration: BoxDecoration(color: Colors.white),
            child: Expanded(
              child: Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      radius: 15,
                      backgroundColor: Colors.orangeAccent,
                      child: Icon(Icons.person_add_alt_1,
                          color: Colors.deepOrange),
                    ),
                    title: Text(
                      'Accounts',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    trailing: Icon(Icons.close),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 20),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Text(
                              'Add another account so you can easily switch between them'),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Row(
                            children: [
                              Text(
                                'Your Existing Accounts',
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(width: 40),
                              Text(
                                'Manage Accounts',
                                style: TextStyle(
                                  color: Colors.red,
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Column(
                              children: [
                                ListTile(
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        color: Colors.black87, width: 1),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  leading: CircleAvatar(
                                    radius: 15,
                                    backgroundColor: Colors.black12,
                                    child:
                                        Icon(Icons.person, color: Colors.grey),
                                  ),
                                  title: Text(
                                    'Panji pradana',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  subtitle: Text(
                                    'panjnir@gmail.com',
                                    style: TextStyle(color: Colors.black45),
                                  ),
                                  trailing: Icon(Icons.check_circle,
                                      color: Colors.blue),
                                ),
                                ListTile(
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        color: Colors.black87, width: 1),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  leading: CircleAvatar(
                                    radius: 15,
                                    backgroundColor: Colors.black12,
                                    child:
                                        Icon(Icons.person, color: Colors.grey),
                                  ),
                                  title: Text(
                                    'Black smith',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  subtitle: Text(
                                    'black@gmail.com',
                                    style: TextStyle(color: Colors.black45),
                                  ),
                                  trailing: Icon(
                                      Icons.confirmation_number_outlined,
                                      color: Colors.blue),
                                ),
                                ListTile(
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        color: Colors.black87, width: 1),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  leading: CircleAvatar(
                                    radius: 15,
                                    backgroundColor: Colors.black12,
                                    child:
                                        Icon(Icons.person, color: Colors.grey),
                                  ),
                                  title: Text(
                                    'Burak black',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  subtitle: Text(
                                    'burakblack@gmail.com',
                                    style: TextStyle(color: Colors.black45),
                                  ),
                                  trailing: Icon(
                                      Icons.confirmation_number_outlined,
                                      color: Colors.blue),
                                ),
                              ],
                            )),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Container(
                            width: 300,
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius:
                                  BorderRadius.circular(10), // radius of 10
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                  child: Text(
                                'Add Another',
                                style: TextStyle(
                                    fontSize: 15, color: Colors.white),
                              )),
                            ),
                          ),
                        ),
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
