import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/components/rounded_button.dart';
import 'package:todoapp/screens/create_task.dart';
import 'package:firebase_auth/firebase_auth.dart';

final _firestore = FirebaseFirestore.instance;
User loggedInUser;

class TodoScreen extends StatefulWidget {
  static String id = 'todo_screen';
  @override
  _TodoScreenState createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() async {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Things TO DO'),
        backgroundColor: Colors.deepPurpleAccent,
        actions: [
          IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                _auth.signOut();
                Navigator.pop(context);
              })
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _firestore.collection('tasks').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }

          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Text('Loading...');

            default:
              return ListView(
                children: snapshot.data.docs.map((DocumentSnapshot document) {
                  return CheckboxListTile(
                      checkColor: Colors.white,
                      activeColor: Colors.deepPurple,
                      title: Text(document['name']),
                      value: document['completed'],
                      onChanged: (newValue) => _firestore
                          .collection('tasks')
                          .doc()
                          .update({'completed': newValue}));
                }).toList(),
              );
          }
        },
      ),
      floatingActionButton: RoundedButton(
        text: 'Add Task!',
        color: Colors.deepPurple,
        onPressed: () => Navigator.pushNamed(context, TodoCreate.id),
      ),
    );
  }
}
