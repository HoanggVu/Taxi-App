
import 'package:doantaxi/src/app.dart';
import 'package:doantaxi/src/check/check_info.dart';
import 'package:doantaxi/src/resources/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp(new CheckInfo(), MaterialApp(
    home: LoginPage(),
  )));
}
