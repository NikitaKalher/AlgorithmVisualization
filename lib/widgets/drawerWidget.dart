import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  void _launchURL(String url) async {
    if (!await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          // Rich Indigo Header
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 36, horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.indigo[900],
              boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 4)],
            ),
            child: Column(
              children: [
                const CircleAvatar(
                  radius: 45,
                  backgroundImage: AssetImage('assets/profile.jpg'),
                ),
                const SizedBox(height: 12),
                Text(
                  'Nikita Kalher',
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Flutter Developer',
                  style: TextStyle(
                    color: Colors.indigo[100],
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),

          // Light Theme Content
          Expanded(
            child: Container(
              color: Colors.grey[50],
              child: ListView(
                padding: const EdgeInsets.symmetric(vertical: 12),
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      'App by Nikita Kalher',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.indigo[800],
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),

                  _buildContactTile(Icons.email_outlined, "kalhernikita@gmail.com", () {
                    _launchURL("mailto:kalhernikita@gmail.com");
                  }),
                  _buildContactTile(Icons.phone_android_outlined, "+91 9991211768"),
                  _buildContactTile(Icons.link_outlined, "linkedin.com/in/nikita-kalher", () {
                    _launchURL("https://www.linkedin.com/in/nikita-kalher-b5a1a329a");
                  }),

                  const Divider(height: 32, thickness: 1, indent: 20, endIndent: 20),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "📱 About the App",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.indigo[900],
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "This app helps users visualize sorting and searching algorithms interactively. "
                              "It aims to make data structures easy and fun for learners. "
                              "Explore animations and understand core concepts clearly. "
                              "Feel free to reach out for queries or suggestions!",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[800],
                            height: 1.4,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: InkWell(
                      onTap: () => _launchURL("mailto:kalhernikita@gmail.com?subject=Query%20Regarding%20Algorithm%20Visualizer"),
                      child: Row(
                        children: [
                          const Icon(Icons.question_answer_outlined, color: Colors.indigo),
                          const SizedBox(width: 8),
                          Text(
                            "Ask a query via Gmail",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.indigo[700],
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 32),
                ],
              ),
            ),
          ),

          // Footer
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Text(
              "© 2025 Nikita Kalher",
              style: TextStyle(fontSize: 12, color: Colors.grey[600]),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContactTile(IconData icon, String text, [VoidCallback? onTap]) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: GestureDetector(
        onTap: onTap,
        child: Row(
          children: [
            Icon(icon, size: 20, color: Colors.indigo),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                text,
                style: TextStyle(fontSize: 14, color: Colors.grey[800]),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
