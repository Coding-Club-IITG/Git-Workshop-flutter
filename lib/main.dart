import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:todoapp/screens/create_task.dart';
import 'package:todoapp/screens/login_screen.dart';
import 'package:todoapp/screens/registration_screen.dart';
import 'package:todoapp/screens/todo_screen.dart';
import 'package:todoapp/screens/welcome_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Todo());
}

class Todo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: WelcomeScreen.id,
      routes: {
        TodoCreate.id: (context) => TodoCreate(),
        WelcomeScreen.id: (context) => WelcomeScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        TodoScreen.id: (context) => TodoScreen(),
      },
    );
  }
}
