import 'package:flutter/material.dart';
import 'package:flutter_learn_bipul/users/user_model.dart';
import 'package:flutter_learn_bipul/users/user_provider.dart';
import 'package:provider/provider.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<UserProvider>(context, listen: false).getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Provider.of<UserProvider>(context, listen: false).addNewUser(
              UserModel(
                  name: "Bipula",
                  gender: "Custom",
                  phone: "3872632868",
                  email: "dfkdsgfsgd"));
        },
        child: Icon(Icons.add),
      ),
      body: Consumer<UserProvider>(
        builder: (BuildContext context, userData, Widget? child) {
          return ListView.builder(
              itemCount: userData.getAllUsers.length,
              itemBuilder: (_, index) {
                return itemView(userData.getAllUsers[index], index, context);
              });
        },
      ),
    );
  }

  Widget itemView(UserModel data, int index, BuildContext context) {
    return ListTile(
      trailing: SizedBox(
        height: 60,
        width: 100,
        child: Row(
          children: [
            IconButton(
                onPressed: () {
                  Provider.of<UserProvider>(context, listen: false).updateUser(
                      UserModel(
                          id: data.id,
                          name: "Rohit ray dsajkgdasdj",
                          gender: "Female"),
                      index);
                },
                icon: Icon(Icons.edit)),
            IconButton(
                onPressed: () {
                  Provider.of<UserProvider>(context, listen: false)
                      .deleteUser(index, data.id ?? 0);
                },
                icon: Icon(Icons.delete)),
          ],
        ),
      ),
      title: Text(data.name.toString()),
      subtitle: Text("${data.email}/ ${data.phone} / ${data.gender}"),
    );
  }
}
