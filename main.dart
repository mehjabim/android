import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProfileUI(),
    );
  }
}

class ProfileUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffe6e0e5),
      body: SafeArea(
        child: Column(
          children: [

            Container(
              height: 60,
              width: double.infinity,
              color: Colors.tealAccent,
              alignment: Alignment.center,
              child: Text(
                "4th April 2026",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),

            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 60,
                    color: Colors.redAccent,
                    alignment: Alignment.center,
                    child: Text(
                      "22 CSE 035",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 60,
                    color: Colors.green,
                    alignment: Alignment.center,
                    child: Text(
                      "A+",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 60,
                    color: Colors.blue,
                    alignment: Alignment.center,
                    child: Text(
                      "Dhaka",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 120),

            Container(
              height: 80,
              width: 250,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                "110-035-22",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),

            Spacer(),

            Padding(
              padding: EdgeInsets.all(16),
              child: Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    color: Colors.pink,
                    shape: BoxShape.circle,
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    "Prioty",
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
