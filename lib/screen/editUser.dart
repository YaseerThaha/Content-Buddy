
import 'package:flutter/material.dart';

import '../model/contact.dart';
import '../service/userService.dart';
class EditUser extends StatefulWidget {
  final User user;
  const EditUser({Key? key,required this.user}) : super(key: key);

  @override
  State<EditUser> createState() => _EditUserState();
}

class _EditUserState extends State<EditUser> {
  final _userNameController = TextEditingController();
  final _userContactController = TextEditingController();
  final _userDescriptionController = TextEditingController();
  final _userEmailController = TextEditingController();

  bool _validateName = false;
  bool _validateContact = false;
  bool _validateDescription = false;
  bool  _validateEmail = false;
  final _userService=UserService();

  @override
  void initState() {
    setState(() {
      _userNameController.text=widget.user.name??'';
      _userContactController.text=widget.user.contactNumber??'';
      _userDescriptionController.text=widget.user.description??'';
      _userEmailController.text=widget.user.emailAddress??'';
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Contact"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              const SizedBox(
                height: 40.0,
              ),
              TextField(
                  controller: _userNameController,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: 'Enter Name',
                    labelText: 'Name',
                    errorText:
                    _validateName ? ' Name cannot be empty' : null,
                  )),
              const SizedBox(
                height: 20.0,
              ),
              TextField(
                  controller: _userContactController,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: 'Enter Contact Number',
                    labelText: 'Contact Number',
                    errorText: _validateContact
                        ? ' Contact Number cannot be empty' : null,
                  )),
              const SizedBox(
                height: 20.0,
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

                  )),
              const SizedBox(
                height: 20.0,
              ),
              TextField(
                  controller: _userEmailController,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: 'Enter Email Address',
                    labelText: 'Email Address',
                    errorText: _validateEmail
                        ? 'Email Address cannot be empty' : null,
                  )),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  TextButton(
                      style: TextButton.styleFrom(
                          foregroundColor: Colors.white, backgroundColor: Colors.grey,
                          padding: const EdgeInsets.symmetric(horizontal: 35),
                          textStyle: const TextStyle(fontSize: 20)),
                      onPressed: () {
                        _userNameController.text = '';
                        _userContactController.text = '';
                        _userDescriptionController.text = '';
                        _userEmailController.text = '';
                      },
                      child: const Text('Clear',)),
                  const SizedBox(
                    width: 40.0,
                  ),
                  TextButton(
                      style: TextButton.styleFrom(
                          foregroundColor: Colors.white, backgroundColor: Colors.grey,
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          textStyle: const TextStyle(fontSize: 20)),

                      onPressed: () async {
                        setState(() {
                          _userNameController.text.isEmpty
                              ? _validateName = true
                              : _validateName = false;
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
                        if (_validateName == false &&
                            _validateContact == false &&
                            _validateDescription == false &&
                            _validateEmail == false)
                        {

                          var user = User();
                          user.id=widget.user.id;
                          user.name = _userNameController.text;
                          user.contactNumber = _userContactController.text;
                          user.description = _userDescriptionController.text;
                          user.emailAddress = _userEmailController.text;

                          var result=await _userService.updateUser(user);
                          Navigator.pop(context,result);
                        }
                      },
                      child:

                      const Text('Update ')),


                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
