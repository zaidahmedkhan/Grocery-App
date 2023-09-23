import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app/services/signUpServices.dart';
import 'Login_page.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController userPhoneController = TextEditingController();
  TextEditingController userEmailController = TextEditingController();
  TextEditingController userPasswardController = TextEditingController();

  User? currentUser = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xffFFFFFF),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              const Icon(
                Icons.account_box,
                color: Colors.deepPurple,
                size: 280,
              ),
              const Spacer(),
              const Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 50),
                  child: Text(
                    'Sign Up to Create Your  Account!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Colors.deepPurple),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xffF9F4CA),
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: TextField(
                      controller: userNameController,
                      decoration: const InputDecoration(
                          icon: Icon(
                            Icons.person,
                            color: Colors.black,
                          ),
                          border: InputBorder.none,
                          hintText: 'UserName'),
                    ),
                  ),
                ),
              ),
              const Spacer(),
              // const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xffF9F4CA),
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: TextField(
                      controller: userPhoneController,
                      obscureText: false,
                      decoration: const InputDecoration(
                          icon: Icon(
                            Icons.phone,
                            color: Colors.black,
                          ),
                          border: InputBorder.none,
                          hintText: 'Phone'),
                    ),
                  ),
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xffF9F4CA),
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: TextField(
                      controller: userEmailController,
                      decoration: const InputDecoration(
                          icon: Icon(
                            Icons.email,
                            color: Colors.black,
                          ),
                          border: InputBorder.none,
                          hintText: 'Email'),
                    ),
                  ),
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xffF9F4CA),
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: TextField(
                      obscureText: true,
                      controller: userPasswardController,
                      decoration: const InputDecoration(
                          icon: Icon(
                            Icons.password,
                            color: Colors.black,
                          ),
                          border: InputBorder.none,
                          hintText: 'Passward'),
                    ),
                  ),
                ),
              ),
              const Spacer(),
              const SizedBox(
                height: 10,
              ),
              const Spacer(),
              InkWell(
                onTap: () async {
                  var userName = userNameController.text.trim();
                  var userPhone = userPhoneController.text.trim();
                  var userEmail = userEmailController.text.trim();
                  var userPassward = userPasswardController.text.trim();

                  await FirebaseAuth.instance
                      .createUserWithEmailAndPassword(
                          email: userEmail, password: userPassward)
                      .then((value) => {
                            print("user created"),
                            signUpUser(
                              context,
                              userName,
                              userPhone,
                              userEmail,
                              userPassward,
                            ),
                          });
                },
                child: Container(
                  height: 80,
                  width: 350,
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(48),
                      color: Colors.deepPurple),
                  child: const Center(
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
              const Spacer(),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const LoginPage();
                          },
                        ),
                      );
                    },
                    child: const Text(
                      'Already have an account?',
                      style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              const Spacer()
            ],
          ),
        ),
      ),
    );
  }
}
