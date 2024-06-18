import 'package:flutter/material.dart';
import 'package:paytm_allinonesdk/paytm_allinonesdk.dart';

class PaytmScreen extends StatefulWidget {
  const PaytmScreen({super.key});

  @override
  State<PaytmScreen> createState() => _PaytmScreenState();
}

class _PaytmScreenState extends State<PaytmScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(onPressed: () {
          
        }, child: Text("Paytm")),
      ),
    );
  }
  
  startPayment(){
    try{
      var response = AllInOneSdk.startTransaction(mid, orderId, amount, txnToken, callbackUrl, isStaging, restrictAppInvoke)
    }
        catch(e){
      rethrow;
        }
  }
}
