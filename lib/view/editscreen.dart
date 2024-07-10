import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:prov_setup/controller/provider_page.dart';
import 'package:prov_setup/model/name_model.dart';
import 'package:prov_setup/widgets/customtextfield.dart';
import 'package:provider/provider.dart';

class EditScreen extends StatelessWidget {
  final Name nameEntry;
  final int index;

  const EditScreen({super.key, required this.nameEntry, required this.index});

  @override
  Widget build(BuildContext context) {
    final nameProvider = Provider.of<NameProvider>(context);
    TextEditingController nameController = TextEditingController();
    TextEditingController ageController = TextEditingController();
    TextEditingController placeController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
    String? selectedImagePath = nameEntry.imageUrl;

    nameController.text = nameEntry.name;
    ageController.text = nameEntry.age.toString();
    placeController.text = nameEntry.place;
    phoneController.text = nameEntry.phoneNumber;
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.purple,
        elevation: 16.0,
        title: const Center(
          child: Text(
            "EDIT STUDENT",
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
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Center(
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      CircleAvatar(
                        radius: 60,
                        backgroundColor: Colors.blue,
                        child: ClipOval(
                          // ignore: unnecessary_null_comparison
                          child: selectedImagePath != null
                              ? Image.file(
                                  File(selectedImagePath),
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
                                    nameProvider.pickImage(ImageSource.gallery);
                                    Navigator.of(context).pop();
                                  },
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text("Gallery"),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    nameProvider.pickImage(ImageSource.camera);
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
                          backgroundColor: Colors.purpleAccent[200],
                          child: const Icon(Icons.add, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                CustomTextField(
                  keyboard: TextInputType.text,
                  controller: nameController,
                  labelText: 'Enter name',
                  prefixIcon: const Icon(Icons.person_2_rounded),
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  keyboard: TextInputType.number,
                  controller: ageController,
                  labelText: 'Enter Age',
                  prefixIcon: const Icon(Icons.numbers),
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  keyboard: TextInputType.number,
                  controller: phoneController,
                  labelText: 'Enter Phone',
                  prefixIcon: const Icon(Icons.phone),
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  keyboard: TextInputType.text,
                  controller: placeController,
                  labelText: 'Enter Place',
                  prefixIcon: const Icon(Icons.place),
                ),
                const SizedBox(height: 20),
                Consumer<NameProvider>(
                  builder: (context, nameProvider, _) {
                    return InkWell(
                      onTap: () {
                        final name = nameController.text;
                        final age = int.tryParse(ageController.text) ?? 0;
                        final place = placeController.text;
                        final phoneNumber = phoneController.text;

                        if (name.isNotEmpty &&
                            place.isNotEmpty &&
                            phoneNumber.isNotEmpty) {
                          nameProvider.updateStudent(
                            index,
                            name,
                            age,
                            place,
                            phoneNumber,
                            selectedImagePath,
                          );
                          Navigator.pop(context);
                        }
                      },
                      child: Container(
                        height: 60,
                        width: 250,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Colors.purple[500]!, Colors.purple[300]!],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.purple,
                              spreadRadius: 2,
                              blurRadius: 3,
                              offset: Offset(0, 3),
                            ),
                          ],
                          borderRadius:
                              const BorderRadius.all(Radius.circular(15.0)),
                        ),
                        child: const Center(
                          child: Text(
                            "EDIT",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w800,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
