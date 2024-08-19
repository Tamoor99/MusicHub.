import 'package:flutter/material.dart';
import 'package:musichub/screens/changepassword.dart';
import 'package:musichub/screens/login.dart';

class ForgetPassword extends StatefulWidget {
  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  // Define a GlobalKey for the Form
  final _formKey = GlobalKey<FormState>();

  // Controller to get the value of the email input field
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.black,
        ),
        body: Stack(
          children: [
            // Amber background
            Container(
              color: Colors.amber,
            ),
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
                    SizedBox(height: 20),
                    Row(
                      children: [
                        SizedBox(width: 10),
                      ],
                    ),
                    SizedBox(height: 20),
                    // Lock icon image
                    Image.asset(
                      'resources/images/lockimage.png',
                      height: 80,
                      width: 80,
                    ),
                    SizedBox(height: 20),
                    // Forget Password text
                    Text(
                      'FORGET PASSWORD',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 10),
                    // Subtitle text
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: Text(
                        'Provide your account\'s email for which you want to reset your password!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Form(
                      key: _formKey, // Assign the form key to the Form widget
                      child: Column(
                        children: [
                          SizedBox(width: double.infinity, height: 20),
                          Padding(
                            padding: EdgeInsets.all(15.0),
                            child: TextFormField(
                              controller: _emailController,
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.black,
                                labelText: 'Email',
                                labelStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                ),
                                hintText: 'Enter Email',
                                hintStyle: TextStyle(color: Colors.white),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your email';
                                }
                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            // Future: Validate email with the database
                            // For now, navigate to NewPasswordScreen
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => NewPasswordScreen(),
                              ),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.black,
                          minimumSize: Size(150, 50),
                        ),
                        child: Text(
                          'Next',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(height: 200), // Add space above the text
                    Row(
                      children: [
                        SizedBox(width: 20), // Add space to the left of the text
                        Text(
                          'Remember your password?',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                            color: Colors.black,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Login()));
                          },
                          child: Text(
                            'Login',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                              decoration: TextDecoration.underline,
                              decorationColor: Colors.blue,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
