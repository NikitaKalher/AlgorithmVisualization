import 'package:algorithm_visualizer/widgets/code_bubble_sort.dart';
import 'package:algorithm_visualizer/widgets/code_insertion_sort.dart';
import 'package:algorithm_visualizer/widgets/code_selection_sort.dart';
import 'package:algorithm_visualizer/widgets/visualise_binary_search.dart';
import 'package:algorithm_visualizer/widgets/visualise_bubble_sort.dart';
import 'package:algorithm_visualizer/widgets/visualise_insertion_sort.dart';
import 'package:algorithm_visualizer/widgets/visualise_selection_sort.dart';
import 'package:flutter/material.dart';
import 'package:algorithm_visualizer/widgets/code_linear_search.dart';
import 'package:algorithm_visualizer/widgets/visualize_linear_search.dart';
import 'package:algorithm_visualizer/widgets/about_linear_search.dart';

import 'about_binary_search.dart';
import 'about_bubble_sort.dart';
import 'about_insertion_sort.dart';
import 'about_selection_sort.dart';
import 'code_binary_search.dart';

class AlgorithmPage extends StatefulWidget {
  final String algorithmName;

  AlgorithmPage({required this.algorithmName});

  @override
  _AlgorithmPageState createState() => _AlgorithmPageState();
}

class _AlgorithmPageState extends State<AlgorithmPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Color headingColor = Colors.indigo;
    final Color textColor = Colors.black;
    final Color backgroundColor = Colors.white;

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: headingColor,
        elevation: 4,
        title: Text(
          widget.algorithmName,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'About'),
            Tab(text: 'Visualize'),
            Tab(text: 'Code'),
          ],
          indicatorColor: Colors.white,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white70,
          labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          unselectedLabelStyle: TextStyle(fontSize: 15),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.indigo.shade50, Colors.white],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: DefaultTextStyle(
          style: TextStyle(
            color: textColor,
            fontSize: 16,
          ),
          child: TabBarView(
            controller: _tabController,
            children: _getAlgorithmWidgets(widget.algorithmName),
          ),
        ),
      ),
    );
  }

  List<Widget> _getAlgorithmWidgets(String name) {
    switch (name) {
      case "Binary Search":
        return [
          AboutBinarySearch(),
          VisualizeBinarySearch(),
          CodeBinarySearch(),
        ];
      case "Bubble Sort":
        return [
          AboutBubbleSort(),
          VisualizeBubbleSort(),
          CodeBubbleSort(),
        ];
      case "Insertion Sort":
        return [
          AboutInsertionSort(),
          VisualizeInsertionSort(),
          CodeInsertionSort(),
        ];
      case "Selection Sort":
        return [
          AboutSelectionSort(),
          VisualizeSelectionSort(),
          CodeSelectionSort(),
        ];
      default: // Linear Search
        return [
          AboutLinearSearch(),
          VisualizeLinearSearch(),
          ProblemsLinearSearch(),
        ];
    }
  }

  Widget _placeholderText(String text) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 16,
        color: Colors.indigo,
        fontWeight: FontWeight.w500,
      ),
      textAlign: TextAlign.center,
    );
  }
}
