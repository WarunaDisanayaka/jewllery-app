import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jewllery_app/view/control_view.dart';
import 'package:jewllery_app/view/login_view.dart';

import 'helper/binding.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyDlkU2ZHAadZrjZkNucxaZf5wSQWhfpToE",
      appId: "1:670508785794:android:4762a356d4607a2a63949b",
      messagingSenderId: "670508785794",
      projectId: "jewlery-app",
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: Binding(),
      home: Scaffold(
      body: ControlView(),
      ),
    );
  }
}

