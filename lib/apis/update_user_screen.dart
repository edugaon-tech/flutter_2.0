import 'package:flutter/material.dart';
import 'package:flutter_learn_bipul/apis/reqres_api_services.dart';
import 'package:flutter_learn_bipul/apis/users_model.dart';
import 'package:fluttertoast/fluttertoast.dart';

class UpdateUserScreen extends StatefulWidget {
  final String id;
  final UserData data;
   UpdateUserScreen({super.key, required this.id, required this.data});

  @override
  State<UpdateUserScreen> createState() => _UpdateUserScreenState();
}

class _UpdateUserScreenState extends State<UpdateUserScreen> {
  var nameController = TextEditingController();
  var jobController = TextEditingController();

  @override
  void initState() {
    nameController = TextEditingController(text: widget.data.firstName.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Update User"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
              controller: nameController,
            ),
            TextFormField(
              controller: jobController,
            ),
            SizedBox(height: 30,),
            ElevatedButton(
                onPressed: () async {
                  var isCreated = await ReqresApiServices()
                      .updateUser(nameController.text, jobController.text,widget.id);
                  if (isCreated["status"] == true) {
                    Fluttertoast.showToast(
                        msg: "Updated Name is ${isCreated['name']}");
                  } else {
                    Fluttertoast.showToast(msg: "User not created successfully");
                  }
                },
                child: Text("Update User")),
          ],
        ),
      ),
    );
  }
}
