import 'package:flutter/material.dart';
import 'package:flutter_learn_bipul/apis/razorpay/models/customer_model.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../models/add_customer_model.dart';
import 'customer_api_services.dart';

class UpdateCustomerScreen extends StatelessWidget {
  final AddCustomerModel customer;
  final int index;

  UpdateCustomerScreen(
      {super.key, required this.customer, required this.index});

  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    nameController = TextEditingController(text: customer.name ?? "");
    emailController = TextEditingController(text: customer.email ?? "");
    phoneController = TextEditingController(text: customer.contact ?? "");
    return Scaffold(
      appBar: AppBar(
        title: Text("Update"),
      ),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: [
          myTextField(
            nameController,
          ),
          myTextField(
            emailController,
          ),
          myTextField(
            phoneController,
          ),
          const SizedBox(
            height: 30,
          ),
          ElevatedButton(
              onPressed: () {
                var data = AddCustomerModel(
                    name: nameController.text,
                    email: emailController.text,
                    contact: phoneController.text);
                CustomerApiServices()
                    .updateCustomer(data, customer.id.toString(), index)
                    .then((c) {
                  if (c) {
                    Fluttertoast.showToast(msg: "Customer updated");
                    Navigator.pop(context);
                  }
                });
              },
              child: Text("Update"))
        ],
      ),
    );
  }

  Widget myTextField(TextEditingController controller) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: TextFormField(
        controller: controller,
      ),
    );
  }
}
