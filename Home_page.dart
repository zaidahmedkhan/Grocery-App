import 'package:flutter/material.dart';
import 'package:grocery_app/screens/chat_page.dart';
import 'package:grocery_app/screens/favorite_page.dart';
import 'package:provider/provider.dart';
import '../components/grocery_item_tile.dart';
import '../model/cart_model.dart';
import 'cart_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String searchQuery = '';
  String selectedCategory = '';

  String getCategory(String itemName) {
    final itemNameLowerCase = itemName.toLowerCase();
    if (itemNameLowerCase == "avocado" ||
        itemNameLowerCase == "banana" ||
        itemNameLowerCase == "apples" ||
        itemNameLowerCase == "strawberry" ||
        itemNameLowerCase == "mango" ||
        itemNameLowerCase == "grapes" ||
        itemNameLowerCase == "pineapple" ||
        itemNameLowerCase == "kiwi" ||
        itemNameLowerCase == "blueberries" ||
        itemNameLowerCase == "lemon") {
      return "Fruits";
    } else if (itemNameLowerCase == "spinach" ||
        itemNameLowerCase == "tomatoes" ||
        itemNameLowerCase == "onion" ||
        itemNameLowerCase == "carrot" ||
        itemNameLowerCase == "broccoli" ||
        itemNameLowerCase == "potato" ||
        itemNameLowerCase == "cucumber" ||
        itemNameLowerCase == "cauliflower" ||
        itemNameLowerCase == "garlic" ||
        itemNameLowerCase == "radish") {
      return "Vegetables";
    } else if (itemNameLowerCase == "chicken" ||
        itemNameLowerCase == "beef" ||
        itemNameLowerCase == "mutton" ||
        itemNameLowerCase == "fish") {
      return "Meat";
    } else if (itemNameLowerCase == "milk" ||
        itemNameLowerCase == "cheese" ||
        itemNameLowerCase == "yogurt" ||
        itemNameLowerCase == "eggs" ||
        itemNameLowerCase == "butter") {
      return "Dairy";
    } else if (itemNameLowerCase == "sugar" ||
        itemNameLowerCase == "salt" ||
        itemNameLowerCase == "tea bags" ||
        itemNameLowerCase == "rice" ||
        itemNameLowerCase == "bread" ||
        itemNameLowerCase == "cereal" ||
        itemNameLowerCase == "pasta" ||
        itemNameLowerCase == "hand sanitizer" ||
        itemNameLowerCase == "toilet paper" ||
        itemNameLowerCase == "peanut butter" ||
        itemNameLowerCase == "jam" ||
        itemNameLowerCase == "cooking oil") {
      return "Essentials";
    } else if (itemNameLowerCase == "water" ||
        itemNameLowerCase == "soda" ||
        itemNameLowerCase == "cold coffee" ||
        itemNameLowerCase == "iced tea" ||
        itemNameLowerCase == "fresh juice" ||
        itemNameLowerCase == "energy drinks" ||
        itemNameLowerCase == "fanta" ||
        itemNameLowerCase == "coca cola") {
      return "Beverages";
    }
    return "Other";
  }

  @override
  Widget build(BuildContext context) {
    final cartModel = Provider.of<CartModel>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return ChatPage();
            }));
          },
          child: Container(
            child: const Padding(
              padding: EdgeInsets.only(left: 24.0),
              child: Icon(
                Icons.chat_bubble_outline_rounded,
                color: Colors.deepPurple,
              ),
            ),
          ),
        ),
        title: const Text(
          'Chat with Us',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 19,
            color: Colors.deepPurple,
          ),
        ),
        centerTitle: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 24.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const FavoritePage();
                }));
              },
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.favorite,
                  color: Colors.red,
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return CartPage();
              },
            ),
          );
        },
        child: const Icon(
          Icons.shopping_bag,
          color: Colors.deepPurple,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 8),
          const SizedBox(height: 4),
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 24.0,
            ),
            child: Text(
              "Explore, Click, and Complete Your Purchases!",
              style: TextStyle(
                  fontSize: 40,
                  color: Colors.deepPurple,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              decoration: BoxDecoration(
                  color: const Color(0xffF9F4CA),
                  borderRadius: BorderRadius.circular(24)),
              child: Row(
                children: [
                  const Icon(
                    Icons.search,
                    color: Colors.red,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: TextField(
                      onChanged: (value) {
                        setState(() {
                          searchQuery = value.toLowerCase();
                          print('Search Query: $searchQuery');
                        });
                      },
                      decoration: const InputDecoration(
                          filled: true,
                          border: InputBorder.none,
                          hintText: 'Search',
                          fillColor: Color(0xffF9F4CA)),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Divider(
            color: Colors.deepPurple,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Row(
              children: [
                const Text(
                  'Categories:',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(width: 3),
                buildCategoryButton('All', selectedCategory == 'All'),
                const SizedBox(width: 3),
                buildCategoryButton('Fruits', selectedCategory == 'Fruits'),
                const SizedBox(width: 3),
                buildCategoryButton(
                    'Vegetables', selectedCategory == 'Vegetables'),
              ],
            ),
          ),
          Row(
            children: [
              const SizedBox(
                width: 20,
              ),
              buildCategoryButton('Dairy', selectedCategory == 'Dairy'),
              const SizedBox(width: 3),
              buildCategoryButton('Meat', selectedCategory == 'Meat'),
              const SizedBox(width: 3),
              buildCategoryButton('Beverages', selectedCategory == 'Beverages'),
              const SizedBox(width: 3),
              buildCategoryButton(
                  'Essentials', selectedCategory == 'Essentials')
            ],
          ),
          Expanded(
            child: Consumer<CartModel>(
              builder: (context, value, child) {
                final filteredItems =
                    filterItems(value.shopItems, selectedCategory);

                return GridView.builder(
                  padding: const EdgeInsets.all(12),
                  itemCount: filteredItems.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1 / 1.2,
                  ),
                  itemBuilder: (context, index) {
                    final item = filteredItems[index];
                    return GroceryItemTile(
                      itemName: filteredItems[index][0],
                      itemPrice: filteredItems[index][1],
                      imagePath: filteredItems[index][2],
                      color: filteredItems[index][3],
                      onPressed: () => cartModel.addItemToCart(index),
                      onLongPressed: () => cartModel.addItemToFavorite(index),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCategoryButton(String category, bool isSelected) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          selectedCategory = isSelected ? '' : category;
          print('Selected Category: $selectedCategory');
        });
      },
      style: ButtonStyle(
          backgroundColor: isSelected
              ? MaterialStateProperty.all(Colors.deepOrange)
              : MaterialStateProperty.all(Colors.orange)),
      child: Text(category),
    );
  }

  List<List<dynamic>> filterItems(List<List<dynamic>> items, String category) {
    print('Selected Category: $category');
    print('Search Query: $searchQuery');
    return items.where((item) {
      final itemName = item[0].toString().toLowerCase();
      final itemCategory = getCategory(item[0]).toLowerCase();
      // print('Item Name: $itemName, Item Category: $itemCategory');
      return (category.isEmpty ||
              category.toLowerCase() == 'all' ||
              itemCategory == category.toLowerCase()) &&
          itemName.contains(searchQuery);
    }).toList();
  }
}
