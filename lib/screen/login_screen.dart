import 'package:flutter/material.dart';
import 'dashboard_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

  @override
  Widget build(BuildContext context) {
    void _login() {
      if (_formKey.currentState!.validate()) {
        if (emailController.text == "user@test.com" &&
            passwordController.text == "123456") {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => DashboardScreen()),
          );
        } else {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text("Invalid credentials")));
        }
      }
    }

    final emailField = TextFormField(
      controller: emailController,
      obscureText: false,
      style: style,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Email is required';
        }
        return null; // means valid
      },
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        hintText: 'Email',
        hintStyle: TextStyle(color: Colors.white),
        filled: true,
        fillColor: Colors.black.withOpacity(0.3),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(50.0)),
      ),
    );

    final passwordField = TextFormField(
      controller: passwordController,
      obscureText: true,
      style: style,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Password is required';
        }
        return null; // means valid
      },
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        hintText: 'Password',
        hintStyle: TextStyle(color: Colors.white),
        filled: true,
        fillColor: Colors.black.withOpacity(0.3),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final loginButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Color(0xFF3A3967),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            _login(); // Your login logic here
          }
        },
        child: Text(
          "Login",
          textAlign: TextAlign.center,
          style: style.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent, // Makes background see-through
        elevation: 0,
      ),
      body: Stack(
        children: [
          // Background image

          // Overlay to darken the background
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("lib\\assets\\background.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Login form
          Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(36.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Stitchly",
                        style: style.copyWith(
                          color: Color(0xFF3A3967),
                          fontWeight: FontWeight.bold,
                          fontSize: 50.0,
                        ),
                      ),
                      Text(
                        "Tailoring Your Time, Perfectly.",
                        style: style.copyWith(
                          color: Color(0xFF3A3967),
                          fontWeight: FontWeight.w300,
                          fontSize: 20.0,
                        ),
                      ),

                      SizedBox(height: 100.0),
                      emailField,
                      SizedBox(height: 25.0),
                      passwordField,
                      SizedBox(height: 60.0),
                      loginButton,
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
