import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'chat_screen.dart'; // Import your chat screen file

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("GovQueryAI",style: TextStyle(color:Colors.white),),
        // titleTextStyle: TextStyle(color: Color.fromRGBO(255, 255, 255, 1.0),fontSize: 25,fontWeight: FontWeight.bold),
        backgroundColor: Color.fromRGBO(69, 68, 68, 1.0), // Dark blue navbar
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Chatbot Image with Error Handling
            Center(
              child: Container(
              height: 200, // Specify height
                width: 200,  // Specify width
                decoration: BoxDecoration(
                  color: Colors.white, // Optional background color
                  borderRadius: BorderRadius.circular(12), // Optional border radius
                ),
                child: Lottie.asset(
                  "/images/a1.json",
                  fit: BoxFit.contain, // Ensures the animation fits within the container
                ),
              ),
            ),
            SizedBox(height: 20),

            // Welcome Text
            Text(
              "WELCOME TO GovQueryAI",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),

            // Subheading
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "24/7 Instant Answers on Policies, Employee Rights & Regulations",
                style: TextStyle(fontSize: 18, color: Colors.black,fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 30),

            // Start Chat Button
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                backgroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                elevation: 8, // Button shadow effect
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ChatScreen()),
                );
              },
              child: Text(
                "Start Chat",
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
