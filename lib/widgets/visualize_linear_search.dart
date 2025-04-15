import 'package:flutter/material.dart';
import 'dart:async';

class VisualizeLinearSearch extends StatefulWidget {
  const VisualizeLinearSearch({super.key});

  @override
  State<VisualizeLinearSearch> createState() => _VisualizeLinearSearchState();
}

class _VisualizeLinearSearchState extends State<VisualizeLinearSearch> {
  final TextEditingController _targetController = TextEditingController();
  final List<int> numbers = List.generate(10, (index) => (index + 1) * 5);
  int currentIndex = -1;
  int foundIndex = -1;
  bool isSearching = false;
  double speed = 1.0;

  @override
  void initState() {
    super.initState();
    _targetController.addListener(() {
      if (_targetController.text.trim().isEmpty) {
        setState(() {
          currentIndex = -1;
          foundIndex = -1;
          isSearching = false;
        });
      }
    });
  }

  Future<void> _startSearch() async {
    final text = _targetController.text.trim();
    if (text.isEmpty || isSearching) return;

    final target = int.tryParse(text);
    if (target == null) return;

    setState(() {
      isSearching = true;
      currentIndex = -1;
      foundIndex = -1;
    });

    for (int i = 0; i < numbers.length; i++) {
      await Future.delayed(Duration(milliseconds: (600 ~/ speed)));
      setState(() => currentIndex = i);

      if (numbers[i] == target) {
        await Future.delayed(Duration(milliseconds: (400 ~/ speed)));
        setState(() {
          foundIndex = i;
          isSearching = false;
        });
        return;
      }
    }

    await Future.delayed(const Duration(milliseconds: 500));
    setState(() => isSearching = false);
  }

  Widget _buildBox(int value, int index) {
    Color backgroundColor = Colors.white;
    Color borderColor = Colors.grey.shade300;
    Color textColor = Colors.black87;

    if (index == foundIndex) {
      backgroundColor = Colors.green.shade400;
      borderColor = Colors.green.shade700;
      textColor = Colors.white;
    } else if (index == currentIndex) {
      backgroundColor = Colors.deepPurple.shade400;
      borderColor = Colors.deepPurple.shade700;
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
              Center(child: _buildGradientTitle('Linear Search Visualizer')),
              const SizedBox(height: 6),
              Center(
                child: Text(
                  'Visual demonstration of the linear search algorithm.',
                  style: TextStyle(fontSize: 13, color: Colors.grey.shade700),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 22),

              // Input Card
              Card(
                elevation: 3,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                child: Padding(
                  padding: const EdgeInsets.all(14),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: _targetController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                hintText: 'Enter number to search...',
                                contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                isDense: true,
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          ElevatedButton(
                            onPressed: isSearching ? null : _startSearch,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.deepPurple,
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: const Text('Search'),
                          ),
                        ],
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
                        onChanged: isSearching ? null : (value) => setState(() => speed = value),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 22),

              // Array visual
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

              if (!isSearching && foundIndex != -1)
                Center(
                  child: Text(
                    '✅ Found at index $foundIndex',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.green.shade700),
                  ),
                )
              else if (!isSearching && foundIndex == -1 && currentIndex != -1)
                const Center(
                  child: Text(
                    '❌ Not found in the list',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.redAccent),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
