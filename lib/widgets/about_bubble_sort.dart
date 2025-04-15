import 'package:flutter/material.dart';

class AboutBubbleSort extends StatelessWidget {
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
                'Bubble Sort Algorithm',
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
              "Bubble sort is a simple sorting algorithm that repeatedly steps through the list, compares adjacent elements, and swaps them if they are in the wrong order.",
              style: TextStyle(fontSize: 16, height: 1.5),
            ),

            SizedBox(height: 20),

            // Steps Section
            _buildSectionTitle("🛠️ Steps to Perform Bubble Sort"),
            SizedBox(height: 10),
            _buildStep("Start from the first element."),
            _buildStep("Compare the current element with the next one."),
            _buildStep("If the current element is greater than the next, swap them."),
            _buildStep("Move to the next pair and repeat the comparison."),
            _buildStep("Repeat the process for all elements until no swaps are needed."),

            SizedBox(height: 20),

            // Time Complexity Section
            _buildSectionTitle("⏳ Time Complexity"),
            SizedBox(height: 8),
            Text(
              "• Best Case (Already sorted): O(n)\n"
                  "• Average Case: O(n²)\n"
                  "• Worst Case (Reversed): O(n²)",
              style: TextStyle(fontSize: 16, height: 1.5, color: Colors.black),
            ),

            SizedBox(height: 20),

            // Space Complexity Section
            _buildSectionTitle("💾 Space Complexity"),
            SizedBox(height: 8),
            Text(
              "• O(1) (In-place sorting, no extra space required).",
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildIllustrationStep("Initial Array: [5, 2, 9]", ["5", "2", "9"], [false, false, false]),
                  SizedBox(height: 10),
                  _buildIllustrationStep("Pass 1: Compare 5 & 2, swap", ["2", "5", "9"], [true, true, false]),
                  SizedBox(height: 10),
                  _buildIllustrationStep("Pass 1: Compare 5 & 9, no swap", ["2", "5", "9"], [false, true, true]),
                  Divider(),
                  _buildIllustrationStep("Pass 2: Compare 2 & 5, no swap", ["2", "5", "9"], [true, true, false]),
                  _buildIllustrationStep("Pass 2: Compare 5 & 9, no swap", ["2", "5", "9"], [false, true, true]),
                  Divider(),
                  _buildIllustrationStep("Final Sorted Array: [2, 5, 9]", ["2", "5", "9"], [true, true, true]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

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

  Widget _buildIllustrationStep(
      String label, List<String> elements, List<bool> highlights) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(elements.length, (index) {
            return Container(
              padding: EdgeInsets.all(8),
              margin: EdgeInsets.symmetric(horizontal: 4),
              decoration: BoxDecoration(
                color: highlights[index] ? Colors.green : Colors.white,
                border: Border.all(color: Colors.blueAccent),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                elements[index],
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: highlights[index] ? Colors.white : Colors.black,
                ),
              ),
            );
          }),
        ),
      ],
    );
  }
}
