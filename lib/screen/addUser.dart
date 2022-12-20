import 'package:content_buddy/model/contact.dart';
import 'package:content_buddy/service/userService.dart';
import 'package:flutter/material.dart';

class AddUser extends StatefulWidget {
  const AddUser({Key? key}) : super(key: key);

  @override
  State<AddUser> createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {
  final _userNameController = TextEditingController();
  final _userContactController = TextEditingController();
  final _userDescriptionController = TextEditingController();
  final _userEmailController = TextEditingController();

  bool _validateUserName = false;
  bool _validateContact = false;
  bool _validateDescription = false;
  bool _validateEmail = false;

  var userService = UserService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Contact')),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              const SizedBox(
                height: (40.0),
              ),
              TextField(

                controller: _userNameController,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: 'Enter Name',
                  labelText: 'Name',
                  errorText:
                      _validateUserName ? 'User Name cannot be empty' : null,
                ),
              ),
              const SizedBox(
                height: (20.0),
              ),
              TextField(
                controller: _userContactController,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: 'Enter Contact Number',
                  labelText: 'Contact Number',
                  errorText: _validateContact
                      ? 'Contact Number cannot be empty'
                      : null,
                ),
              ),
              const SizedBox(
                height: (20.0),
              ),
              TextField(
                controller: _userDescriptionController,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: 'Enter Description',
                  labelText: 'Description',
                  errorText: _validateDescription
                      ? 'Description cannot be empty'
                      : null,
                ),
              ),
              const SizedBox(
                height: (20.0),
              ),
              TextField(
                controller: _userEmailController,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: 'Enter Email Address',
                  labelText: 'Email Address',
                  errorText:
                      _validateEmail ? 'Email Name cannot be empty' : null,
                ),
              ),
              const SizedBox(
                height: (40.0),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      style: TextButton.styleFrom(
                          foregroundColor: Colors.white,
                          textStyle: const TextStyle(fontSize: 20),
                          padding: const EdgeInsets.symmetric(horizontal: 50),
                          backgroundColor: Colors.grey),
                      onPressed: () {
                        _userNameController.text = '';
                        _userContactController.text = '';
                        _userDescriptionController.text = '';
                        _userEmailController.text = '';
                      },
                      child: const Text('Clear')),
                  const SizedBox(
                    width: (40.0),
                  ),
                  TextButton(
                      style: TextButton.styleFrom(
                          foregroundColor: Colors.white,
                          textStyle: const TextStyle(fontSize: 20),
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          backgroundColor: Colors.grey),
                      onPressed: () async {
                        setState(() {
                          _userNameController.text.isEmpty
                              ? _validateUserName = true
                              : _validateUserName = false;
                          _userContactController.text.isEmpty
                              ? _validateContact = true
                              : _validateContact = false;
                          _userDescriptionController.text.isEmpty
                              ? _validateDescription = true
                              : _validateDescription = false;
                          _userEmailController.text.isEmpty
                              ? _validateEmail = true
                              : _validateEmail = false;
                        });

                        if (_validateUserName == false &&
                            _validateContact == false &&
                            _validateDescription == false &&
                            _validateEmail == false) {
                          var user = User();
                          user.name = _userNameController.text;
                          user.contactNumber = _userContactController.text;
                          user.description = _userDescriptionController.text;
                          user.emailAddress = _userEmailController.text;

                          var result = await userService.saveUser(user);
                          Navigator.pop(context, result);
                        }
                      },
                      child: const Text('Add Contact')),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
