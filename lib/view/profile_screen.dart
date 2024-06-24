import 'dart:io';
import 'package:flutter/material.dart';
import '../model/name_model.dart';

class ProfileScreen extends StatelessWidget {
  final Name nameEntry;

  const ProfileScreen({super.key, required this.nameEntry});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(nameEntry.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (nameEntry.imageUrl.isNotEmpty)
              Center(
                child: Image.file(File(nameEntry.imageUrl),
                    width: 150, height: 150, fit: BoxFit.cover),
              ),
            const SizedBox(height: 16),
            Text('Name: ${nameEntry.name}',
                style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 8),
            Text('Age: ${nameEntry.age}', style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 8),
            Text('Place: ${nameEntry.place}',
                style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 8),
            Text('Phone: ${nameEntry.phoneNumber}',
                style: const TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
