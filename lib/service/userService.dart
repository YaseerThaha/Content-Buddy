import 'dart:async';

import 'package:content_buddy/db/repository.dart';
import 'package:content_buddy/model/contact.dart';




class UserService {

  late Repository repository;

  UserService() {
    repository = Repository();
  }

  //Save User
  saveUser(User user) async {
    return await repository.insertData('users', user.userMap());
  }

  //Read All Users
  readAllUsers() async {
    return await repository.readData('users');
  }

  //Edit User
  updateUser(User user) async {
    return await repository.update('users', user.userMap());
  }

  deleteUser(userId)  async{
    return await repository.deleteDataById('users',userId);
  }


}




