import 'package:flutter/material.dart';
import '../model/contact.dart';

class ViewUser extends StatefulWidget {
  final User user;

  const ViewUser({Key? key, required this.user}) : super(key: key);

  @override
  State<ViewUser> createState() => _ViewUserState();
}

class _ViewUserState extends State<ViewUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Contact Details",),
        ),
        body: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [

              const SizedBox(
                height: 50,
              ),
              Column(
                children: [
                  const Icon(Icons.person),
                  const Text('Name :',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w700)),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(widget.user.name ?? '', style: const TextStyle(fontSize: 16)),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  const Icon(Icons.call),
                  const Text('Contact Number :',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w700)),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(widget.user.contactNumber ?? '', style: const TextStyle(fontSize: 16)),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  const Icon(Icons.description),
                  const Text('Description :',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w700)),

                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(widget.user.description ?? '', style: const TextStyle(fontSize: 16)),
                  )
                ],
              ),

              const SizedBox(
                height: 20,
              ),

              Column(
                children: [
                  const Icon(Icons.email),
                  const Text('Email Address :',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w700)),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(widget.user.emailAddress ?? '', style: const TextStyle(fontSize: 16)),
                  )
                ],
              ),
            ],

          ),
        ));
  }
}