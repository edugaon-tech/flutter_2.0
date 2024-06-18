import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_learn_bipul/apis/razorpay/models/add_customer_model.dart';
import 'package:flutter_learn_bipul/apis/razorpay/models/customer_model.dart';
import 'package:http/http.dart' as http;

class CustomerApiServices extends ChangeNotifier{

  var customers = [];

  var _BASE_URL = "https://api.razorpay.com/v1/";
  var _key = "rzp_test_fDHQt7hg7IlYBv";
  var _secretKey = "SzSUd2fe3n5NO8KragWwfKsc";
  var _customerEndPoint = "customers";

 Map<String,String> _headers()=> {
   "Authorization": 'Basic ' + base64Encode(utf8.encode('$_key:$_secretKey'))
 };

  addNewCustomer(AddCustomerModel data) async {
    var url = Uri.parse(_BASE_URL + _customerEndPoint);
    var response = await http.post(url, headers: _headers(), body: data.toJson());
    if(response.statusCode == 200){
      customers.add(data);
      notifyListeners();

    }
  }

  updateCustomer(AddCustomerModel data,String id,int index) async {
    var url = Uri.parse(_BASE_URL + _customerEndPoint+"/$id");
    var response = await http.put(url, headers: _headers(), body: data.toJson());
    if(response.statusCode == 200){
      customers[index] = data;
      notifyListeners();
    }
  }

getCustomers()async{
    var url = Uri.parse(_BASE_URL + _customerEndPoint);
    var response = await http.get(url, headers: _headers());
    if(response.statusCode == 200){
      var resData = jsonDecode(response.body);
      var data = CustomersModel.fromJson(resData);
      var items =  data.items??List<ItemModel>.empty();
      items.forEach((customer){
        var c = AddCustomerModel(name: customer.name,contact: customer.contact,email: customer.email,id: customer.id);
        customers.add(c);
        notifyListeners();
      });
    }else{
      return List<ItemModel>.empty();
    }
  }
}
