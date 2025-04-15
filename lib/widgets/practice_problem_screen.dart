import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PracticeProblemsScreen extends StatefulWidget {
  @override
  _PracticeProblemsScreenState createState() => _PracticeProblemsScreenState();
}

class _PracticeProblemsScreenState extends State<PracticeProblemsScreen> {
  final List<Map<String, dynamic>> problems = [
    {'title': 'Linear Search - Basic Implementation', 'url': 'https://www.geeksforgeeks.org/problems/search-an-element-in-an-array-1587115621/1?itm_source=geeksforgeeks&itm_medium=article&itm_campaign=practice_card', 'done': false},
    {'title': 'Binary Search - Classic Problem', 'url': 'https://leetcode.com/problems/binary-search/', 'done': false},
    {'title': 'Bubble Sort - Sorting Practice', 'url': 'https://leetcode.com/problems/sort-an-array/', 'done': false},
    {'title': 'Selection Sort - Conceptual Practice', 'url': 'https://www.geeksforgeeks.org/selection-sort/', 'done': false},
    {'title': 'Insertion Sort - Core Understanding', 'url': 'https://www.geeksforgeeks.org/insertion-sort/', 'done': false},
    {'title': 'Search Insert Position (Binary)', 'url': 'https://leetcode.com/problems/search-insert-position/', 'done': false},
    {'title': 'First Bad Version (Binary Search)', 'url': 'https://leetcode.com/problems/first-bad-version/', 'done': false},
    {'title': 'Sort Colors (Bubble-Like)', 'url': 'https://leetcode.com/problems/sort-colors/', 'done': false},
    {'title': 'Maximum Subarray', 'url': 'https://leetcode.com/problems/maximum-subarray/', 'done': false},
    {'title': 'Find Minimum in Rotated Sorted Array', 'url': 'https://leetcode.com/problems/find-minimum-in-rotated-sorted-array/', 'done': false},
    {'title': 'Search a 2D Matrix', 'url': 'https://leetcode.com/problems/search-a-2d-matrix/', 'done': false},
    {'title': 'Find Peak Element', 'url': 'https://leetcode.com/problems/find-peak-element/', 'done': false},
    {'title': 'Find First and Last Position of Element', 'url': 'https://leetcode.com/problems/find-first-and-last-position-of-element-in-sorted-array/', 'done': false},
    {'title': 'Kth Missing Positive Number', 'url': 'https://leetcode.com/problems/kth-missing-positive-number/', 'done': false},
    {'title': 'Guess Number Higher or Lower', 'url': 'https://leetcode.com/problems/guess-number-higher-or-lower/', 'done': false},
    {'title': 'Sort Characters By Frequency', 'url': 'https://leetcode.com/problems/sort-characters-by-frequency/', 'done': false},
    {'title': 'Relative Sort Array', 'url': 'https://leetcode.com/problems/relative-sort-array/', 'done': false},
    {'title': 'Largest Number', 'url': 'https://leetcode.com/problems/largest-number/', 'done': false},
    {'title': 'Top K Frequent Elements', 'url': 'https://leetcode.com/problems/top-k-frequent-elements/', 'done': false},
    {'title': 'Sort the Matrix Diagonally', 'url': 'https://leetcode.com/problems/sort-the-matrix-diagonally/', 'done': false},
    {'title': 'Count of Smaller Numbers After Self', 'url': 'https://leetcode.com/problems/count-of-smaller-numbers-after-self/', 'done': false},
    {'title': 'Search in Rotated Sorted Array', 'url': 'https://leetcode.com/problems/search-in-rotated-sorted-array/', 'done': false},
    {'title': 'Merge Intervals', 'url': 'https://leetcode.com/problems/merge-intervals/', 'done': false},
    {'title': 'Meeting Rooms II', 'url': 'https://leetcode.com/problems/meeting-rooms-ii/', 'done': false},
    {'title': 'Minimum Number of Arrows to Burst Balloons', 'url': 'https://leetcode.com/problems/minimum-number-of-arrows-to-burst-balloons/', 'done': false},
    {'title': 'Insert Interval', 'url': 'https://leetcode.com/problems/insert-interval/', 'done': false},
    {'title': 'Sort Linked List', 'url': 'https://leetcode.com/problems/sort-list/', 'done': false},
    {'title': 'Wiggle Sort II', 'url': 'https://leetcode.com/problems/wiggle-sort-ii/', 'done': false},
    {'title': 'Median of Two Sorted Arrays', 'url': 'https://leetcode.com/problems/median-of-two-sorted-arrays/', 'done': false},
    {'title': 'Find K Closest Elements', 'url': 'https://leetcode.com/problems/find-k-closest-elements/', 'done': false},
  ];

  Map<String, int> countProblems() {
    int done = problems.where((p) => p['done'] == true).length;
    int total = problems.length;
    return {'done': done, 'remaining': total - done, 'total': total};
  }

  Widget buildProblemCounter() {
    final stats = countProblems();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text("✅ Done: ${stats['done']}", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
          Text("📌 Remaining: ${stats['remaining']}", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
          Text("📚 Total: ${stats['total']}", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: const Text(
          'Practice Problems',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          buildProblemCounter(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: ListView.builder(
                itemCount: problems.length,
                itemBuilder: (context, index) {
                  final problem = problems[index];
                  return Card(
                    color: Colors.white,
                    elevation: 5,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                    margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                    child: CheckboxListTile(
                      value: problem['done'],
                      onChanged: (bool? value) {
                        setState(() {
                          problem['done'] = value;
                        });
                      },
                      title: Text(
                        problem['title'],
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                          decoration: problem['done']! ? TextDecoration.lineThrough : null,
                        ),
                      ),
                      secondary: IconButton(
                        icon: const Icon(Icons.open_in_new, color: Colors.indigo),
                        onPressed: () async {
                          final Uri url = Uri.parse(problem['url']);
                          if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Could not launch the URL: ${problem['url']}')),
                            );
                          }
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
