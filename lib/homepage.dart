import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutterdemo/services/auth.dart';
import 'package:flutterdemo/services/database.dart';
import 'package:flutterdemo/user_list.dart';
import 'package:provider/provider.dart';

import 'models/usercollection.dart';

class HomePage extends StatelessWidget {

  final AuthServices _auth = AuthServices();
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<UserCollection>>.value(
        value: DatabaseSrvices().usercollection,
        child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
          title: Text("Home"),
          actions: [
            TextButton(
              onPressed: () async{
                await _auth.signOut();
              }, 
              child: Text("Logout")
            )
          ],
        ),
        body: UserList(),
      ),
    );
  }
}
