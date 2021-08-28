import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/components/rounded_button.dart';
import 'package:todoapp/constants.dart';

final _firestore = FirebaseFirestore.instance;

class TodoCreate extends StatefulWidget {
  static String id = "todo_create";
  @override
  _TodoCreateState createState() => _TodoCreateState();
}

class _TodoCreateState extends State<TodoCreate> {
  final collection = _firestore.collection('tasks');
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.deepPurpleAccent,
          title: Text('Create a Task')),
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: TextField(
            autofocus: true,
            controller: controller,
            decoration: kTextFieldDecoration.copyWith(
                labelText: 'What do you want TODO?', hintText: ""),
          ),
        ),
      ),
      floatingActionButton: RoundedButton(
        text: 'Add task!',
        color: Colors.deepPurple,
        onPressed: () async {
          //Creating a new task
          await collection.add({'name': controller.text, 'completed': false});
          Navigator.pop(context);
        },
      ),
    );
  }
}
