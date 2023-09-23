import 'package:flutter/material.dart';
import 'home_page.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xffFFFFFF),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 350,
              width: double.infinity,
              child: Image.network(
                'https://img.freepik.com/free-vector/isometric-delivery-food-composition-with-image-smartphone-with-trolley-cart-collecting-grocery-products_1284-63377.jpg?size=626&ext=jpg&uid=R116340209&ga=GA1.2.779571134.1694595573&semt=ais',
                fit: BoxFit.contain,
              ),
            ),
            const Spacer(),
            const Padding(
              padding: EdgeInsets.all(15.0),
              child: Text(
                'Discover the Future of Grocery Shopping!',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 45),
              ),
            ),
            const SizedBox(height: 24),
            const Spacer(),
            InkWell(
              onTap: () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const HomePage();
                  },
                ),
              ),
              child: Container(
                height: 80,
                width: 350,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(36),
                    color: Colors.deepPurple),
                child: const Center(
                  child: Text(
                    "Get Started",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
