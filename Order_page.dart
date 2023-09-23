import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app/model/cart_model.dart';
import 'package:grocery_app/screens/pdf_page.dart';
import 'package:provider/provider.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({Key? key}) : super(key: key);

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController contactNumberController = TextEditingController();
  TextEditingController houseAddressController = TextEditingController();
  TextEditingController instructionsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final cartModel = Provider.of<CartModel>(context);

    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.deepPurple,
        ),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(0.0),
            child: Text('Placing Your Order',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 40, color: Colors.deepPurple)),
          ),
          const Spacer(),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: const Color(0xffF9F4CA),
                      border: Border.all(color: Colors.white)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, top: 5),
                    child: TextField(
                      controller: fullNameController,
                      decoration: const InputDecoration(
                          icon: Icon(
                            Icons.person,
                            color: Colors.black,
                          ),
                          border: InputBorder.none,
                          hintText: "Please Enter Your Full Name"),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: const Color(0xffF9F4CA),
                      border: Border.all(color: Colors.white)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, top: 5),
                    child: TextField(
                      controller: contactNumberController,
                      decoration: const InputDecoration(
                          icon: Icon(
                            Icons.phone,
                            color: Colors.black,
                          ),
                          border: InputBorder.none,
                          hintText: "Please Enter Your Contact Number"),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: const Color(0xffF9F4CA),
                      border: Border.all(color: Colors.white)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, top: 5),
                    child: TextField(
                      controller: houseAddressController,
                      decoration: const InputDecoration(
                          icon: Icon(
                            Icons.home,
                            color: Colors.black,
                          ),
                          border: InputBorder.none,
                          hintText: "Please Enter Your Delivery Address"),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: const Color(0xffF9F4CA),
                      border: Border.all(color: Colors.white)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, top: 5),
                    child: TextField(
                      controller: instructionsController,
                      decoration: const InputDecoration(
                        icon: Icon(
                          Icons.message,
                          color: Colors.black,
                        ),
                        border: InputBorder.none,
                        hintText:
                            "Any special delivery instructions?\t(optional)",
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          const Divider(
            color: Colors.deepPurple,
          ),
          // const Spacer(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Column(
                children: [
                  Column(
                    children: [
                      Text(
                        'Total Items:\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t ${cartModel.cartItems.length}',
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                          color: Colors.deepPurple,
                          fontSize: 22,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Total Price :  \t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t \$${cartModel.calculateTotal()}',
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                          color: Colors.deepPurple,
                          fontSize: 22,
                        ),
                      ),
                      Text(
                        'Price After Discount :  \t\t\t\t\t\t\t\t\t\t\t \$${cartModel.calculateDiscount()}',
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                          color: Colors.deepPurple,
                          fontSize: 22,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () async {
                  var fullName = fullNameController.text.trim();
                  var contactNumber = contactNumberController.text.trim();
                  var houseAddress = houseAddressController.text.trim();
                  var instructions = instructionsController.text.trim();

                  if (fullName.isNotEmpty &&
                      contactNumber.isNotEmpty &&
                      houseAddress.isNotEmpty &&
                      cartModel.cartItems.isNotEmpty) {
                    final firestore = FirebaseFirestore.instance;
                    final cartItems = cartModel.cartItems.map((item) {
                      return {
                        'name': item[0],
                        'price': item[1],
                      };
                    }).toList();

                    try {
                      await firestore.collection('orders').add({
                        // 'Items': cartItems,
                        // 'Ordered at': DateTime.now(),
                        'Customer Name': fullName,
                        'Contact #': contactNumber,
                        'Delivery Address': houseAddress,
                        'Ordered at': DateTime.now(),

                        'Special Request': instructions,

                        'Items': cartItems,
                      });

                      // ignore: use_build_context_synchronously
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Order Confirmed Successfully!"),
                          duration: Duration(seconds: 2),
                        ),
                      );

                      // ignore: use_build_context_synchronously
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const PdfPage();
                      }));
                    } catch (error) {
                      print("Error Placing Order  : $error");
                    }
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Please fill in all required fields'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  }
                },
                child: Container(
                  height: 65,
                  width: 500,
                  decoration: BoxDecoration(
                    color: Colors.deepPurple,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: const Center(
                    child: Text(
                      'Confirm Order',
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
