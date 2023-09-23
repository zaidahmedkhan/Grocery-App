import 'package:flutter/material.dart';
import 'package:grocery_app/model/cart_model.dart';
import 'package:provider/provider.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.deepPurple,
        ),
      ),
      body: Consumer<CartModel>(builder: (context, value, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 9.0),
              child: Text(
                "My Favorites Products",
                style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple),
              ),
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: ListView.builder(
                  itemCount: value.FavoriteItems.length,
                  padding: const EdgeInsets.all(12),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Color(0xffF9F4CA),
                            borderRadius: BorderRadius.circular(8)),
                        child: ListTile(
                          leading: Image.network(value.FavoriteItems[index][2],
                              height: 36),
                          title: Text(
                            value.FavoriteItems[index][0],
                            style: const TextStyle(fontSize: 18),
                          ),
                          subtitle: Text(
                            '\$' + value.FavoriteItems[index][1],
                            style: const TextStyle(fontSize: 12),
                          ),
                          trailing: IconButton(
                            icon: const Icon(
                              Icons.cancel,
                              color: Colors.red,
                            ),
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: const Text("Remove Item"),
                                  content: const Text(
                                      "Are you sure you want to remove this item from the Favorites list?"),
                                  actions: [
                                    TextButton(
                                      child: const Text("No"),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                    TextButton(
                                      child: const Text("Yes"),
                                      onPressed: () {
                                        Provider.of<CartModel>(context,
                                                listen: false)
                                            .removeItemFromFavorite(index);

                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                            content: Text(
                                                "Item removed from Favorites list successfully"),
                                            duration: Duration(seconds: 1),
                                          ),
                                        );

                                        Navigator.of(context).pop();
                                      },
                                    )
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    );
                  }),
            ))
          ],
        );
      }),
    );
  }
}
