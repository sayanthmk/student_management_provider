import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:prov_setup/controller/provider_page.dart';
import 'package:prov_setup/model/name_model.dart';
import 'package:prov_setup/widgets/addbutton.dart';
import 'package:prov_setup/widgets/customtextfield.dart';
import 'package:prov_setup/widgets/imagepickwidget.dart';
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
                //////////////
                Center(
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      CircleAvatar(
                        radius: 60,
                        backgroundColor: Colors.blue,
                        child: ClipOval(
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
                        child: const CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.red,
                          child: Icon(Icons.add, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
                // CustomProfileAvatar(
                //   backgroundColor: Colors.purple[300]!,
                //   imagePath: nameProvider.selectedImagePath,
                //   onGalleryTap: () {
                //     nameProvider.pickImage(ImageSource.gallery);
                //   },
                //   onCameraTap: () {
                //     nameProvider.pickImage(ImageSource.camera);
                //   },
                //   cirlebackgroundColor: Colors.pink,
                // ),
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
                const SizedBox(height: 8),
                Consumer<NameProvider>(
                  builder: (context, nameProvider, _) {
                    return CustomButton(
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          final name = nameController.text;
                          final age = int.tryParse(ageController.text) ?? 0;
                          final place = placeController.text;
                          final phoneNumber = phoneController.text;

                          if (name.isNotEmpty &&
                              place.isNotEmpty &&
                              phoneNumber.isNotEmpty &&
                              nameProvider.selectedImagePath != null) {
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
                        }
                      },
                      gradientColors: [
                        Colors.purple[500]!,
                        Colors.purple[300]!
                      ],
                      boxShadowColor: Colors.purple,
                      buttonText: "UPDATE STUDENT",
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
// selectedImagePath != null
            //     ? Image.file(
            //         File(selectedImagePath!),
            //         width: 200,
            //         height: 200,
            //       )
            //     : const Text('Please select an image'),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //   children: [
            //     MaterialButton(
            //         color: Colors.blue,
            //         child: const Text(
            //           'Pick from Gallery',
            //           style: TextStyle(
            //             color: Colors.white,
            //             fontWeight: FontWeight.bold,
            //           ),
            //         ),
            //         onPressed: () =>
            //             nameProvider.pickImage(ImageSource.gallery)),
            //     MaterialButton(
            //         color: Colors.red,
            //         child: const Text(
            //           'Pick from Camera',
            //           style: TextStyle(
            //             color: Colors.white,
            //             fontWeight: FontWeight.bold,
            //           ),
            //         ),
            //         onPressed: () =>
            //             nameProvider.pickImage(ImageSource.camera)),
            //   ],
            // ),
            //////////////////////////
            ///   // Center(
            //   child: Stack(
            //     alignment: Alignment.bottomRight,
            //     children: [
            //       CircleAvatar(
            //         radius: 60,
            //         backgroundColor: Colors.blue,
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
            //                     nameProvider.pickImage(ImageSource.gallery);
            //                     Navigator.of(context).pop();
            //                   },
            //                   child: const Padding(
            //                     padding: EdgeInsets.all(8.0),
            //                     child: Text("Gallery"),
            //                   ),
            //                 ),
            //                 InkWell(
            //                   onTap: () {
            //                     nameProvider.pickImage(ImageSource.camera);
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
            //           backgroundColor: Colors.red,
            //           child: Icon(Icons.add, color: Colors.white),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
                // TextField(
            //   controller: nameController,
            //   decoration: const InputDecoration(
            //     border: OutlineInputBorder(),
            //     labelText: 'Enter name',
            //   ),
            // ),
            // const SizedBox(height: 8),
            // TextField(
            //   controller: ageController,
            //   decoration: const InputDecoration(
            //     border: OutlineInputBorder(),
            //     labelText: 'Enter age',
            //   ),
            //   keyboardType: TextInputType.number,
            // ),
            // const SizedBox(height: 8),
            // TextField(
            //   controller: placeController,
            //   decoration: const InputDecoration(
            //     border: OutlineInputBorder(),
            //     labelText: 'Enter place',
            //   ),
            // ),
            // const SizedBox(height: 8),
            // TextField(
            //   controller: phoneController,
            //   decoration: const InputDecoration(
            //     border: OutlineInputBorder(),
            //     labelText: 'Enter phone number',
            //   ),
            //   keyboardType: TextInputType.phone,
            // ),
                //////////////
                    // return ElevatedButton(
                    //   onPressed: () {
                    //     final name = nameController.text;
                    //     final age = int.tryParse(ageController.text) ?? 0;
                    //     final place = placeController.text;
                    //     final phoneNumber = phoneController.text;

                    //     if (name.isNotEmpty &&
                    //         place.isNotEmpty &&
                    //         phoneNumber.isNotEmpty &&
                    //         selectedImagePath != null) {
                    //       nameProvider.updateStudent(
                    //         index,
                    //         name,
                    //         age,
                    //         place,
                    //         phoneNumber,
                    //         selectedImagePath,
                    //       );
                    //       Navigator.pop(context);
                    //     }
                    //   },
                    //   child: const Text('Update Entry'),
                    // );