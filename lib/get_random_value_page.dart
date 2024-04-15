import 'dart:math';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'saved_numbers_page.dart';

class GetRandomValuePage extends StatefulWidget {
  final SharedPreferences prefs;

  const GetRandomValuePage({super.key, required this.prefs});

  @override
  State<GetRandomValuePage> createState() => _GetRandomValuePageState();
}

class _GetRandomValuePageState extends State<GetRandomValuePage> {
  late SharedPreferences _prefs;
  Random random = Random();
  List<int> savedNumbers = [];

  @override
  void initState() {
    super.initState();
    _prefs = widget.prefs;
    _loadSavedNumbers();
  }

  Future<void> _loadSavedNumbers() async {
    savedNumbers =
        _prefs.getStringList('saved_numbers')?.map(int.parse).toList() ?? [];
  }

  Future<void> _saveNumber(int number) async {
    savedNumbers.add(number);
    await _prefs.setStringList(
        'saved_numbers', savedNumbers.map((e) => e.toString()).toList());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News Page'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text("Рандом цифра:"),
            Text("${random.nextInt(100000)}"),
            ElevatedButton(
              onPressed: () async {
                final newNumber = random.nextInt(100000);
                await _saveNumber(newNumber);
                setState(() {});
              },
              child: const Text("Получить новое число"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SavedNumbersPage(savedNumbers)),
                );
              },
              child: const Text("Список сохраненных чисел"),
            ),
          ],
        ),
      ),
    );
  }
}
