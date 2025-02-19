import 'dart:io';
import 'package:flutter/material.dart';
import 'package:prov_setup/view/editscreen.dart';
import 'package:prov_setup/controller/provider_page.dart';
import 'package:provider/provider.dart';
import 'addscreen.dart';
import 'profile_screen.dart';

class NameListScreen extends StatelessWidget {
  final TextEditingController _searchController = TextEditingController();

  NameListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 63, 46, 94),
        title: const Center(
            child: Text(
          'STUDENTS LIST',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w600, color: Colors.white),
        )),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(50.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search',
                hintStyle: const TextStyle(color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                focusColor: Colors.white,
                fillColor: const Color.fromARGB(24, 0, 0, 0),
                prefixIcon: const Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
              ),
              onChanged: (value) {
                (context as Element).markNeedsBuild();
              },
            ),
          ),
        ),
      ),
      body: Consumer<NameProvider>(
        builder: (context, nameProvider, child) {
          final names = nameProvider.searchNames(_searchController.text);
          return ListView.builder(
            itemCount: names.length,
            itemBuilder: (context, index) {
              final nameEntry = names[index];
              return Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Card(
                  color: const Color.fromARGB(255, 108, 82, 146),
                  child: ListTile(
                    leading: nameEntry.imageUrl.isNotEmpty
                        ? CircleAvatar(
                            radius: 30,
                            child: ClipOval(
                              child: Image.file(File(nameEntry.imageUrl),
                                  width: 60, height: 60, fit: BoxFit.cover),
                            ),
                          )
                        : null,
                    title: Text(
                      nameEntry.name,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
                    ),
                    subtitle: Text(
                      nameEntry.place,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w600),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ProfileScreen(nameEntry: nameEntry),
                        ),
                      );
                    },
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EditScreen(
                                  nameEntry: nameEntry,
                                  index: index,
                                ),
                              ),
                            );
                          },
                        ),
                        IconButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  backgroundColor: Colors.white,
                                  title: const Text(
                                    "Delete",
                                    style: TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                  content: const SingleChildScrollView(
                                    child: ListBody(
                                      children: [
                                        Text(
                                            "Are you sure you want to delete "),
                                        SizedBox(
                                          height: 10,
                                        ),
                                      ],
                                    ),
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text(
                                        "Cancel",
                                        style: TextStyle(
                                          color: Colors.blueGrey,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Provider.of<NameProvider>(context,
                                                listen: false)
                                            .deleteName(index);
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text(
                                        "DELETE",
                                        style: TextStyle(
                                          color: Colors.red,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          icon: const Icon(Icons.delete),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddScreen()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
