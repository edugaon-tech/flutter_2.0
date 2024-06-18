import 'package:flutter/material.dart';
import 'package:flutter_learn_bipul/apis/razorpay/customer/add_customer_screen.dart';
import 'package:flutter_learn_bipul/apis/razorpay/customer/customer_api_services.dart';
import 'package:flutter_learn_bipul/apis/razorpay/customer/update_customer_screen.dart';
import 'package:provider/provider.dart';

class CustomersScreen extends StatefulWidget {
  const CustomersScreen({super.key});

  @override
  State<CustomersScreen> createState() => _CustomersScreenState();
}

class _CustomersScreenState extends State<CustomersScreen> {

  @override
  void initState() {
    Provider.of<CustomerApiServices>(context,listen: false).getCustomers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => AddCustomerScreen()));
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text("Customers"),
      ),
      body: Consumer<CustomerApiServices>(
        builder: (BuildContext context, value, Widget? child) {
          var customer = value.customers;
          return ListView.builder(
              itemCount: customer.length,
              itemBuilder: (_, index) {
                return Card(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Name: ${customer[index].name}",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            Text(
                              "Email: ${customer[index].email}",
                              style: TextStyle(
                                  fontWeight: FontWeight.normal, fontSize: 12),
                            ),
                            Text(
                              "Phone: ${customer[index].contact}",
                              style: TextStyle(
                                  fontWeight: FontWeight.normal, fontSize: 14),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            IconButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => UpdateCustomerScreen(
                                                customer: customer[index],
                                                index: index,
                                              )));
                                },
                                icon: Icon(Icons.edit)),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              });
        },
      ),
    );
  }
}
