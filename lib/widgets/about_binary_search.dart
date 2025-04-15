import 'package:flutter/material.dart';

class AboutBinarySearch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title Section
            Center(
              child: Text(
                'Binary Search Algorithm',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.indigo,
                ),
              ),
            ),
            SizedBox(height: 10),
            Divider(color: Colors.indigo, thickness: 2),
            SizedBox(height: 20),

            // Definition Section
            _buildSectionTitle("🔍 Definition"),
            SizedBox(height: 8),
            Text(
              "Binary search is an efficient algorithm for finding an item from a sorted list of elements. It works by repeatedly dividing the search interval in half until the target is found or the interval is empty.",
              style: TextStyle(fontSize: 16, height: 1.5),
            ),

            SizedBox(height: 20),

            // Steps Section
            _buildSectionTitle("🛠️ Steps to Perform Binary Search"),
            SizedBox(height: 10),
            _buildStep("Start with the entire sorted array as the search range."),
            _buildStep("Find the middle element of the search range."),
            _buildStep("If the middle element is the target, return its index."),
            _buildStep("If the middle element is greater than the target, search the left half."),
            _buildStep("If the middle element is less than the target, search the right half."),
            _buildStep("Repeat the process until the element is found or the search range is empty."),

            SizedBox(height: 20),

            // Time Complexity Section
            _buildSectionTitle("⏳ Time Complexity"),
            SizedBox(height: 8),
            Text(
              "• Best Case (Element found at middle): O(1)\n"
                  "• Average Case: O(log n)\n"
                  "• Worst Case (Element not found): O(log n)",
              style: TextStyle(fontSize: 16, height: 1.5, color: Colors.black),
            ),

            SizedBox(height: 20),

            // Space Complexity Section
            _buildSectionTitle("💾 Space Complexity"),
            SizedBox(height: 8),
            Text(
              "• O(1) for iterative approach, O(log n) for recursive approach.",
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),

            SizedBox(height: 20),

            // Illustration Section
            _buildSectionTitle("📌 Illustration"),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Text(
                    "Example: Find 7 in [2, 4, 7, 10, 14]",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.green),
                  ),
                  SizedBox(height: 10),
                  _buildIllustrationRow(["2", "4", "7", "10", "14"], 2),
                  SizedBox(height: 10),
                  Text(
                    "✅ Found at index 2!",
                    style: TextStyle(fontSize: 16, color: Colors.green, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Section Title Widget
  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Colors.indigo, // changed from blueAccent to indigo
      ),
    );
  }

  // Step Widget
  Widget _buildStep(String step) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.check_circle, color: Colors.green, size: 20),
          SizedBox(width: 8),
          Expanded(
            child: Text(
              step,
              style: TextStyle(fontSize: 16, height: 1.5),
            ),
          ),
        ],
      ),
    );
  }

  // Illustration Row Widget
  Widget _buildIllustrationRow(List<String> elements, int foundIndex) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(elements.length, (index) {
        return Container(
          padding: EdgeInsets.all(8),
          margin: EdgeInsets.symmetric(horizontal: 4),
          decoration: BoxDecoration(
            color: index == foundIndex ? Colors.green : Colors.white,
            border: Border.all(color: Colors.blueAccent),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            elements[index],
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: index == foundIndex ? Colors.white : Colors.black,
            ),
          ),
        );
      }),
    );
  }
}
