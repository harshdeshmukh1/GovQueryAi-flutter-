import 'package:flutter/material.dart';
import 'screens/signup.dart';
import 'screens/login.dart';
import 'screens/landing.dart'; // Assuming this is where GovQueryAILandingPage is
import 'screens/chatbot_screen.dart'; // Import your ChatScreen

void main() async {

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // Set the landing page as the initial route or home screen
      home: const Home(), // Starting with your landing page
      routes: {
        '/login': (context) => const Login(),
        '/home': (context) => const Home(), // Assuming Home is a valid widget/screen
        '/landing': (context) => const GovQueryAILandingPage(),
        '/chatbot': (context) => const ChatScreen(), // Define the route for your ChatScreen
      },
    );
  }
}
