import 'package:flutter/material.dart';

class Deals extends StatefulWidget {
  const Deals({Key? key}) : super(key: key);

  @override
  _DealsState createState() => _DealsState();
}

class _DealsState extends State<Deals> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Colors.deepPurple,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Check Latest Deals and Discounts',
                  style: TextStyle(
                    color: Colors.deepPurple,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                DiscountCard(
                  title: 'Weekend Special',
                  description: 'Get 30% off on weekends!',
                  couponCode: 'HAPPY WEEKENDS',
                  validity: 'Valid only on weekends',
                  backgroundColor: Color(0xffF9F4CA),
                ),
                DiscountCard(
                  title: 'Weekday Offer',
                  description: 'Save 20% on orders above \$250!',
                  couponCode: 'SAVE20',
                  validity: 'Valid from Mon to Fri',
                  backgroundColor: Color(0xffF9F4CA),
                ),
                DiscountCard(
                  title: 'Cricket World Cup',
                  description: '50% off on Pak vs India match!',
                  couponCode: 'CRICKET23',
                  validity: 'Valid on 14th Oct 2023',
                  backgroundColor: Color(0xffF9F4CA),
                ),
                DiscountCard(
                  title: 'Eid Milad un-Nabi',
                  description: 'Get 25% off on Eid Milad un-Nabi',
                  couponCode: 'S.A.W.W',
                  validity: 'Valid on 27th Sep 2023',
                  backgroundColor: Color(0xffF9F4CA),
                ),
                DiscountCard(
                  title: 'Iqbal Day',
                  description: 'Save 30% on orders above \$300!',
                  couponCode: 'iqbal2023',
                  validity: 'Valid on 09th Nov 2023',
                  backgroundColor: Color(0xffF9F4CA),
                ),
                DiscountCard(
                  title: 'Quaid-e-Azam Day',
                  description: 'Get flat 50% off on Quaid-e-Azam Day!',
                  couponCode: 'quaid2023',
                  validity: 'Valid on 25th Dec 2023',
                  backgroundColor: Color(0xffF9F4CA),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class DiscountCard extends StatelessWidget {
  final String title;
  final String description;
  final String couponCode;
  final String validity;
  final Color backgroundColor;

  const DiscountCard({
    required this.title,
    required this.description,
    required this.couponCode,
    required this.validity,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 12),
      color: backgroundColor, // Set the background color of the Card widget
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                color: Colors.deepPurple,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              description,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Coupon Code: $couponCode',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.redAccent,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Validity: $validity',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
