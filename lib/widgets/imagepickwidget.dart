import 'package:flutter/material.dart';
import 'dart:io';

class CustomProfileAvatar extends StatelessWidget {
  final Color cirlebackgroundColor;
  final Color backgroundColor;
  final String? imagePath;
  final VoidCallback onGalleryTap;
  final VoidCallback onCameraTap;

  const CustomProfileAvatar({
    super.key,
    required this.backgroundColor,
    required this.cirlebackgroundColor,
    required this.imagePath,
    required this.onGalleryTap,
    required this.onCameraTap,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          CircleAvatar(
            radius: 60,
            backgroundColor: backgroundColor,
            child: ClipOval(
              child: imagePath != null
                  ? Image.file(
                      File(imagePath!),
                      fit: BoxFit.cover,
                      width: 120,
                      height: 120,
                    )
                  : const Icon(
                      Icons.person,
                      size: 60,
                      color: Colors.white,
                    ),
            ),
          ),
          InkWell(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text("Choose image"),
                  actions: [
                    InkWell(
                      onTap: () {
                        onGalleryTap();
                        Navigator.of(context).pop();
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text("Gallery"),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        onCameraTap();
                        Navigator.of(context).pop();
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text("Camera"),
                      ),
                    ),
                  ],
                ),
              );
            },
            child: CircleAvatar(
              radius: 20,
              backgroundColor: cirlebackgroundColor,
              child: const Icon(Icons.add, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
