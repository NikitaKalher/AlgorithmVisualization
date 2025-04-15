import 'package:algorithm_visualizer/widgets/practice_problem_screen.dart';
import 'package:flutter/material.dart';
import 'algorithum_page.dart';
import 'drawerWidget.dart';

class SearchSortPage extends StatelessWidget {
  final Color backgroundColor = Colors.white;
  final Color primaryColor = Colors.indigo;
  final Color cardColor = Colors.indigo.shade50;

  final TextStyle sectionTitleStyle = const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: Colors.indigo,
  );

  final TextStyle listItemStyle = const TextStyle(
    fontSize: 16,
    color: Colors.black87,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: const Text(
          'Algorithm Visualization',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu, color: Colors.white),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
      ),
      drawer: DrawerWidget(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSection(context, 'Searching Algorithms', [
                'Linear Search',
                'Binary Search',
              ]),
              const SizedBox(height: 24),
              _buildSection(context, 'Sorting Algorithms', [
                'Bubble Sort',
                'Insertion Sort',
                'Selection Sort',
              ]),
              const SizedBox(height: 40),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 14),
                    backgroundColor: Colors.indigo,
                    foregroundColor: Colors.white,
                    elevation: 6,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PracticeProblemsScreen(),
                      ),
                    );
                  },

                  child: const Text('Solve Practice Problems'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSection(BuildContext context, String title, List<String> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: sectionTitleStyle),
        const SizedBox(height: 12),
        ...items.map((item) => Card(
          color: cardColor,
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          margin: const EdgeInsets.symmetric(vertical: 6),
          child: ListTile(
            title: Text(item, style: listItemStyle),
            trailing: const Icon(Icons.arrow_forward_ios_rounded, size: 16),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AlgorithmPage(algorithmName: item),
                ),
              );
            },
          ),
        )),
      ],
    );
  }
}
