// import 'package:hive/hive.dart';
// import 'package:prov_setup/model/name_model.dart';

// class BoxServices {
//   Future<void> addStudent(Name student) async {
//     final box = await Hive.openBox<Name>('students');
//     await box.add(student);
//   }

//   Future<List<Name>> getStudent() async {
//     final box = await Hive.openBox<Name>('students');
//     return box.values.toList();
//   }

//   Future<void> updateStudent(int index, Name student) async {
//     final box = await Hive.openBox<Name>('students');
//     await box.putAt(index, student);
//   }

//   Future<void> deleteStudent(int index) async {
//     final box = await Hive.openBox<Name>('students');
//     await box.deleteAt(index);
//   }
// }
   // Center(
            //   child: Container(
            //     height: 60,
            //     width: 350,
            //     decoration: const BoxDecoration(
            //         color: Colors.white,
            //         borderRadius: BorderRadius.all(Radius.circular(5))),
            //     child: Center(
            //       child: Text(' ${nameEntry.place}',
            //           style: const TextStyle(
            //             fontSize: 18,
            //           )),
            //     ),
            //   ),
            // ),
            // const SizedBox(height: 8),
            // Text('Phone: ${nameEntry.phoneNumber}',
            //     style: const TextStyle(fontSize: 18)),
               // IconButton(
                    //   icon: const Icon(Icons.delete),
                    //   onPressed: () {
                    //     Provider.of<NameProvider>(context, listen: false)
                    //         .deleteName(index);
                    //   },
                    // ),
