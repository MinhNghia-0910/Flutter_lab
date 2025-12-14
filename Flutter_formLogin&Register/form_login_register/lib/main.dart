import 'package:flutter/material.dart';
import 'package:form_login_register/register.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      home: const RegistrationFormScreen(),
    );
  }
}
