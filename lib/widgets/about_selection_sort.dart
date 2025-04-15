import 'package:flutter/material.dart';

class AboutSelectionSort extends StatelessWidget {
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
                'Selection Sort Algorithm',
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
              "Selection sort is a simple comparison-based sorting algorithm. It divides the input list into two parts: a sorted sublist of items which is built up from left to right at the front (left) of the list and a sublist of the remaining unsorted items. It repeatedly selects the smallest (or largest) element from the unsorted part and swaps it with the leftmost unsorted element.",
              style: TextStyle(fontSize: 16, height: 1.5),
            ),

            SizedBox(height: 20),

            _buildSectionTitle("🛠️ Steps to Perform Selection Sort"),
            SizedBox(height: 10),
            _buildStep("Start with the first element as the minimum."),
            _buildStep("Compare this minimum with the rest of the array."),
            _buildStep("If a smaller element is found, set it as the new minimum."),
            _buildStep("After the complete pass, swap the minimum element with the first element."),
            _buildStep("Repeat the same process with the next position until the array is sorted."),

            SizedBox(height: 20),

            _buildSectionTitle("⏳ Time Complexity"),
            SizedBox(height: 8),
            Text(
              "• Best Case: O(n²)\n• Average Case: O(n²)\n• Worst Case: O(n²)",
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

            _buildIllustrationStep("Original Array", ["29", "10", "14", "37", "13"], 1),
            _buildIllustrationNote("Swap 10 with 29 → [10, 29, 14, 37, 13]"),

            _buildIllustrationStep("Pass 2: Find min from [29, 14, 37, 13]", ["10", "29", "14", "37", "13"], 4),
            _buildIllustrationNote("Swap 13 with 29 → [10, 13, 14, 37, 29]"),

            _buildIllustrationStep("Pass 3: Find min from [14, 37, 29]", ["10", "13", "14", "37", "29"], 2),
            _buildIllustrationNote("14 is already in correct position."),

            _buildIllustrationStep("Pass 4: Find min from [37, 29]", ["10", "13", "14", "37", "29"], 4),
            _buildIllustrationNote("Swap 29 with 37 → [10, 13, 14, 29, 37]"),

            _buildIllustrationStep("Final Pass", ["10", "13", "14", "29", "37"], -1),

            SizedBox(height: 20),
            Center(
              child: Text(
                "✅ Final Sorted Array: [10, 13, 14, 29, 37]",
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

  Widget _buildIllustrationStep(String label, List<String> elements, int minIndex) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "➡️ $label",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 6),
        _buildIllustrationRow(elements, minIndex),
        SizedBox(height: 14),
      ],
    );
  }

  Widget _buildIllustrationNote(String note) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14.0),
      child: Text(
        "✅ $note",
        style: TextStyle(
          fontSize: 16,
          color: Colors.green,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildIllustrationRow(List<String> elements, int minIndex) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(elements.length, (index) {
        return Container(
          padding: EdgeInsets.all(8),
          margin: EdgeInsets.symmetric(horizontal: 4),
          decoration: BoxDecoration(
            color: index == minIndex ? Colors.green : Colors.white,
            border: Border.all(color: Colors.blueAccent),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            elements[index],
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: index == minIndex ? Colors.white : Colors.black,
            ),
          ),
        );
      }),
    );
  }
}
