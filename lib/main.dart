import 'package:content_buddy/Screen/addUser.dart';
import 'package:content_buddy/Screen/editUser.dart';
import 'package:content_buddy/model/contact.dart';
import 'package:content_buddy/service/userService.dart';
import 'package:flutter/material.dart';

import 'Screen/viewUser.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late List<User> userList = <User>[];
  final userService = UserService();

  getUserDetails() async {
    var users = await userService.readAllUsers();
    userList = <User>[];

    users.forEach((user) {
      setState(() {
        var userDetails = User();
        userDetails.id = user['id'];
        userDetails.name = user['name'];
        userDetails.contactNumber = user['contactNumber'];
        userDetails.description = user['description'];
        userDetails.emailAddress = user['emailAddress'];

        userList.add(userDetails);
      });
    });
  }

  @override
  void initState() {
    getUserDetails();
    super.initState();
  }

  addSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  deleteForm(BuildContext context, userId) {
    return showDialog(
        context: context,
        builder: (param) {
          return  AlertDialog(
            title: const Text('Are you Sure to delete'),
            actions: [

              TextButton(
                  style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.grey),

                  onPressed: () async {
                    var result = await userService.deleteUser(userId);
                    if (result != null) {
                      Navigator.pop(context);
                      getUserDetails();
                      addSnackBar('Deleted');
                    }

                  }, child: const Text('Delete')),
              TextButton(
                  style: TextButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.grey),

                  onPressed: () {
                    Navigator.pop(context);
                  }, child: const Text('Close')),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Content Buddy'),
      ),
      body:
      ListView.builder(
          itemCount: userList.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ViewUser(
                            user: userList[index],
                          )));
                },
                leading: const Icon(Icons.person),
                title: Text(userList[index].name ?? ''),
                subtitle: Text(userList[index].contactNumber ?? ''),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => EditUser(
                                    user: userList[index],
                                  ))).then((value) {
                            if (value != null) {
                              getUserDetails();
                              addSnackBar('Updated');
                            }
                          });
                        },
                        icon: const Icon(
                          Icons.edit,
                          color: Colors.grey,
                        )),
                    IconButton(
                        onPressed: () {
                          deleteForm(context, userList[index].id);
                        },
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.grey,
                        ))
                  ],
                ),
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AddUser()))
              .then((value) {
            if (value != null) {
              getUserDetails();
              addSnackBar('Saved');
            }
          });
        },
        child: const Icon(Icons.add),
      ),

    );
  }
}
