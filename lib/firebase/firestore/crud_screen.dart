import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CrudScreen extends StatefulWidget {
  const CrudScreen({super.key});

  @override
  State<CrudScreen> createState() => _CrudScreenState();
}

class _CrudScreenState extends State<CrudScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(onPressed: (){
          setData();
        }, child: Text("Set Data")),
      ),
    );
  }

  setData()async{
    //1. create instance of firestore
    var firestore = FirebaseFirestore.instance;
    //2. identify your collection
    var collection = firestore.collection("users");
    // await collection.doc().add({"name":"Rahit"});
    await collection.add({"name":"Sanjaya","Status":"married"}).then((value){
      value.id;
      collection.doc(value.id).update({"docId":value.id});
    });
  }
}
