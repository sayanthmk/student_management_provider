import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:hive/hive.dart';
import '../model/name_model.dart';

class NameProvider with ChangeNotifier {
  final Box<Name> _nameBox;
  String? selectedImagePath;

  NameProvider() : _nameBox = Hive.box<Name>('names');

  List<Name> get names => _nameBox.values.toList();

  void addStudent(
      String name, int age, String place, String phoneNumber, String imageUrl) {
    _nameBox.add(Name(
        name: name,
        age: age,
        place: place,
        phoneNumber: phoneNumber,
        imageUrl: imageUrl));
    notifyListeners();
  }

  void updateStudent(int index, String name, int age, String place,
      String phoneNumber, String imageUrl) {
    _nameBox.putAt(
        index,
        Name(
            name: name,
            age: age,
            place: place,
            phoneNumber: phoneNumber,
            imageUrl: imageUrl));
    notifyListeners();
  }

  void deleteName(int index) {
    _nameBox.deleteAt(index);
    notifyListeners();
  }

  List<Name> searchNames(String query) {
    if (query.isEmpty) {
      return names;
    } else {
      return names.where((name) {
        return name.name.toLowerCase().contains(query.toLowerCase()) ||
            name.place.toLowerCase().contains(query.toLowerCase()) ||
            name.phoneNumber.toLowerCase().contains(query.toLowerCase());
      }).toList();
    }
  }

  Future<void> pickImage(ImageSource source) async {
    final pickedImage = await ImagePicker().pickImage(source: source);
    if (pickedImage != null) {
      selectedImagePath = pickedImage.path;
      notifyListeners();
    }
  }

  void clearSelectedImage() {
    selectedImagePath = null;
    notifyListeners();
  }
}
