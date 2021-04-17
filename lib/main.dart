import 'package:flutter/material.dart';
import 'package:my_flutter/page_add_data.dart';
import 'package:my_flutter/page_list_data.dart';
import 'package:my_flutter/splash.dart';
import 'package:my_flutter/home.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: SplashWidget(),
    routes: {
      "page_home": (context) => HomeWidget(),
      "page_add_data": (context) => AddDataWidget(),
      "page_list_data": (context) => ListDataWidget(),
    },
  ));
}
