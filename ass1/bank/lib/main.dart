import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}



class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bank Account App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BankAccountScreen(),
    );
  }
}

class BankAccountScreen extends StatefulWidget {
  @override
  _BankAccountScreenState createState() => _BankAccountScreenState();
}

class _BankAccountScreenState extends State<BankAccountScreen> {
  int _accountNumber=Random().nextInt(9000) + 1000;
  double _balance = 0.0;
  double _amount = 0.0;
  bool _isWithdraw = false;

  void deposit(double amount) {
    setState(() {
      if (amount > 0) {
        _balance += amount;
      }
    });

  }

  void withdraw(double amount) {
    setState(() {
      if (_balance >= amount && amount > 0) {
        _balance -= amount;
      }
    });

  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bank Account App'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Account Number: ${_accountNumber}',
              style: TextStyle(fontSize: 20.0)),
          Text('Balance: \$${_balance.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold)),
          SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _isWithdraw = false;
                  });
                },
                child: Text( 'Top Up'),
              ),

                SizedBox(
                  width: 20.0,
                ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _isWithdraw = true;
                    _amount = 0.0;
                  });
                },
                child: Text( 'Withdraw'),
              ),

            ],
          ),
          if (!_isWithdraw)
            Column(
              children: [
                TextField(
                  keyboardType: TextInputType.number,
                  onChanged: (value) {

                      _amount = double.tryParse(value) ?? 0.0;


                  },
                  decoration: InputDecoration(
                    labelText: 'Top up Amount',
                    hintText: 'Enter amount',
                  ),
                ),
                ElevatedButton(onPressed:(){
                  deposit(_amount);
                }, child: Text("Add")),
              ],
            ),


          if (_isWithdraw)
            Column(
              children: [
                TextField(
                  keyboardType: TextInputType.number,
                  onChanged: (value) {

                    _amount = double.tryParse(value) ?? 0.0;



                  },
                  decoration: InputDecoration(
                    labelText: 'Withdraw Amount',
                    hintText: 'Enter amount',
                  ),
                ),
                ElevatedButton(onPressed:(){
                  withdraw(_amount);
                }, child: Text("Debit")),
              ],
            ),


        ],
      ),
    );
  }
}
