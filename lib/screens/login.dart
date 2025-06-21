import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Login> {
  @override
   Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isSmallScreen = screenWidth < 600;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 238, 238, 238),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: screenHeight * 0.05), // Symmetrical padding at top and bottom
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                child: Column(
                  children: [
                    Text(
                      "BLUE COLLAR CONNECT",
                      style: TextStyle(
                        fontSize: isSmallScreen ? 20 : 24,
                        color: Colors.blueAccent,
                        fontWeight: FontWeight.w900,
                        fontFamily: 'bcc',
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    Text(
                      "Connecting skilled workers with opportunities",
                      style: TextStyle(fontSize: isSmallScreen ? 14 : 16),
                    ),
                  ],
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              Container(
                margin: EdgeInsets.all(isSmallScreen ? 8 : 12),
                padding: EdgeInsets.all(isSmallScreen ? 8 : 16),
                width: screenWidth > 400 ? 400 : screenWidth * 0.9,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Column(
                        children: [
                          Text(
                            "WELCOME BACK",
                            style: TextStyle(
                              fontSize: isSmallScreen ? 20 : 25,
                              fontWeight: FontWeight.w900,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.01),
                          Text(
                            "Sign in to continue to your account",
                            style: TextStyle(fontSize: isSmallScreen ? 12 : 14),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.03),
                    // Text(
                    //   "I am a",
                    //   style: TextStyle(fontSize: isSmallScreen ? 14 : 16),
                    // ),
                    // SizedBox(height: screenHeight * 0.01),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //   children: [
                    //     Container(
                    //       width: screenWidth > 400 ? 170 : screenWidth * 0.4,
                    //       height: isSmallScreen ? 60 : 70,
                    //       padding: EdgeInsets.symmetric(
                    //         vertical: isSmallScreen ? 8 : 10,
                    //         horizontal: isSmallScreen ? 10 : 15,
                    //       ),
                    //       decoration: BoxDecoration(
                    //         border: Border.all(
                    //           color: const Color.fromARGB(255, 213, 212, 212),
                    //         ),
                    //         borderRadius: BorderRadius.circular(5),
                    //       ),
                    //       child: Column(
                    //         mainAxisAlignment: MainAxisAlignment.center,
                    //         children: [
                    //           Text(
                    //             "Student",
                    //             style: TextStyle(
                    //               fontSize: isSmallScreen ? 14 : 16,
                    //               fontWeight: FontWeight.bold,
                    //             ),
                    //           ),
                    //           Text(
                    //             "Looking for jobs",
                    //             style: TextStyle(fontSize: isSmallScreen ? 12 : 14),
                    //           ),
                    //         ],
                    //       ),
                    //     ),
                    //     Container(
                    //       width: screenWidth > 400 ? 170 : screenWidth * 0.4,
                    //       height: isSmallScreen ? 60 : 70,
                    //       padding: EdgeInsets.symmetric(
                    //         vertical: isSmallScreen ? 8 : 10,
                    //         horizontal: isSmallScreen ? 10 : 15,
                    //       ),
                    //       decoration: BoxDecoration(
                    //         border: Border.all(
                    //           color: const Color.fromARGB(255, 213, 212, 212),
                    //         ),
                    //         borderRadius: BorderRadius.circular(5),
                    //       ),
                    //       child: Column(
                    //         mainAxisAlignment: MainAxisAlignment.center,
                    //         children: [
                    //           Text(
                    //             "EMPLOYER",
                    //             style: TextStyle(
                    //               fontSize: isSmallScreen ? 14 : 16,
                    //               fontWeight: FontWeight.bold,
                    //             ),
                    //           ),
                    //           Text(
                    //             "Hiring Workers",
                    //             style: TextStyle(fontSize: isSmallScreen ? 12 : 14),
                    //           ),
                    //         ],
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    SizedBox(height: screenHeight * 0.02),
                    Text(
                      "Email Id",
                      style: TextStyle(fontSize: isSmallScreen ? 14 : 16),
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    Container(
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 213, 212, 212),
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          hintText: "abc@gmail.com",
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: isSmallScreen ? 12 : 16,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    Text(
                      "Password",
                      style: TextStyle(fontSize: isSmallScreen ? 14 : 16),
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    Container(
                      decoration: BoxDecoration(
                        color:  Color.fromARGB(255, 213, 212, 212),
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          hintText: "***********",
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: isSmallScreen ? 12 : 16,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.03),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(255, 0, 0, 0),
                          foregroundColor: Colors.white,
                          padding: EdgeInsets.symmetric(
                            vertical: isSmallScreen ? 12 : 16,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        child: Text(
                          "Sign In",
                          style: TextStyle(fontSize: isSmallScreen ? 14 : 16),
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.03),
                    Center(
                      child: RichText(
                        text: TextSpan(
                        text: "Don't have an account? ",
                        style: const TextStyle(color: Colors.black),
                        children: [
                          TextSpan(
                            text: "Sign Up",
                            style: const TextStyle(
                              color: Colors.blue,
                              decoration: TextDecoration.underline,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.pushNamed(context, '/');
                              },
                                        ),
                        
                                        ],
                                      ),
                                    ),
                    ),
            ],
          ),
        ),
            ]
          ),
          
        ),
      ),
    );
  }
}