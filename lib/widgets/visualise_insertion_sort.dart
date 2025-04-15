import 'package:flutter/material.dart';
import 'dart:async';

class VisualizeInsertionSort extends StatefulWidget {
  const VisualizeInsertionSort({super.key});

  @override
  State<VisualizeInsertionSort> createState() => _VisualizeInsertionSortState();
}

class _VisualizeInsertionSortState extends State<VisualizeInsertionSort> {
  final List<int> numbers = [50, 20, 70, 10, 30, 60, 90, 40, 80, 100];
  int currentKeyIndex = -1;
  int comparingIndex = -1;
  int sortedUpto = -1;
  bool isSorting = false;
  double speed = 1.0;

  Future<void> _startSort() async {
    if (isSorting) return;

    setState(() {
      isSorting = true;
      currentKeyIndex = -1;
      comparingIndex = -1;
      sortedUpto = -1;
    });

    for (int i = 1; i < numbers.length; i++) {
      int key = numbers[i];
      int j = i - 1;

      setState(() {
        currentKeyIndex = i;
      });

      await Future.delayed(Duration(milliseconds: (500 ~/ speed)));

      while (j >= 0 && numbers[j] > key) {
        setState(() {
          comparingIndex = j;
        });

        await Future.delayed(Duration(milliseconds: (400 ~/ speed)));

        numbers[j + 1] = numbers[j];
        j--;

        setState(() {});
        await Future.delayed(Duration(milliseconds: (300 ~/ speed)));
      }

      numbers[j + 1] = key;

      setState(() {
        sortedUpto = i;
        comparingIndex = -1;
        currentKeyIndex = -1;
      });

      await Future.delayed(Duration(milliseconds: (400 ~/ speed)));
    }

    setState(() {
      isSorting = false;
      sortedUpto = numbers.length - 1;
    });
  }

  Widget _buildBox(int value, int index) {
    Color backgroundColor = Colors.white;
    Color borderColor = Colors.grey.shade300;
    Color textColor = Colors.black87;

    if (index == currentKeyIndex) {
      backgroundColor = Colors.blue.shade400;
      borderColor = Colors.blue.shade700;
      textColor = Colors.white;
    } else if (index == comparingIndex) {
      backgroundColor = Colors.deepPurple.shade400;
      borderColor = Colors.deepPurple.shade700;
      textColor = Colors.white;
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
        colors: [Colors.indigo, Colors.purple],
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
              Center(child: _buildGradientTitle('Insertion Sort Visualizer')),
              const SizedBox(height: 6),
              Center(
                child: Text(
                  'Step-by-step visualization of the Insertion Sort algorithm.',
                  style: TextStyle(fontSize: 13, color: Colors.grey.shade700),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 22),

              // Control Card
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
                          backgroundColor: Colors.deepPurple,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Text('Start Insertion Sort'),
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
                        activeColor: Colors.indigo,
                        onChanged: isSorting ? null : (value) => setState(() => speed = value),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 22),

              // Visual
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
