import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; // Keep HTTP for API calls
import 'dart:convert'; // Keep for JSON encoding/decoding
// If you added google_fonts, import it here:
// import 'package:google_fonts/google_fonts.dart';

// Define custom colors at the top-level, making them accessible throughout the file
// These should match the colors defined in govquery_landing_page.dart
const Color primaryBlue = Color(0xFF1E88E5); // A nice, vibrant blue
const Color darkBlue = Color(0xFF0D47A1);  // Darker blue for text/headings
const Color lightBlueBackground = Color(0xFFE3F2FD); // Very light blue for subtle backgrounds
const Color grayBackground = Color(0xFFF0F4F8); // General light gray background

class ChatScreen extends StatefulWidget { // Keeping original name ChatScreen
  const ChatScreen({super.key});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();
  final List<ChatMessage> _messages = [];
  final ScrollController _scrollController = ScrollController(); // Added for auto-scrolling

  // IMPORTANT: Adjust this URL based on where your backend is running and your Flutter app's platform
  // For Android Emulator to host machine: "http://10.0.2.2:8000/query"
  // For iOS Simulator/Device to host machine: "http://localhost:8000/query" or "http://127.0.0.1:8000/query"
  // For Windows Desktop: "http://127.0.0.1:8000/query"
  final String apiUrl = "http://192.168.0.101:8000/query";


  @override
  void initState() {
    super.initState();
    // Initial welcome message from the bot
    _messages.add(ChatMessage(
      text: 'Hello! I am GovQuery AI. How can I assist you with your government rulebook queries today?',
      isUser: false,
    ));
    // Ensure the chat scrolls to the bottom after initial message
    WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToBottom());
  }

  void _scrollToBottom() {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }

  Future<void> _sendMessage() async {
    if (_controller.text.isEmpty) return;

    final String userMessage = _controller.text;
    setState(() {
      _messages.add(ChatMessage(text: userMessage, isUser: true));
      _controller.clear(); // Clear input field immediately
    });
    _scrollToBottom(); // Scroll to bottom after user sends message

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'query': userMessage}),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        setState(() {
          _messages.add(ChatMessage(
            text: data['response'],
            isUser: false,
          ));
        });
      } else {
        // Handle non-200 status codes
        setState(() {
          _messages.add(ChatMessage(
            text: 'Error: Failed to get response. Status: ${response.statusCode}',
            isUser: false,
          ));
        });
        print('Server error: ${response.statusCode}, Body: ${response.body}'); // For debugging
        throw Exception('Failed to get response: ${response.statusCode}');
      }
    } catch (e) {
      setState(() {
        _messages.add(ChatMessage(
          text: 'Error connecting to backend: $e', // More descriptive error
          isUser: false,
        ));
      });
      print('Network/API error: $e'); // For debugging
    } finally {
      _scrollToBottom(); // Always scroll to bottom after bot response or error
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 600;

    return Scaffold(
      backgroundColor: grayBackground, // Consistent background color
      appBar: AppBar(
        title: Text(
          'GovQuery AI Chat',
          style: TextStyle(
            color: Colors.white,
            fontSize: isSmallScreen ? 22 : 25,
            fontWeight: FontWeight.bold,
            // If using google_fonts:
            // fontFamily: GoogleFonts.inter().fontFamily,
          ),
        ),
        backgroundColor: darkBlue, // Consistent with dark blue on landing page
        elevation: 2,
        iconTheme: const IconThemeData(color: Colors.white), // Back button color
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: _scrollController, // Assign scroll controller
              padding: const EdgeInsets.all(12.0),
              itemCount: _messages.length,
              itemBuilder: (context, index) => _messages[index],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 8.0,
              vertical: isSmallScreen ? 8.0 : 12.0,
            ),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30), // More rounded for modern look
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      decoration: InputDecoration(
                        hintText: 'Type your question...',
                        hintStyle: TextStyle(fontSize: isSmallScreen ? 14 : 16, color: Colors.grey[500]),
                        border: InputBorder.none, // Remove default border
                        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: isSmallScreen ? 14 : 16),
                      ),
                      onSubmitted: (_) => _sendMessage(),
                      style: TextStyle(fontSize: isSmallScreen ? 16 : 18),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.send_rounded, color: primaryBlue, size: isSmallScreen ? 24 : 28), // Rounded send icon
                    onPressed: _sendMessage,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _scrollController.dispose(); // Dispose scroll controller
    super.dispose();
  }
}

class ChatMessage extends StatelessWidget {
  final String text;
  final bool isUser;

  const ChatMessage({super.key, required this.text, required this.isUser});

  @override
  Widget build(BuildContext context) {
    final messageColor = isUser ? primaryBlue : Colors.grey[200]; // User uses primaryBlue, Bot uses light gray
    final textColor = isUser ? Colors.white : Colors.black87;
    final avatarBgColor = isUser ? primaryBlue : darkBlue; // Avatars match message sender

    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 600;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0), // Consistent vertical spacing
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start, // Align top of message bubble
        mainAxisAlignment: isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          // AI Avatar
          if (!isUser)
            CircleAvatar(
              backgroundColor: avatarBgColor,
              radius: isSmallScreen ? 18 : 22,
              child: Text(
                'AI',
                style: TextStyle(color: Colors.white, fontSize: isSmallScreen ? 12 : 14, fontWeight: FontWeight.bold),
              ),
            ),
          SizedBox(width: isUser ? 0 : 8.0), // Spacing for non-user avatar

          // Message Bubble
          Flexible( // Use Flexible to prevent overflow
            child: Container(
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: messageColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(isUser ? 15 : 5), // Adjust radius for chat bubble shape
                  topRight: Radius.circular(isUser ? 5 : 15),
                  bottomLeft: const Radius.circular(15),
                  bottomRight: const Radius.circular(15),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.08),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Text(
                text,
                style: TextStyle(
                  color: textColor,
                  fontSize: isSmallScreen ? 15 : 17,
                  // If using google_fonts:
                  // fontFamily: GoogleFonts.inter().fontFamily,
                ),
              ),
            ),
          ),
          SizedBox(width: isUser ? 8.0 : 0), // Spacing for user avatar

          // User Avatar
          if (isUser)
            CircleAvatar(
              backgroundColor: avatarBgColor,
              radius: isSmallScreen ? 18 : 22,
              child: Text(
                'You', // Changed to 'You' for user
                style: TextStyle(color: Colors.white, fontSize: isSmallScreen ? 12 : 14, fontWeight: FontWeight.bold),
              ),
            ),
        ],
      ),
    );
  }
}
