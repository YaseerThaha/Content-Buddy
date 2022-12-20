
import 'package:flutter/material.dart';

import '../model/contact.dart';
import '../service/userService.dart';
class SearchUser extends StatefulWidget {
  final User user;
  const SearchUser({Key? key,required this.user}) : super(key: key);

  @override
  State<SearchUser> createState() => _SearchUserState();
}

class _SearchUserState extends State<SearchUser> {
  


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Contact"),
      ),
      body: SingleChildScrollView(
        child: Container(
        ),
      ),
    );
  }
}
