import 'package:flutter/material.dart';
// If you added google_fonts, import it here:
// import 'package:google_fonts/google_fonts.dart';

// Import your chatbot screen file
import 'package:govqueryai/screens/chatbot_screen.dart';

// Define custom colors at the top-level
const Color primaryBlue = Color(0xFF1E88E5);
const Color darkBlue = Color(0xFF0D47A1);
const Color lightBlueBackground = Color(0xFFE3F2FD);
const Color accentBlue = Color(0xFFBBDEFB);
const Color grayBackground = Color(0xFFF0F4F8);

class GovQueryAILandingPage extends StatelessWidget {
  const GovQueryAILandingPage({super.key});

  void _navigateToChatbotScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ChatScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 600;

    return Scaffold(
      backgroundColor: grayBackground,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        toolbarHeight: isSmallScreen ? 60 : 70,
        title: Padding(
          padding: EdgeInsets.symmetric(horizontal: isSmallScreen ? 0 : 24),
          child: Text(
            "GovQuery AI",
            style: TextStyle(
              fontSize: isSmallScreen ? 24 : 28,
              fontWeight: FontWeight.bold,
              color: primaryBlue,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: isSmallScreen ? 16 : 24),
            child: ElevatedButton(
              onPressed: () {
                _navigateToChatbotScreen(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryBlue,
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(
                    horizontal: isSmallScreen ? 16 : 24,
                    vertical: isSmallScreen ? 8 : 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 3,
              ),
              child: Text(
                "Try GovQuery AI",
                style: TextStyle(
                    fontSize: isSmallScreen ? 14 : 16,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // HERO Section
            Container(
              color: Colors.white,
              padding: EdgeInsets.symmetric(
                vertical: isSmallScreen ? 40 : 80,
                horizontal: isSmallScreen ? 20 : 40,
              ),
              child: Column(
                children: [
                  Text(
                    "GovQuery AI:\nInstant Answers from Your Government Rulebooks.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: isSmallScreen ? 30 : 48,
                      fontWeight: FontWeight.w900,
                      color: darkBlue,
                      height: 1.2,
                    ),
                  ),
                  SizedBox(height: isSmallScreen ? 15 : 20),
                  Text(
                    "Revolutionize how government employees access critical information from CSS, GFR, FR, SR, and more. Get precise, instant answers, effortlessly.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: isSmallScreen ? 16 : 20,
                      color: Colors.grey[700],
                    ),
                  ),
                  SizedBox(height: isSmallScreen ? 30 : 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          _navigateToChatbotScreen(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primaryBlue,
                          foregroundColor: Colors.white,
                          padding: EdgeInsets.symmetric(
                              horizontal: isSmallScreen ? 24 : 36,
                              vertical: isSmallScreen ? 14 : 18),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 5,
                        ),
                        child: Text(
                          "Try GovQuery AI",
                          style: TextStyle(
                            fontSize: isSmallScreen ? 16 : 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Problem & Solution Section
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: isSmallScreen ? 40 : 60,
                horizontal: isSmallScreen ? 20 : 40,
              ),
              child: Container(
                padding: EdgeInsets.all(isSmallScreen ? 25 : 40),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.08),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Text(
                      "Tired of Sifting Through Endless Rulebooks?",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: isSmallScreen ? 24 : 36,
                        fontWeight: FontWeight.bold,
                        color: darkBlue,
                      ),
                    ),
                    SizedBox(height: isSmallScreen ? 25 : 40),
                    isSmallScreen
                        ? _buildProblemSolutionContent(isSmallScreen)
                        : Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                  child: _buildProblemContent(isSmallScreen)),
                              SizedBox(width: 40),
                              Expanded(
                                  child: _buildSolutionContent(isSmallScreen)),
                            ],
                          ),
                  ],
                ),
              ),
            ),

            // Features Section
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: isSmallScreen ? 20 : 40,
                  horizontal: isSmallScreen ? 20 : 40),
              child: Column(
                children: [
                  Text(
                    "How GovQuery AI Transforms Your Workflow",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: isSmallScreen ? 26 : 38,
                      fontWeight: FontWeight.bold,
                      color: darkBlue,
                    ),
                  ),
                  SizedBox(height: isSmallScreen ? 30 : 50),
                  GridView.count(
                    crossAxisCount:
                        isSmallScreen ? 1 : (screenWidth < 1000 ? 2 : 3),
                    crossAxisSpacing: isSmallScreen ? 20 : 30,
                    mainAxisSpacing: isSmallScreen ? 20 : 30,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      _buildFeatureCard(
                          '💡',
                          'Intelligent Q&A',
                          'Get precise answers to complex queries in seconds. No more manual searching through PDFs or lengthy documents.',
                          isSmallScreen,
                          primaryBlue),
                      _buildFeatureCard(
                          '📚',
                          'Comprehensive Knowledge Base',
                          'Trained on your specific government rulebooks (CSS, GFR, FR, SR, etc.) for highly accurate and relevant responses.',
                          isSmallScreen,
                          primaryBlue),
                      _buildFeatureCard(
                          '🗣️',
                          'Natural Language Understanding',
                          'Ask questions just like you would to a colleague – GovQuery AI understands context and intent.',
                          isSmallScreen,
                          primaryBlue),
                      _buildFeatureCard(
                          '✅',
                          'Instant Verification',
                          'Quickly cross-reference information to ensure compliance and accuracy in your daily tasks.',
                          isSmallScreen,
                          primaryBlue),
                      _buildFeatureCard(
                          '⏰',
                          '24/7 Availability',
                          'Your dedicated assistant, ready to answer questions anytime, anywhere, freeing up your time for critical tasks.',
                          isSmallScreen,
                          primaryBlue),
                      _buildFeatureCard(
                          '🔒',
                          'Secure & Compliant',
                          'Built with robust data security and government compliance standards in mind.',
                          isSmallScreen,
                          primaryBlue),
                    ],
                  ),
                ],
              ),
            ),

  
            // Footer Section
            Container(
              width: double.infinity,
              color: Colors.blueAccent,
              padding: EdgeInsets.symmetric(
                  vertical: isSmallScreen ? 20 : 30,
                  horizontal: isSmallScreen ? 20 : 40),
              child: Column(
                children: [
                  Text(
                    "© 2025 GovQuery AI. All rights reserved.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white.withOpacity(0.7),
                        fontSize: isSmallScreen ? 12 : 14),
                  ),
                  // SizedBox(height: isSmallScreen ? 10 : 15),
                  // Wrap(
                  //   spacing: isSmallScreen ? 15 : 30,
                  //   runSpacing: 5,
                  //   alignment: WrapAlignment.center,
                  //   children: [
                  //     TextButton(
                  //         onPressed: () {},
                  //         child: Text("Privacy Policy",
                  //             style: TextStyle(
                  //                 color: Colors.white,
                  //                 fontSize: isSmallScreen ? 12 : 14))),
                  //     TextButton(
                  //         onPressed: () {},
                  //         child: Text("Terms of Service",
                  //             style: TextStyle(
                  //                 color: Colors.white,
                                  // fontSize: isSmallScreen ? 12 : 14))),
                      // TextButton(
                          // onPressed: () {},
                  //         child: Text("Contact Us",
                  //             style: TextStyle(
                  //                 color: Colors.white,
                  //                 fontSize: isSmallScreen ? 12 : 14))),
                  //       // Text(
                  //       //   "MADE WITH LOVE"
                  //       //   ,style : TextStyle(
                  //       //     color:Colors.white
                  //       //   )
                  //       // )
                  //   ],
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureCard(String icon, String title, String description,
      bool isSmallScreen, Color iconColor) {
    return Container(
      padding: EdgeInsets.all(isSmallScreen ? 20 : 30),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(icon, style: TextStyle(fontSize: isSmallScreen ? 40 : 50)),
          SizedBox(height: isSmallScreen ? 10 : 15),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: isSmallScreen ? 18 : 22,
              fontWeight: FontWeight.bold,
              color: Colors.blue[700],
            ),
          ),
          SizedBox(height: isSmallScreen ? 8 : 12),
          Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: isSmallScreen ? 14 : 16,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProblemContent(bool isSmallScreen) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "For government employees, navigating the complexities of official rulebooks like CSS, GFR, FR, and SR is a constant challenge. Time-consuming searches and uncertain answers can lead to delays and inefficiencies.",
          style: TextStyle(
            fontSize: isSmallScreen ? 15 : 18,
            color: Colors.grey[700],
          ),
        ),
        SizedBox(height: isSmallScreen ? 15 : 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildBulletPoint("Lengthy documents are difficult to navigate.",
                isSmallScreen),
            _buildBulletPoint("Finding specific answers quickly is a challenge.",
                isSmallScreen),
            _buildBulletPoint(
                "Delays in decision-making due to difficulty locating accurate information.",
                isSmallScreen),
          ],
        ),
      ],
    );
  }

  Widget _buildSolutionContent(bool isSmallScreen) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Introducing GovQuery AI:",
          style: TextStyle(
            fontSize: isSmallScreen ? 16 : 19,
            fontWeight: FontWeight.bold,
            color: Colors.blue[700],
          ),
        ),
        SizedBox(height: isSmallScreen ? 10 : 15),
        Text(
          "Your intelligent assistant designed exclusively to solve these pain points. Simply ask your questions in natural language, and GovQuery AI instantly retrieves accurate answers directly from your official rulebooks.",
          style: TextStyle(
            fontSize: isSmallScreen ? 15 : 18,
            color: Colors.grey[700],
          ),
        ),
        SizedBox(height: isSmallScreen ? 10 : 15),
        Text(
          "Save invaluable time, boost efficiency, and ensure compliance with reliable information at your fingertips.",
          style: TextStyle(
            fontSize: isSmallScreen ? 15 : 18,
            color: Colors.grey[700],
          ),
        ),
      ],
    );
  }

  Widget _buildProblemSolutionContent(bool isSmallScreen) {
    return Column(
      children: [
        _buildProblemContent(isSmallScreen),
        SizedBox(height: isSmallScreen ? 30 : 0),
        _buildSolutionContent(isSmallScreen),
      ],
    );
  }

  Widget _buildBulletPoint(String text, bool isSmallScreen) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.circle, size: isSmallScreen ? 8 : 10, color: primaryBlue),
          SizedBox(width: isSmallScreen ? 8 : 10),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: isSmallScreen ? 14 : 16,
                color: Colors.grey[700],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
