import 'package:hive/hive.dart';
part 'name_model.g.dart';

@HiveType(typeId: 0)
class Name extends HiveObject {
  @HiveField(0)
  String name;

  @HiveField(1)
  int age;

  @HiveField(2)
  String place;

  @HiveField(3)
  String phoneNumber;

  @HiveField(4)
  String imageUrl;

  Name(
      {required this.name,
      required this.age,
      required this.place,
      required this.phoneNumber,
      required this.imageUrl});
}
