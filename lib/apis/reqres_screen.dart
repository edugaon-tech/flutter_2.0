import 'package:flutter/material.dart';
import 'package:flutter_learn_bipul/apis/reqres_api_services.dart';
import 'package:flutter_learn_bipul/apis/update_user_screen.dart';
import 'package:flutter_learn_bipul/apis/users_model.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ReqresScreen extends StatelessWidget {
  ReqresScreen({super.key});

  var nameController = TextEditingController();
  var jobController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Users"),
        ),
        body: Column(
          children: [
            TextFormField(
              controller: nameController,
            ),
            TextFormField(
              controller: jobController,
            ),
            ElevatedButton(
                onPressed: () async {
                  var isCreated = await ReqresApiServices()
                      .addNewUser(nameController.text, jobController.text);
                  if (isCreated) {
                    Fluttertoast.showToast(msg: "User created successfully");
                  } else {
                    Fluttertoast.showToast(
                        msg: "User not created successfully");
                  }
                },
                child: Text("Add User")),
            Expanded(
              child: FutureBuilder(
                  future: ReqresApiServices().getUsers(),
                  builder: (_, snap) {
                    var data = snap.data ?? List<UserData>.empty();
                    return ListView.builder(
                        itemCount: data.length,
                        itemBuilder: (_, index) {
                          return InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (_)=>UpdateUserScreen(id: data[index].id.toString(),data: data[index],)));
                            },
                            child: Card(
                              child: Row(
                                children: [
                                  SizedBox(
                                    child: ClipRRect(
                                      child: Image.network(
                                        data[index].avatar ?? "",
                                        height: 150,
                                        width: 150,
                                      ),
                                      borderRadius: BorderRadius.circular(75),
                                    ),
                                  ),
                                  Expanded(
                                      child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(data[index].firstName.toString()),
                                        Text(data[index].lastName.toString()),
                                        Text(data[index].email.toString()),
                                      ],
                                    ),
                                  ))
                                ],
                              ),
                            ),
                          );
                        });
                  }),
            )
          ],
        ));
  }
}
