import 'package:flutter/cupertino.dart';
import 'package:flutter_learn_bipul/users/user_db_helper.dart';
import 'package:flutter_learn_bipul/users/user_model.dart';

class UserProvider extends UserDBHelper with ChangeNotifier {
  var _users = [
    UserModel(
        name: "Rohit",
        email: "ea@gmail.com",
        phone: "3545446464",
        gender: "Human"),
    UserModel(
        name: "Rohit",
        email: "ea@gmail.com",
        phone: "3545446464",
        gender: "Human"),
    UserModel(
        name: "Rohit",
        email: "ea@gmail.com",
        phone: "3545446464",
        gender: "Human"),
    UserModel(
        name: "Rohit",
        email: "ea@gmail.com",
        phone: "3545446464",
        gender: "Human"),
    UserModel(
        name: "Rohit",
        email: "ea@gmail.com",
        phone: "3545446464",
        gender: "Human"),
    UserModel(
        name: "Rohit",
        email: "ea@gmail.com",
        phone: "3545446464",
        gender: "Human"),
  ];

  List<UserModel> get getAllUsers =>_users;

  getUsers()async{
    var data = await getTableUsers();
    _users = data.map((e) => UserModel.fromJson(e)).toList();
    notifyListeners();
  }

  deleteUser(int index,int id)async{
    await deleteTableUser(id);
    _users.removeAt(index);
    notifyListeners();
  }

  updateUser(UserModel data,int index)async{
    await updateTableUser(data);
    _users[index] = data;
    notifyListeners();
  }

  addNewUser(UserModel data)async{
    await insertUser(data);
    _users.add(data);
    notifyListeners();
  }

}
