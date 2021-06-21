import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:minor_project/account.dart';
import 'package:minor_project/login.dart';
import 'package:minor_project/payments.dart';
import 'package:minor_project/signup.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  ));
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            Container(
              child: Padding(
                padding: const EdgeInsets.only(top: 25),
                child: Container(
                  alignment: Alignment.center,
                  height: 100,
                  width: 300,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.rectangle,
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Icon(Icons.person),
                      ),
                      Container(width: 250,
                        height: 80,
                        child: ElevatedButton(onPressed: (){
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Account()));
                        },
                            child: Container(
                              child: Text('94252XXXXX'),
                            )),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height:30,
            ),
            ListTile(
              leading: Icon(Icons.format_list_bulleted),
              title: Text(
                'Order History',style: TextStyle(fontSize: 18),),
              onTap: null,
            ),
            ListTile(
              leading: Icon(Icons.phone),
              title: Text(
                'Help & Support',style: TextStyle(fontSize: 18),),
              onTap: null,
            ),
            ListTile(
              leading: Icon(Icons.sync),
              title: Text(
                'Updates',style: TextStyle(fontSize: 18),),
              onTap: null,
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text(
                'LogOut',style: TextStyle(fontSize: 18),),
              onTap: (){
                showDialog(context: context, builder:(BuildContext context){
                  return AlertDialog(
                    title: Text('Log Out ?'),
                    content: Text('Are you sure you want to Logout?'),
                    actions: [
                      ElevatedButton(onPressed: (){
                        Navigator.pop(context);
                      }, child: Text('No'),),
                      ElevatedButton(onPressed: (){
                        SystemNavigator.pop();
                        // exit(0);
                      }, child: Text('Yes,LogOut'),),

                    ],
                  );
                });
              },
            ),
          ],
        ),

      ),
      appBar: AppBar(
        title: Text('Minor Project'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text(
                    "Welcome",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "This is a test App ",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 15,
                    ),
                  ),
                  ElevatedButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(
                            builder: (context) => Payment()));
                  }, child: Text('Go to Razorpay'),)
                ],
              ),
              Container(
                height: MediaQuery.of(context).size.height/4,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/welcome.png"))),
              ),
              Column(
                children: <Widget>[
                  MaterialButton(
                    minWidth: double.infinity,
                    height: 60,
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LoginPage()));
                    },
                    shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(50)),
                    child: Text(
                      "Login",
                      style:
                      TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                    ),
                  ),
                  // creating the signup button
                  SizedBox(height: 20),
                  MaterialButton(
                    minWidth: double.infinity,
                    height: 60,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignupPage()));
                    },
                    color: Color(0xff0095FF),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    child: Text(
                      "Sign up",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 18),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
