import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app/screens/Login_page.dart';

void signUpUser(
  BuildContext context,
  String userName,
  String userPhone,
  String userEmail,
  String userPassword,
) async {
  User? userId = FirebaseAuth.instance.currentUser;

  try {
    await FirebaseFirestore.instance.collection("users").doc(userId!.uid).set({
      'userName': userName,
      'userPhone': userPhone,
      'userEmail': userEmail,
      'createdAt': DateTime.now(),
      'userId': userId.uid,
    });

    FirebaseAuth.instance.signOut();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return const LoginPage();
        },
      ),
    );
  } on FirebaseAuthException catch (e) {
    print("error $e");
  }
}
