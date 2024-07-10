import 'dart:io';
import 'package:flutter/material.dart';
import 'package:prov_setup/model/name_model.dart';
import 'package:prov_setup/widgets/customtextbox.dart';

class ProfileScreen extends StatelessWidget {
  final Name nameEntry;

  const ProfileScreen({super.key, required this.nameEntry});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          "Profile",
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.w600, fontSize: 25),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              if (nameEntry.imageUrl.isNotEmpty)
                Center(
                    child: CircleAvatar(
                  radius: 50,
                  child: ClipOval(
                    child: Image.file(
                      File(nameEntry.imageUrl),
                      fit: BoxFit.cover,
                      width: 100,
                      height: 100,
                    ),
                  ),
                )),
              const SizedBox(height: 16),
              Center(
                child: Text(nameEntry.name,
                    style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                        color: Colors.black)),
              ),
              const SizedBox(height: 10),
              CustomTextBox(nameEntry: nameEntry.place, fieldicon: Icons.place),
              const SizedBox(height: 20),
              CustomTextBox(
                  nameEntry: (nameEntry.age).toString(),
                  fieldicon: Icons.calendar_today),
              const SizedBox(height: 20),
              CustomTextBox(
                  nameEntry: nameEntry.phoneNumber, fieldicon: Icons.phone),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
