// import 'package:flutter/material.dart';
// import 'package:paystack/payment/paystack_payment.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter PayStack',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const MyHomePage(title: 'Flutter Paystack Payment'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   //creating variables  //variable to hold the price selected from the GridView
//   int? selectedIndex;

//   //User Email to be sent to paystack (Dummy)
//   String? email = "clementpeter2000@gmail.com";

//   //variable to hold the price selected price from the GridView
//   int? price = 0;

//   //Map containing list of shop items in our app
//   final List<Map<String, Object>> shopItems = [
//     {'price': 1000, "item": "Milo"},
//     {'price': 2000, "item": "Milk"},
//     {'price': 3000, "item": "Parfait"},
//     {'price': 4000, "item": "Kellogs"},
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//         centerTitle: true,
//       ),
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(vertical: 10.0),
//           child: Column(
//             children: <Widget>[
//               const SizedBox(height: 50),
//               const Center(
//                 child: Text(
//                   'Purchase available items',
//                   style: TextStyle(
//                     fontSize: 30,
//                     fontWeight: FontWeight.bold,
//                     //letterSpacing: 5,
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 30),
//               Expanded(
//                 child: Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 10.0),
//                   child: GridView(
//                       gridDelegate:
//                           const SliverGridDelegateWithFixedCrossAxisCount(
//                         crossAxisCount: 2,
//                         mainAxisSpacing: 10,
//                         crossAxisSpacing: 5,
//                       ),
//                       children: List.generate(
//                         shopItems.length,
//                         (index) {
//                           final data = shopItems[index];
//                           return GestureDetector(
//                             onTap: () {
//                               setState(
//                                 () {
//                                   selectedIndex =
//                                       index; //identify the grid selected to get the item and price
//                                   price = data["price"] as int;
//                                   //print("Grid view Selected price::::::::::::::::$price");
//                                 },
//                               );
//                             },
//                             child: Card(
//                               elevation: 5,
//                               shadowColor: Colors.green,
//                               child: Container(
//                                 color: selectedIndex == null
//                                     ? null
//                                     : selectedIndex == index
//                                         ? const Color.fromARGB(182, 76, 175, 79)
//                                         : null,
//                                 child: Column(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     Text(
//                                       'Price: N${data['price']}',
//                                       style: const TextStyle(
//                                         fontSize: 20,
//                                         fontWeight: FontWeight.bold,
//                                       ),
//                                     ),
//                                     Text(
//                                       'Items: ${data['item']}',
//                                       style: const TextStyle(
//                                         fontSize: 20,
//                                         fontWeight: FontWeight.bold,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           );
//                         },
//                       )),
//                 ),
//               ),
//               //Make payment Button
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 30.0),
//                 child: GestureDetector(
//                   onTap: () {
//                     //Trigger paystack payment, if an item is selected
//                     if (selectedIndex == null) {
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         const SnackBar(
//                           content: Text("Please select an item"),
//                         ),
//                       );
//                     } else {
//                       //make payment via paystack
//                       print(
//                           "Grid view Selected price:::::::::::::::::::$price");
//                       MakePayment(ctx: context, price: price, email: email)
//                           .chargeCardAndMakePayment();
//                     }
//                   },
//                   //make payment button
//                   child: Container(
//                     decoration: BoxDecoration(
//                       color: Colors.green,
//                       borderRadius: BorderRadius.circular(5),
//                     ),
//                     height: 50,
//                     width: MediaQuery.of(context).size.width,
//                     alignment: Alignment.center,
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: const [
//                         Icon(
//                           Icons.security,
//                           color: Colors.white,
//                         ),
//                         SizedBox(width: 10),
//                         Text(
//                           "Make Payment",
//                           style: TextStyle(color: Colors.white),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 50)
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
