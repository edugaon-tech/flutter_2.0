import 'package:flutter/material.dart';
import 'package:flutter_learn_bipul/apis/razorpay/customer/customer_api_services.dart';
import 'package:flutter_learn_bipul/apis/razorpay/models/add_customer_model.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AddCustomerScreen extends StatelessWidget {
  AddCustomerScreen({super.key});

  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add"),
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
                CustomerApiServices().addNewCustomer(data).then((c){
                  if(c){
                    Fluttertoast.showToast(msg: "Customer added");
                    Navigator.pop(context);
                  }
                });
              },

              child: Text("Add"))
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
