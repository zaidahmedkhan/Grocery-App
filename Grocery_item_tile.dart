import 'package:flutter/material.dart';

class GroceryItemTile extends StatelessWidget {
  final String itemName;
  final String itemPrice;
  final String imagePath;
  final Color color;
  final VoidCallback? onPressed;
  final VoidCallback? onLongPressed;

  GroceryItemTile({
    Key? key,
    required this.itemName,
    required this.itemPrice,
    required this.imagePath,
    required this.color,
    required this.onPressed,
    required this.onLongPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(36),
          color: const Color(0xffF9F4CA),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Image.network(
                imagePath,
                height: 64,
              ),
            ),
            Text(
              itemName,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
            MaterialButton(
              onLongPress: () async {
                if (onLongPressed != null) {
                  onLongPressed!();
                }
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Item added to Favorites successfully"),
                    duration: Duration(seconds: 1),
                  ),
                );
              },
              onPressed: () async {
                if (onPressed != null) {
                  onPressed!();
                }

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Item added to cart successfully"),
                    duration: Duration(seconds: 1),
                  ),
                );
              },
              color: color,
              child: Text(
                '\$' + itemPrice,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
