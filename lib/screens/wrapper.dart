import 'package:flutter/material.dart';
import 'package:flutterdemo/homepage.dart';
import 'package:flutterdemo/models/user.dart';
import 'package:flutterdemo/screens/authentication/authentication.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);
    print(user);

    if (user == null){
      return Authenticate();
    }else{
      return HomePage();
    }
  }
}