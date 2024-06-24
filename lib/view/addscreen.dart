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




   // nameProvider.selectedImagePath != null
                    //     ? Image.file(
                    //         File(nameProvider.selectedImagePath!),
                    //         width: 200,
                    //         height: 200,
                    //       )
                    //     : const Text('Please select an image'),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //   children: [
                    //     MaterialButton(
                    //       color: Colors.blue,
                    //       child: const Text(
                    //         'Pick from Gallery',
                    //         style: TextStyle(
                    //           color: Colors.white,
                    //           fontWeight: FontWeight.bold,
                    //         ),
                    //       ),
                    //       onPressed: () {
                    //         nameProvider.pickImage(ImageSource.gallery);
                    //       },
                    //     ),
                    //     MaterialButton(
                    //       color: Colors.red,
                    //       child: const Text(
                    //         'Pick from Camera',
                    //         style: TextStyle(
                    //           color: Colors.white,
                    //           fontWeight: FontWeight.bold,
                    //         ),
                    //       ),
                    //       onPressed: () {
                    //         nameProvider.pickImage(ImageSource.camera);
                    //       },
                    //     ),
                    //   ],
                    // ),
                     // TextFormField(
                    //   controller: _ageController,
                    //   decoration: const InputDecoration(
                    //     border: OutlineInputBorder(),
                    //     labelText: 'Enter age',
                    //   ),
                    //   validator: (value) {
                    //     if (value == null || value.isEmpty) {
                    //       return 'Age is empty';
                    //     } else {
                    //       return null;
                    //     }
                    //   },
                    //   keyboardType: TextInputType.number,
                    // ),
                    // const SizedBox(height: 8),
                    // TextFormField(
                    //   controller: _placeController,
                    //   decoration: const InputDecoration(
                    //     border: OutlineInputBorder(),
                    //     labelText: 'Enter place',
                    //   ),
                    //   validator: (value) {
                    //     if (value == null || value.isEmpty) {
                    //       return 'Place is empty';
                    //     } else {
                    //       return null;
                    //     }
                    //   },
                    // ),
                    // const SizedBox(height: 8),
                    // TextFormField(
                    //   controller: _phoneController,
                    //   decoration: const InputDecoration(
                    //     border: OutlineInputBorder(),
                    //     labelText: 'Enter phone number',
                    //   ),
                    //   validator: (value) {
                    //     if (value == null || value.isEmpty) {
                    //       return 'Phone Number is empty';
                    //     } else {
                    //       return null;
                    //     }
                    //   },
                    //   keyboardType: TextInputType.phone,
                    // ),
                      // Container(
                    //   height: 70,
                    //   decoration: BoxDecoration(
                    //     color: Colors.purple.withOpacity(0.1),
                    //     borderRadius:
                    //         const BorderRadius.all(Radius.circular(15.0)),
                    //   ),
                    //   child: Center(
                    //     child: TextFormField(
                    //       controller: _nameController,
                    //       decoration: const InputDecoration(
                    //         filled: true,
                    //         fillColor: Colors.transparent,
                    //         prefixIcon: Icon(Icons.person_2_rounded),
                    //         border: InputBorder.none,
                    //         labelText: 'Enter name',
                    //       ),
                    //       validator: (value) {
                    //         if (value == null || value.isEmpty) {
                    //           return 'Name is empty';
                    //         } else {
                    //           return null;
                    //         }
                    //       },
                    //     ),
                    //   ),
                    // ),
                      // ElevatedButton(
                    //   //color:purple
                    //   onPressed: () {
                    //     if (_formKey.currentState!.validate()) {
                    //       final name = _nameController.text;
                    //       final age = int.tryParse(_ageController.text) ?? 0;
                    //       final place = _placeController.text;
                    //       final phoneNumber = _phoneController.text;

                    //       if (name.isNotEmpty &&
                    //           place.isNotEmpty &&
                    //           phoneNumber.isNotEmpty &&
                    //           nameProvider.selectedImagePath != null) {
                    //         nameProvider.addStudent(name, age, place,
                    //             phoneNumber, nameProvider.selectedImagePath!);
                    //         _nameController.clear();
                    //         _ageController.clear();
                    //         _placeController.clear();
                    //         _phoneController.clear();
                    //         nameProvider.clearSelectedImage();
                    //         Navigator.pop(context);
                    //       }
                    //     }
                    //   },
                    //   child: const Text('Create Entry'),
                    // ),
                              // InkWell(
                    //   onTap: () {
                    //     if (_formKey.currentState!.validate()) {
                    //       final name = _nameController.text;
                    //       final age = int.tryParse(_ageController.text) ?? 0;
                    //       final place = _placeController.text;
                    //       final phoneNumber = _phoneController.text;

                    //       if (name.isNotEmpty &&
                    //           place.isNotEmpty &&
                    //           phoneNumber.isNotEmpty &&
                    //           nameProvider.selectedImagePath != null) {
                    //         nameProvider.addStudent(name, age, place,
                    //             phoneNumber, nameProvider.selectedImagePath!);
                    //         _nameController.clear();
                    //         _ageController.clear();
                    //         _placeController.clear();
                    //         _phoneController.clear();
                    //         nameProvider.clearSelectedImage();
                    //         Navigator.pop(context);
                    //       }
                    //     }
                    //   },
                    //   child: Container(
                    //     height: 60,
                    //     width: 250,
                    //     decoration: BoxDecoration(
                    //       gradient: LinearGradient(
                    //         colors: [Colors.purple[500]!, Colors.purple[300]!],
                    //         begin: Alignment.topLeft,
                    //         end: Alignment.bottomRight,
                    //       ),
                    //       boxShadow: [
                    //         BoxShadow(
                    //           color: Colors.purple.withOpacity(0.5),
                    //           spreadRadius: 2,
                    //           blurRadius: 3,
                    //           offset: const Offset(0, 3),
                    //         ),
                    //       ],
                    //       borderRadius:
                    //           const BorderRadius.all(Radius.circular(15.0)),
                    //     ),
                    //     child: const Center(
                    //         child: Text(
                    //       "ADD STUDENT",
                    //       style: TextStyle(
                    //           color: Colors.white,
                    //           fontWeight: FontWeight.w800,
                    //           fontSize: 16),
                    //     )),
                    //   ),
                    // ),
                         // Center(
                    //   child: Stack(
                    //     alignment: Alignment.bottomRight,
                    //     children: [
                    //       CircleAvatar(
                    //         radius: 60,
                    //         backgroundColor: Colors.purple[300],
                    //         child: ClipOval(
                    //           child: nameProvider.selectedImagePath != null
                    //               ? Image.file(
                    //                   File(nameProvider.selectedImagePath!),
                    //                   fit: BoxFit.cover,
                    //                   width: 120,
                    //                   height: 120,
                    //                 )
                    //               : const Icon(
                    //                   Icons.person,
                    //                   size: 60,
                    //                   color: Colors.white,
                    //                 ),
                    //         ),
                    //       ),
                    //       InkWell(
                    //         onTap: () {
                    //           showDialog(
                    //             context: context,
                    //             builder: (context) => AlertDialog(
                    //               title: const Text("Choose image"),
                    //               actions: [
                    //                 InkWell(
                    //                   onTap: () {
                    //                     nameProvider
                    //                         .pickImage(ImageSource.gallery);
                    //                     Navigator.of(context).pop();
                    //                   },
                    //                   child: const Padding(
                    //                     padding: EdgeInsets.all(8.0),
                    //                     child: Text("Gallery"),
                    //                   ),
                    //                 ),
                    //                 InkWell(
                    //                   onTap: () {
                    //                     nameProvider
                    //                         .pickImage(ImageSource.camera);
                    //                     Navigator.of(context).pop();
                    //                   },
                    //                   child: const Padding(
                    //                     padding: EdgeInsets.all(8.0),
                    //                     child: Text("Camera"),
                    //                   ),
                    //                 ),
                    //               ],
                    //             ),
                    //           );
                    //         },
                    //         child: const CircleAvatar(
                    //           radius: 20,
                    //           backgroundColor: Colors.purpleAccent,
                    //           child: Icon(Icons.add, color: Colors.white),
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),