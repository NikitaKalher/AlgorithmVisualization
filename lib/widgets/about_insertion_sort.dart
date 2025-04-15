import 'package:flutter/material.dart';

class AboutInsertionSort extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                'Insertion Sort Algorithm',
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

            _buildSectionTitle("🔍 Definition"),
            SizedBox(height: 8),
            Text(
              "Insertion sort is a simple sorting algorithm that builds the final sorted array one element at a time. It is much like sorting playing cards in your hands – you pick one card at a time and insert it into the correct position.",
              style: TextStyle(fontSize: 16, height: 1.5),
            ),

            SizedBox(height: 20),

            _buildSectionTitle("🛠️ Steps to Perform Insertion Sort"),
            SizedBox(height: 10),
            _buildStep("Start with the second element (index 1) in the array."),
            _buildStep("Compare it with the element(s) before it."),
            _buildStep("Shift all elements greater than the key to one position ahead."),
            _buildStep("Insert the key element at the correct position."),
            _buildStep("Repeat for all remaining elements in the array."),

            SizedBox(height: 20),

            _buildSectionTitle("⏳ Time Complexity"),
            SizedBox(height: 8),
            Text(
              "• Best Case (Already Sorted): O(n)\n"
                  "• Average Case: O(n²)\n"
                  "• Worst Case (Reverse Order): O(n²)",
              style: TextStyle(fontSize: 16, height: 1.5, color: Colors.black),
            ),

            SizedBox(height: 20),

            _buildSectionTitle("💾 Space Complexity"),
            SizedBox(height: 8),
            Text(
              "• O(1) (In-place sorting, no extra space required).",
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),

            SizedBox(height: 20),

            _buildSectionTitle("📌 Illustration"),
            SizedBox(height: 10),
            _buildIllustrationStep("Original Array", ["5", "3", "4", "1", "2"], -1),
            _buildIllustrationStep("Insert 3 before 5", ["3", "5", "4", "1", "2"], 0),
            _buildIllustrationStep("Insert 4 between 3 and 5", ["3", "4", "5", "1", "2"], 1),
            _buildIllustrationStep("Insert 1 at the beginning", ["1", "3", "4", "5", "2"], 0),
            _buildIllustrationStep("Insert 2 after 1", ["1", "2", "3", "4", "5"], 1),
            SizedBox(height: 20),
            Center(
              child: Text(
                "✅ Final Sorted Array: [1, 2, 3, 4, 5]",
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.green,
                    fontWeight: FontWeight.bold),
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

  Widget _buildIllustrationStep(String label, List<String> elements, int highlightIndex) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "➡️ $label",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black, // Changed from deepPurple to black
          ),
        ),
        SizedBox(height: 6),
        _buildIllustrationRow(elements, highlightIndex),
        SizedBox(height: 14),
      ],
    );
  }

  Widget _buildIllustrationRow(List<String> elements, int highlightedIndex) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(elements.length, (index) {
        return Container(
          padding: EdgeInsets.all(8),
          margin: EdgeInsets.symmetric(horizontal: 4),
          decoration: BoxDecoration(
            color: index == highlightedIndex ? Colors.green : Colors.white,
            border: Border.all(color: Colors.blueAccent),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            elements[index],
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: index == highlightedIndex ? Colors.white : Colors.black,
            ),
          ),
        );
      }),
    );
  }
}
