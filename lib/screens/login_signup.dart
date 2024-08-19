import 'package:flutter/material.dart';
import 'package:musichub/screens/login.dart';
import 'package:musichub/screens/signup.dart';

class login_signup extends StatefulWidget {
  @override
  State<login_signup> createState() => _login_signupstate();
}

class _login_signupstate extends State<login_signup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'MusicHub',
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
        backgroundColor: Colors.black,
      ),
      body: Stack(
        children: [
          // Amber background
          Container(
            color: Colors.amber,
          ),
          // Background image with opacity
          Opacity(
            opacity: 0.2,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('resources/images/appbg2.png'), 
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(width: double.infinity, height: 125),
                  CircleAvatar(
                    backgroundImage: AssetImage('resources/images/appicon.png'),
                    radius: 80,
                  ),
                  SizedBox(width: double.infinity, height: 15),
                  Text(
                    'Welcome to MusicHub',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                  Container(
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: 90),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Login()),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Colors.black,
                              minimumSize: Size(150, 50),
                            ),
                            child: Text('Log in', style: TextStyle(fontSize: 20, color: Colors.white)),
                          ),
                          SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => signup()),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Colors.black,
                              minimumSize: Size(150, 50),
                            ),
                            child: Text('Sign up', style: TextStyle(fontSize: 20, color: Colors.white)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
