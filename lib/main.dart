import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:prov_setup/controller/provider_page.dart';
import 'package:provider/provider.dart';
import 'model/name_model.dart';
import 'view/name_list_screen.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(NameAdapter());
  await Hive.openBox<Name>('names');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => NameProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: NameListScreen(),
      ),
    );
  }
}
