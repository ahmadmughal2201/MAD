import 'package:flutter/material.dart';
import 'people.dart';

class Sign extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(

            child: Center(
              child: Column(

                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children:[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 40.0),
                    child: Text("Login", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),  ),
                  ),
                  Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 60.0),
                        child: Container(
                          width: 300,
                          child:Expanded(
                            child: Column(
                              children:[
                                TextField(

                                  decoration: InputDecoration(
                                    hintText: 'Username',
                                fillColor: Colors.white, filled: true,
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 25.0, horizontal: 10.0),
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
                                TextField(
                                  decoration: InputDecoration(
                                    hintText: 'Password',
                                    fillColor: Colors.white, filled: true,
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 25.0, horizontal: 10.0),
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
                                )
                              ]
                            ),
                          )
                        ),
                      ),

                      Positioned(
                        top: 23,
                        left: 280,
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => People()),
                            );
                          },
                          child: Container(
                            height: 70,
                            width: 70,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                              color: Colors.tealAccent// radius of 10
                            ),
                            child:Icon(Icons.arrow_forward_sharp, color: Colors.white,)
                          ),
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 290.0, top: 10),
                    child: Text(
                      'Forgot? ',
                      style:  TextStyle( fontSize: 20, color: Colors.black26),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 255.0, top: 30),
                    child: Text(
                      'Register? ',
                      style:  TextStyle( fontSize: 25, color: Colors.redAccent),
                    ),
                  ),
                ]
              ),
            ),
          )),
    );
  }
}
