import 'package:flutter/material.dart';
import 'dart:async';

class VisualizeSelectionSort extends StatefulWidget {
  const VisualizeSelectionSort({super.key});

  @override
  State<VisualizeSelectionSort> createState() => _VisualizeSelectionSortState();
}

class _VisualizeSelectionSortState extends State<VisualizeSelectionSort> {
  final List<int> numbers = [50, 20, 70, 10, 30, 60, 90, 40, 80, 100];
  int currentIndex = -1;
  int comparingIndex = -1;
  int minIndex = -1;
  int sortedUpto = -1;
  bool isSorting = false;
  double speed = 1.0;

  Future<void> _startSort() async {
    if (isSorting) return;

    setState(() {
      isSorting = true;
      currentIndex = -1;
      comparingIndex = -1;
      minIndex = -1;
      sortedUpto = -1;
    });

    int n = numbers.length;

    for (int i = 0; i < n - 1; i++) {
      setState(() {
        currentIndex = i;
        minIndex = i;
      });
      await Future.delayed(Duration(milliseconds: (300 ~/ speed)));

      for (int j = i + 1; j < n; j++) {
        setState(() {
          comparingIndex = j;
        });

        await Future.delayed(Duration(milliseconds: (300 ~/ speed)));

        if (numbers[j] < numbers[minIndex]) {
          setState(() {
            minIndex = j;
          });
          await Future.delayed(Duration(milliseconds: (200 ~/ speed)));
        }
      }

      if (minIndex != i) {
        int temp = numbers[i];
        numbers[i] = numbers[minIndex];
        numbers[minIndex] = temp;
      }

      setState(() {
        sortedUpto = i;
        comparingIndex = -1;
        currentIndex = -1;
        minIndex = -1;
      });

      await Future.delayed(Duration(milliseconds: (400 ~/ speed)));
    }

    setState(() {
      sortedUpto = numbers.length - 1;
      isSorting = false;
    });
  }

  Widget _buildBox(int value, int index) {
    Color backgroundColor = Colors.white;
    Color borderColor = Colors.grey.shade300;
    Color textColor = Colors.black87;

    if (index == currentIndex) {
      backgroundColor = Colors.blue.shade400;
      borderColor = Colors.blue.shade700;
      textColor = Colors.white;
    } else if (index == comparingIndex) {
      backgroundColor = Colors.deepPurple.shade400;
      borderColor = Colors.deepPurple.shade700;
      textColor = Colors.white;
    } else if (index == minIndex) {
      backgroundColor = Colors.amber.shade400;
      borderColor = Colors.amber.shade700;
      textColor = Colors.black;
    } else if (index <= sortedUpto) {
      backgroundColor = Colors.green.shade400;
      borderColor = Colors.green.shade700;
      textColor = Colors.white;
    }

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.all(6),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: borderColor, width: 2),
        boxShadow: [
          BoxShadow(
            color: borderColor.withOpacity(0.3),
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Text(
        value.toString(),
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: textColor,
        ),
      ),
    );
  }

  Widget _buildGradientTitle(String text) {
    return ShaderMask(
      shaderCallback: (bounds) => const LinearGradient(
        colors: [Colors.teal, Colors.indigo],
      ).createShader(bounds),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: Colors.white,
          letterSpacing: 1.1,
          shadows: [
            Shadow(blurRadius: 6, color: Colors.black26, offset: Offset(1, 1)),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFB),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: _buildGradientTitle('Selection Sort Visualizer')),
              const SizedBox(height: 6),
              Center(
                child: Text(
                  'Watch how the smallest elements bubble to the front!',
                  style: TextStyle(fontSize: 13, color: Colors.grey.shade700),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 22),

              Card(
                elevation: 3,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                child: Padding(
                  padding: const EdgeInsets.all(14),
                  child: Column(
                    children: [
                      ElevatedButton(
                        onPressed: isSorting ? null : _startSort,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.teal,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Text('Start Selection Sort'),
                      ),
                      const SizedBox(height: 14),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Speed', style: TextStyle(fontWeight: FontWeight.w600)),
                          Text('${speed.toStringAsFixed(1)}x'),
                        ],
                      ),
                      Slider(
                        value: speed,
                        min: 0.5,
                        max: 3.0,
                        divisions: 5,
                        label: '${speed.toStringAsFixed(1)}x',
                        activeColor: Colors.teal,
                        onChanged: isSorting ? null : (value) => setState(() => speed = value),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 22),

              Card(
                elevation: 3,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    children: List.generate(numbers.length, (i) => _buildBox(numbers[i], i)),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              if (!isSorting && sortedUpto == numbers.length - 1)
                Center(
                  child: Text(
                    '✅ Sorting Complete',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.green.shade700),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
