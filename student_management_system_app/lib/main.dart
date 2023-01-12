import 'package:flutter/material.dart';
import 'package:student_management_system_app/ui/login/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(
        useMaterial3: true,
        // primarySwatch: Colors.blue,
      ),
      home: const LoginPage(),
    );
  }
}
