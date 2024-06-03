import 'dart:convert';

import 'package:flutter_learn_bipul/apis/users_model.dart';
import 'package:flutter_learn_bipul/users/user_model.dart';
import 'package:http/http.dart' as http;

class ReqresApiServices {
  Future<List<UserData>?> getUsers() async {
    http.Response response =
        await http.get(Uri.parse("https://reqres.in/api/users"));
    if (response.statusCode == 200) {
      print(response.body);
      var responseData = jsonDecode(response.body);
      var data = UsersModel.fromJson(responseData);
      return data.data;
    } else {
      return List<UserData>.empty();
    }
  }

  Future<bool> addNewUser(String name, String job) async {
    var url = Uri.parse("https://reqres.in/api/users");
    var response = await http.post(url, body: {"name": name, "job": job});

    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }

  Future<Map<String, dynamic>> updateUser(String name,String job,String id) async {
    var url = Uri.parse("https://reqres.in/api/users/$id");
    var response = await http.put(url,
      body: {
      "name":name,
        "job":job
      }
    );
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return {"status": true, "name": data['name']};
    } else {
      return {"status": false};
    }
  }
}
