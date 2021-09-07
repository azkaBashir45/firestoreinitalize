import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

//for testing ky ly seprate class create
class AddUser extends StatefulWidget {
  @override
  _AddUserState createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {
  TextEditingController textEditingController = TextEditingController();
  final firebase = FirebaseFirestore.instance;
  create() async {
    try {
      await firebase
          .collection("User")
          .doc()
          .set({"name": textEditingController.text});
    } catch (e) {
      print('something $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Azka'),
      ),
      body: Column(
        children: [
          TextField(
            controller: textEditingController,
            decoration: InputDecoration(
              hintText: 'Data1',
            ),
          ),
          TextButton(
              child: Text('azka'),
              onPressed: () {
                create();
                textEditingController.clear();
              }),
        ],
      ),
    );
  }
}
