import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/github.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CodeBinarySearch extends StatefulWidget {
  @override
  _CodeBinarySearchState createState() => _CodeBinarySearchState();
}

class _CodeBinarySearchState extends State<CodeBinarySearch> {
  final Map<String, String> _codeSamples = {
    'C': '''
#include <stdio.h>
int binarySearch(int arr[], int n, int x) {
    int left = 0, right = n - 1;
    while (left <= right) {
        int mid = left + (right - left) / 2;
        if (arr[mid] == x) return mid;
        else if (arr[mid] < x) left = mid + 1;
        else right = mid - 1;
    }
    return -1;
}
''',
    'C++': '''
#include <iostream>
using namespace std;
int binarySearch(int arr[], int n, int x) {
    int left = 0, right = n - 1;
    while (left <= right) {
        int mid = left + (right - left) / 2;
        if (arr[mid] == x) return mid;
        else if (arr[mid] < x) left = mid + 1;
        else right = mid - 1;
    }
    return -1;
}
''',
    'Java': '''
public class BinarySearch {
    public static int binarySearch(int[] arr, int x) {
        int left = 0, right = arr.length - 1;
        while (left <= right) {
            int mid = left + (right - left) / 2;
            if (arr[mid] == x) return mid;
            else if (arr[mid] < x) left = mid + 1;
            else right = mid - 1;
        }
        return -1;
    }
}
''',
    'Python': '''
def binary_search(arr, x):
    left, right = 0, len(arr) - 1
    while left <= right:
        mid = (left + right) // 2
        if arr[mid] == x:
            return mid
        elif arr[mid] < x:
            left = mid + 1
        else:
            right = mid - 1
    return -1
''',
  };

  String _selectedLanguage = 'C';

  void _copyCode(String code) {
    Clipboard.setData(ClipboardData(text: code));
    Fluttertoast.showToast(
      msg: "Code copied to clipboard!",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.black87,
      textColor: Colors.white,
    );
  }

  @override
  Widget build(BuildContext context) {
    String code = _codeSamples[_selectedLanguage] ?? '';

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Binary Search Code',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Text(
                "Select Language:",
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(width: 12),
              DropdownButton<String>(
                value: _selectedLanguage,
                icon: Icon(Icons.arrow_drop_down,color: Colors.black,),
                style: TextStyle(fontSize: 16, color: Colors.black),
                dropdownColor: Colors.grey,
                borderRadius: BorderRadius.circular(12),
                elevation: 4,
                onChanged: (value) {
                  setState(() {
                    _selectedLanguage = value!;
                  });
                },
                items: _codeSamples.keys.map((lang) {
                  return DropdownMenuItem<String>(
                    value: lang,
                    child: Text(lang),
                  );
                }).toList(),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Expanded(
            child: Card(
              elevation: 6,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: HighlightView(
                      code,
                      language: _selectedLanguage.toLowerCase(),
                      theme: githubTheme,
                      padding: EdgeInsets.all(12),
                      textStyle: TextStyle(
                        fontFamily: 'monospace',
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 8,
                    right: 8,
                    child: IconButton(
                      icon: Icon(Icons.copy, color: Colors.blueAccent),
                      onPressed: () => _copyCode(code),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
