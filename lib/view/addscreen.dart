import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:prov_setup/controller/provider_page.dart';
import 'package:prov_setup/widgets/addbutton.dart';
import 'package:prov_setup/widgets/customtextfield.dart';
import 'package:prov_setup/widgets/imagepickwidget.dart';
import 'package:provider/provider.dart';

class AddScreen extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _placeController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  AddScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.purple,
        elevation: 16.0,
        title: const Center(
          child: Text(
            "ADD STUDENT",
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add),
            iconSize: 24,
            color: Colors.purple,
            tooltip: "Save",
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Consumer<NameProvider>(
              builder: (context, nameProvider, child) {
                return Column(
                  children: [
                    CustomProfileAvatar(
                      backgroundColor: Colors.purple[300]!,
                      imagePath: nameProvider.selectedImagePath,
                      onGalleryTap: () {
                        nameProvider.pickImage(ImageSource.gallery);
                      },
                      onCameraTap: () {
                        nameProvider.pickImage(ImageSource.camera);
                      },
                      cirlebackgroundColor: Colors.purpleAccent,
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    CustomTextField(
                      keyboard: TextInputType.text,
                      controller: _nameController,
                      labelText: 'Enter name',
                      prefixIcon: const Icon(Icons.person_2_rounded),
                    ),
                    const SizedBox(height: 20),
                    CustomTextField(
                      keyboard: TextInputType.number,
                      controller: _ageController,
                      labelText: 'Enter Age',
                      prefixIcon: const Icon(Icons.numbers),
                    ),
                    const SizedBox(height: 20),
                    CustomTextField(
                      keyboard: TextInputType.number,
                      controller: _phoneController,
                      labelText: 'Enter Phone',
                      prefixIcon: const Icon(Icons.phone),
                    ),
                    const SizedBox(height: 20),
                    CustomTextField(
                      keyboard: TextInputType.text,
                      controller: _placeController,
                      labelText: 'Enter Place',
                      prefixIcon: const Icon(Icons.place),
                    ),
                    const SizedBox(height: 30),
                    CustomButton(
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          final name = _nameController.text;
                          final age = int.tryParse(_ageController.text) ?? 0;
                          final place = _placeController.text;
                          final phoneNumber = _phoneController.text;

                          if (name.isNotEmpty &&
                              place.isNotEmpty &&
                              phoneNumber.isNotEmpty &&
                              nameProvider.selectedImagePath != null) {
                            nameProvider.addStudent(name, age, place,
                                phoneNumber, nameProvider.selectedImagePath!);
                            _nameController.clear();
                            _ageController.clear();
                            _placeController.clear();
                            _phoneController.clear();
                            nameProvider.clearSelectedImage();
                            Navigator.pop(context);
                          }
                        }
                      },
                      gradientColors: [
                        Colors.purple[500]!,
                        Colors.purple[300]!
                      ],
                      boxShadowColor: Colors.purple,
                      buttonText: "ADD STUDENT",
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
