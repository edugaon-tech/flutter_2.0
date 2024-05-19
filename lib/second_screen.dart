import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class ShowData extends StatefulWidget {
  @override
  State<ShowData> createState() => _ShowDataState();
}

class _ShowDataState extends State<ShowData> {
  var amountController = TextEditingController();
  var currencyController = TextEditingController();
  var receiptController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("USER SCREEN")),
      body: Column(
        children: [
          TextField(controller: amountController),
          TextField(
            controller: currencyController,
          ),
          TextField(
            controller: receiptController,
          ),
          CupertinoButton(
              color: Colors.grey,
              child: Text("Get Data"),
              onPressed: () {
                postData();
                // Navigator.pop(context);
              })
        ],
      ),
    );
  }

  Future postData() async {
    var headers = 'Basic ${base64Encode(utf8.encode(
            '${'rzp_test_fDHQt7hg7IlYBv'}:${'SzSUd2fe3n5NO8KragWwfKsc'}'))}';

    final response = await http.post(
      Uri.parse('https://api.razorpay.com/v1/orders'),
      headers: <String, String>{
        'Authorization': headers,
      },
      body:{
        "amount": amountController.text,
        "currency": "INR",
        "receipt": receiptController.text
      }
    );
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      // var post = PostUserModel.fromJson(data);
      // return post;
    } else {
      // return PostUserModel();
    }
  }
}