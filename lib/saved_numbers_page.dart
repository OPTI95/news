import 'package:flutter/material.dart';

class SavedNumbersPage extends StatelessWidget {
  final List<int> savedNumbers;

  const SavedNumbersPage(this.savedNumbers, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Saved Numbers'),
      ),
      body: ListView.builder(
        itemCount: savedNumbers.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Number: ${savedNumbers[index]}'),
          );
        },
      ),
    );
  }
}
