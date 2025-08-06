import 'package:demo_app/screen/dashboard_screen.dart';
import 'package:flutter/material.dart';

class ConfirmationScreen extends StatelessWidget {
  final DateTime date;
  final TimeOfDay time;

  ConfirmationScreen({required this.date, required this.time});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // ✅ Green Tick Icon
              Icon(Icons.check_circle, color: Colors.green, size: 100),

              SizedBox(height: 20),

              // 📄 Confirmation Message
              Text(
                'Your appointment is booked',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.center,
              ),

              SizedBox(height: 16),

              // 🕒 Date and Time Info
              Text(
                'For ${date.toLocal().toString().split(' ')[0]} at ${time.format(context)}',
                style: TextStyle(fontSize: 16, color: Colors.black54),
                textAlign: TextAlign.center,
              ),

              SizedBox(height: 40),

              // 🏠 Home Icon Button
              IconButton(
                icon: Icon(Icons.home, size: 36, color: Color(0xFF3A3967)),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => DashboardScreen()),
                  );
                },
                tooltip: 'Go to Dashboard',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
