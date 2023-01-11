// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:flutter_paystack/flutter_paystack.dart';
// import 'package:paystack/constant/key.dart';

// class MakePayment {
//   MakePayment({this.ctx, this.price, this.email});

//   //variables to be passed to pauystack plugin
//   BuildContext? ctx;
//   int? price;
//   String? email;

//   //1-Initialize paystack plugin
//   PaystackPlugin paystackPlugin = PaystackPlugin();

//   //2- private method to initialize plugin with the public key
//   Future _initialisePlugin() async {
//     await paystackPlugin.initialize(publicKey: ConstantKey.PAYSTACK_KEY);
//   }

//   //4-Private method to get reference for paystack
//   String _getReference() {
//     String platform;
//     if (Platform.isIOS) {
//       platform = "IOS";
//     } else {
//       platform = "Android";
//     }
//     return "Payment made from $platform ${DateTime.now().millisecondsSinceEpoch}";
//   }

//   //5- Get Prebuilt UI for card payment
//   PaymentCard _getCardUI() {
//     return PaymentCard(number: "", cvc: "", expiryMonth: 0, expiryYear: 0);
//   }

//   //3-method of paying by card - using "Check Out Method"
//   chargeCardAndMakePayment() {
//     _initialisePlugin().then((_) async {
//       Charge charge = Charge()
//         ..amount =
//             price! * 100 //rounding the price to a whole naira and removing kobo
//         ..email = email!
//         ..reference = _getReference()
//         //..accessCode ="Zenith bank" //used for "CheckOutMethod.selectable" check out to show bank names
//         ..putCustomField("Charged from", "Velobox")
//         ..card = _getCardUI();

//       final response = await paystackPlugin.checkout(
//         ctx!,
//         charge: charge,
//         method: CheckoutMethod.card, //Comment if your'e using access code
//         logo: const FlutterLogo(),
//       );
//       print("RESPONSE:::::::::::::::::::::::::::::$response");

//       //LAST- Function to perform if the trasaction is a succes or failure
//       if (response.status == true) {
//         ScaffoldMessenger.of(ctx!).showSnackBar(
//           const SnackBar(
//             backgroundColor: Colors.green,
//             duration: Duration(seconds: 3),
//             content: Text("Transaction Successful"),
//           ),
//         );
//       } else {
//         ScaffoldMessenger.of(ctx!).showSnackBar(
//           const SnackBar(
//             backgroundColor: Colors.red,
//             duration: Duration(seconds: 3),
//             content: Text("Transaction Cancelled"),
//           ),
//         );
//       }
//     });
//   }
// }
