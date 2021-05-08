import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/usercollection.dart';

class UserList extends StatefulWidget {
  @override
  _UserListState createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  @override
  Widget build(BuildContext context) {

    final userCollections = Provider.of<List<UserCollection>>(context);
    userCollections.forEach((usercollection) { 
      print(usercollection.name);
      print(usercollection.sugars);
      print(usercollection.strength);
    });
    return Container(
      
    );
  }
}