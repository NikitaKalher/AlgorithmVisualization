import 'package:flutter/material.dart';

class AboutLinearSearch extends StatelessWidget {
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
                'Linear Search Algorithm',
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
              "Linear search is a simple searching algorithm that sequentially checks each element in the list until the target element is found or the list ends.",
              style: TextStyle(fontSize: 16, height: 1.5),
            ),

            SizedBox(height: 20),

            // Steps Section
            _buildSectionTitle("🛠️ Steps to Perform Linear Search"),
            SizedBox(height: 10),
            _buildStep("Start from the first element of the array."),
            _buildStep("Compare the current element with the target value."),
            _buildStep("If a match is found, return the index."),
            _buildStep("If not, move to the next element."),
            _buildStep("Repeat until the target is found or the list ends."),
            _buildStep("If the target is not found, return -1."),

            SizedBox(height: 20),

            // Time Complexity Section
            _buildSectionTitle("⏳ Time Complexity"),
            SizedBox(height: 8),
            Text(
              "• Best Case (Element found at first position): O(1)\n"
                  "• Average Case (Element somewhere in middle): O(n)\n"
                  "• Worst Case (Element not found): O(n)",
              style: TextStyle(fontSize: 16, height: 1.5, color: Colors.black),
            ),

            SizedBox(height: 20),

            // Space Complexity Section
            _buildSectionTitle("💾 Space Complexity"),
            SizedBox(height: 8),
            Text(
              "• O(1) (Only a few extra variables are used, no additional data structures needed).",
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
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                  SizedBox(height: 10),
                  _buildIllustrationRow(["2", "4", "7", "10", "14"], 2),
                  SizedBox(height: 10),
                  Text(
                    "✅ Found at index 2!",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
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
        color: Colors.indigo,
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
