import 'package:flutter/material.dart';
import 'package:grocery_app/screens/Cart_page.dart';

class CartModel extends ChangeNotifier {
  String discountCode = "";

  // Function to set the discount code
  void setDiscountCode(String code) {
    discountCode = code;
    notifyListeners(); // Notify listeners about the change
  }

  final List<List<dynamic>> _shopItems = [
    [
      "Avocado",
      "5.00",
      "https://images.unsplash.com/photo-1560155016-bd4879ae8f21?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8YXZvY2Fkb3xlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=600&q=60",
      Colors.green,
      "Fruits"
    ],
    [
      "Banana",
      "3.00",
      "https://plus.unsplash.com/premium_photo-1685946109192-b9b1867bf0c7?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8N3x8YmFuYW5hfGVufDB8fDB8fHww&auto=format&fit=crop&w=600&q=60",
      Colors.green
    ],
    [
      "Apples",
      "2.00",
      "https://images.unsplash.com/photo-1567306226416-28f0efdc88ce?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8YXBwbGVzfGVufDB8fDB8fHww&auto=format&fit=crop&w=600&q=60",
      Colors.green
    ],
    [
      "Spinach",
      "8.00",
      "https://images.unsplash.com/photo-1576045057995-568f588f82fb?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8c3BpbmFjaHxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=600&q=60",
      Colors.green
    ],
    [
      "Tomatoes",
      "9.00",
      "https://images.unsplash.com/photo-1594057687713-5fd14eed1c17?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OHx8dG9tYXRvZXN8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=600&q=60",
      Colors.green,
      "Vegetables"
    ],
    [
      "Onion",
      "4.00",
      "https://images.unsplash.com/photo-1618512496248-a07fe83aa8cb?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8b25pb258ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=600&q=60",
      Colors.green
    ],
    [
      "Chicken",
      "15.80",
      "https://images.unsplash.com/photo-1587593810167-a84920ea0781?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8Y2hpY2tlbnxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=600&q=60",
      Colors.green
    ],
    [
      "Water",
      "4.00",
      "https://images.unsplash.com/photo-1560847468-5eef330f455a?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8bWluZXJhbCUyMHdhdGVyfGVufDB8fDB8fHww&auto=format&fit=crop&w=600&q=60",
      Colors.green
    ],
    [
      "Beef",
      "20.00",
      "https://images.unsplash.com/photo-1603048297172-c92544798d5a?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OHx8YmVlZnxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=600&q=60",
      Colors.green,
      "Meat"
    ],
    [
      "Bread",
      "6.00",
      "https://images.unsplash.com/photo-1598373182133-52452f7691ef?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTF8fGJyZWFkfGVufDB8fDB8fHww&auto=format&fit=crop&w=600&q=60",
      Colors.green,
      "Bread"
    ],
    [
      "Eggs",
      "1.50",
      "https://images.unsplash.com/photo-1498654077810-12c21d4d6dc3?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8ZWdnc3xlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=600&q=60",
      Colors.green
    ],
    [
      "Milk",
      "6.00",
      "https://images.unsplash.com/photo-1600788907416-456578634209?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8bWlsa3xlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=600&q=60",
      Colors.green
    ],
    [
      "Rice",
      "9.00",
      "https://images.unsplash.com/photo-1586201375761-83865001e31c?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8cmljZXxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=600&q=60",
      Colors.green
    ],
    [
      "Salt",
      "5.00",
      "https://images.unsplash.com/photo-1621315892013-f32af7358947?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8c2FsdHxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=600&q=60",
      Colors.green
    ],
    [
      "Sugar",
      "6.00",
      "https://media.istockphoto.com/id/1463356584/photo/closeup-sugar-piling-up-the-shape-of-the-hill-from-wooden-spoons-and-sugar-cubes-on-a-black.webp?b=1&s=170667a&w=0&k=20&c=e1I8WG_8eJaa6_yQSWhQwzLC8E-ih-1L2poSbvfH10M=",
      Colors.green
    ],
    [
      "Tea Bags",
      "4.00",
      "https://images.unsplash.com/photo-1546648596-d8318bfcf491?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8dGVhJTIwYmFnc3xlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=600&q=60",
      Colors.green
    ],
    [
      "Strawberry",
      "7.00",
      "https://images.unsplash.com/photo-1587393855524-087f83d95bc9?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8c3RyYXdiZXJyeXxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=600&q=60",
      Colors.green
    ],
    [
      "Mango",
      "10.00",
      "https://images.unsplash.com/photo-1519096845289-95806ee03a1a?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTZ8fG1hbmdvfGVufDB8fDB8fHww&auto=format&fit=crop&w=600&q=60",
      Colors.green
    ],
    [
      "Grapes",
      "5.00",
      "https://images.unsplash.com/photo-1625499940894-8796928bf9c4?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OHx8Z3JhcGVzfGVufDB8fDB8fHww&auto=format&fit=crop&w=600&q=60",
      Colors.green
    ],
    [
      "Pineapple",
      "9.00",
      "https://images.unsplash.com/photo-1589820296156-2454bb8a6ad1?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cGluZWFwcGxlfGVufDB8fDB8fHww&auto=format&fit=crop&w=600&q=60",
      Colors.green
    ],
    [
      "Kiwi",
      "3.00",
      "https://images.unsplash.com/photo-1610917040803-1fccf9623064?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8a2l3aSUyMGZydWl0fGVufDB8fDB8fHww&auto=format&fit=crop&w=600&q=60",
      Colors.green
    ],
    [
      "Blueberries",
      "6.00",
      "https://plus.unsplash.com/premium_photo-1669235170950-683284b542cd?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTl8fGJsdWViZXJyaWVzfGVufDB8fDB8fHww&auto=format&fit=crop&w=600&q=60",
      Colors.green
    ],
    [
      "Lemon",
      "2.00",
      "https://images.unsplash.com/photo-1587496679742-bad502958fbf?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8bGVtb258ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=600&q=60",
      Colors.green
    ],
    [
      "Carrot",
      "3.00",
      "https://images.unsplash.com/photo-1639427444459-85a1b6ac2d68?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTF8fGNhcnJvdHxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=600&q=60",
      Colors.green
    ],
    [
      "Broccoli",
      "14.00",
      "https://images.unsplash.com/photo-1459411621453-7b03977f4bfc?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8YnJvY2NvbGl8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=600&q=60",
      Colors.green
    ],
    [
      "Potato",
      "4.00",
      "https://images.unsplash.com/photo-1590165482129-1b8b27698780?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8cG90YXRvfGVufDB8fDB8fHww&auto=format&fit=crop&w=600&q=60",
      Colors.green
    ],
    [
      "Cucumber",
      "6.00",
      "https://images.unsplash.com/photo-1604977042946-1eecc30f269e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OXx8Y3VjdW1iZXJ8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=600&q=60",
      Colors.green
    ],
    [
      "Cauliflower",
      "11.00",
      "https://images.unsplash.com/photo-1584615467033-75627d04dffe?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8Y2F1bGlmbG93ZXJ8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=600&q=60",
      Colors.green
    ],
    [
      "Garlic",
      "5.00",
      "https://images.unsplash.com/photo-1615477550927-6ec8445fcfe6?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTF8fGdhcmxpY3xlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=600&q=60",
      Colors.green
    ],
    [
      "Radish",
      "4.00",
      "https://plus.unsplash.com/premium_photo-1669680785872-e0dd7190113c?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8N3x8cmFkaXNofGVufDB8fDB8fHww&auto=format&fit=crop&w=600&q=60",
      Colors.green
    ],
    [
      "Cheese",
      "5.00",
      "https://images.unsplash.com/photo-1480951759438-f39a376462f2?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8Y2hlZXNlfGVufDB8fDB8fHww&auto=format&fit=crop&w=600&q=60",
      Colors.green
    ],
    [
      "Yogurt",
      "9.00",
      "https://images.unsplash.com/photo-1572041002237-762bdc102cf6?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTJ8fHlvZ3VydHxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=600&q=60",
      Colors.green
    ],
    [
      "Butter",
      "7.00",
      "https://images.unsplash.com/photo-1589985270826-4b7bb135bc9d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8YnV0dGVyfGVufDB8fDB8fHww&auto=format&fit=crop&w=600&q=60",
      Colors.green
    ],
    [
      "Mutton",
      "25.00",
      "https://plus.unsplash.com/premium_photo-1667545932065-59f39c3c4f2c?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8bXV0dG9ufGVufDB8fDB8fHww&auto=format&fit=crop&w=600&q=60",
      Colors.green
    ],
    [
      "Fish",
      "35.00",
      "https://media.istockphoto.com/id/1392444775/photo/fresh-largemouth-bass-isolated-on-white-background.webp?b=1&s=170667a&w=0&k=20&c=RIexX1MI3bozqh4If7yhkAJB_zJdkuQjWu11sE84kmo=",
      Colors.green
    ],
    [
      "Cereal",
      "25.00",
      "https://images.unsplash.com/photo-1614961234274-f204d01c115e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8Y2VyZWFsfGVufDB8fDB8fHww&auto=format&fit=crop&w=600&q=60",
      Colors.green
    ],
    [
      "Pasta",
      "15.00",
      "https://images.unsplash.com/photo-1546549032-9571cd6b27df?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8cGFzdGF8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=600&q=60",
      Colors.green
    ],
    [
      "Hand Sanitizer",
      "5.00",
      "https://images.unsplash.com/photo-1584744982491-665216d95f8b?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8aGFuZCUyMHNhbml0aXplcnxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=600&q=60",
      Colors.green
    ],
    [
      "Toilet Paper",
      "10.00",
      "https://images.unsplash.com/photo-1631524254770-03abe3f42a0d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8dG9pbGV0JTIwcGFwZXJ8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=600&q=60",
      Colors.green
    ],
    [
      "Peanut Butter",
      "22.00",
      "https://images.unsplash.com/photo-1615110250484-e8c3b151b957?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cGVhbnV0JTIwYnV0dGVyfGVufDB8fDB8fHww&auto=format&fit=crop&w=600&q=60",
      Colors.green
    ],
    [
      "Jam",
      "18.00",
      "https://plus.unsplash.com/premium_photo-1670839413362-8fbf80ad50d2?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTN8fGphbXxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=600&q=60",
      Colors.green
    ],
    [
      "Cooking Oil",
      "35.00",
      "https://plus.unsplash.com/premium_photo-1664391616054-1671f1b7f75d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTN8fGNvb2tpbmclMjBvaWx8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=600&q=60",
      Colors.green
    ],
    [
      "Soda",
      "15.00",
      "https://images.unsplash.com/photo-1603968070333-58761fa00853?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8c29kYXxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=600&q=60",
      Colors.green
    ],
    [
      "Cold Coffee",
      "12.00",
      "https://images.unsplash.com/photo-1571328003758-4a3921661729?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8Y29sZCUyMGNvZmZlZXxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=600&q=60",
      Colors.green
    ],
    [
      "Iced Tea",
      "15.00",
      "https://images.unsplash.com/photo-1556679343-c7306c1976bc?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8aWNlZCUyMHRlYXxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=600&q=60",
      Colors.green
    ],
    [
      "Fresh Juice",
      "20.00",
      "https://images.unsplash.com/photo-1522427088495-81d38b91befb?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTd8fGZyZXNoJTIwanVpY2V8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=600&q=60",
      Colors.green
    ],
    [
      "Energy Drinks",
      "35.00",
      "https://images.unsplash.com/photo-1622543925917-763c34d1a86e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OXx8ZW5lcmd5JTIwZHJpbmtzfGVufDB8fDB8fHww&auto=format&fit=crop&w=600&q=60",
      Colors.green,
      "Beverages",
    ],
    [
      "Fanta",
      "6.00",
      "https://images.unsplash.com/photo-1632818924360-68d4994cfdb2?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8ZmFudGF8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=600&q=60",
      Colors.green,
      "Beverages"
    ],
    [
      "Coca Cola ",
      "6.00",
      "https://images.unsplash.com/photo-1554866585-cd94860890b7?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8Y29jYSUyMGNvbGF8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=600&q=60",
      Colors.green
    ]
  ];

  final List _cartItems = [];
  get cartItems => _cartItems;

  // final String _discountCode = "";
  // get discountCode => _discountCode;

  final List _FavoriteItems = [];

  get shopItems => _shopItems;

  get FavoriteItems => _FavoriteItems;

  // String get controller => controller;

  void addItemToCart(int index) {
    _cartItems.add(_shopItems[index]);
    notifyListeners();
  }

  void removeItemFromCart(int index) {
    _cartItems.removeAt(index);
    notifyListeners();
  }

  void removeItemFromFavorite(int index) {
    _FavoriteItems.removeAt(index);
    notifyListeners();
  }

  void addItemToFavorite(int index) {
    _FavoriteItems.add(_shopItems[index]);
    notifyListeners();
  }

  double calculateTotal() {
    double totalPrice = 0;
    for (int i = 0; i < cartItems.length; i++) {
      totalPrice += double.parse(cartItems[i][1]);
    }
    return totalPrice;
  }

  double calculateDiscount() {
    double totalPrice = calculateTotal();
    String code = discountCode;

    DateTime now = DateTime.now();
    int dayOfWeek = now.weekday;

    if (code == "HAPPY WEEKENDS" && (dayOfWeek == 0 || dayOfWeek == 6)) {
      double discount = totalPrice * 0.3;
      double discountedPrice = totalPrice - discount;

      // Print or use the discounted price as needed
      print('Total Price: \$${totalPrice.toStringAsFixed(2)}');
      print('Discounted Price: \$${discountedPrice.toStringAsFixed(2)}');

      return discountedPrice;
    } else if (code == "SAVE20" &&
        ((dayOfWeek == 1 ||
            dayOfWeek == 2 ||
            dayOfWeek == 3 ||
            dayOfWeek == 4 ||
            dayOfWeek == 5))) {
      double discount = totalPrice * 0.2;
      double discountedPrice = totalPrice - discount;

      // Print or use the discounted price as needed
      print('Total Price: \$${totalPrice.toStringAsFixed(2)}');
      print('Discounted Price: \$${discountedPrice.toStringAsFixed(2)}');

      return discountedPrice;
    } else if (code == "CRICKET23" &&
        now.year == 2023 &&
        now.month == 10 &&
        now.day == 14) {
      double discount = totalPrice * 0.5;
      double discountedPrice = totalPrice - discount;

      // Print or use the discounted price as needed
      print('Total Price: \$${totalPrice.toStringAsFixed(2)}');
      print('Discounted Price: \$${discountedPrice.toStringAsFixed(2)}');

      return discountedPrice;
    } else if (code == "S.A.W.W" &&
        now.year == 2023 &&
        now.month == 09 &&
        now.day == 27) {
      double discount = totalPrice * 0.25;
      double discountedPrice = totalPrice - discount;

      // Print or use the discounted price as needed
      print('Total Price: \$${totalPrice.toStringAsFixed(2)}');
      print('Discounted Price: \$${discountedPrice.toStringAsFixed(2)}');

      return discountedPrice;
    } else if (code == "iqbal2023" &&
        now.year == 2023 &&
        now.month == 11 &&
        now.day == 09) {
      double discount = totalPrice * 0.3;
      double discountedPrice = totalPrice - discount;

      // Print or use the discounted price as needed
      print('Total Price: \$${totalPrice.toStringAsFixed(2)}');
      print('Discounted Price: \$${discountedPrice.toStringAsFixed(2)}');

      return discountedPrice;
    } else if (code == "quaid2023" &&
        now.year == 2023 &&
        now.month == 12 &&
        now.day == 25) {
      double discount = totalPrice * 0.5;
      double discountedPrice = totalPrice - discount;

      // Print or use the discounted price as needed
      print('Total Price: \$${totalPrice.toStringAsFixed(2)}');
      print('Discounted Price: \$${discountedPrice.toStringAsFixed(2)}');

      return discountedPrice;
    } else {
      print("NO DISCOUNT APPLIED");
      return totalPrice;
    }
  }
}





// void weekendSpecial() {
  //   String code = "HAPPY WEEKENDS"; // Replace with your code input
  //   double totalPrice =
  //       calculateTotal(); // Replace with your total price calculation

  //   // Get the current day of the week (0 = Sunday, 1 = Monday, ..., 6 = Saturday)
  //   DateTime now = DateTime.now();
  //   int dayOfWeek = now.weekday;

  //   // Check if the code is "HAPPY WEEKENDS" and it's a weekend (Saturday or Sunday)
  //   if (code == "HAPPY WEEKENDS" && (dayOfWeek == 0 || dayOfWeek == 6)) {
  //     // Apply a 30 percent discount
  //     double discount = totalPrice * 0.3;
  //     double discountedPrice = totalPrice - discount;

  //     // Print or use the discounted price as needed
  //     print('Total Price: \$${totalPrice.toStringAsFixed(2)}');
  //     print('Discounted Price: \$${discountedPrice.toStringAsFixed(2)}');
  //   } else {
  //     // No discount applied
  //     print('No discount applied');
  //   }
  // }

  // void weekdayOffer() {
  //   String code = "SAVE20";
  //   double totalPrice = calculateTotal();

  //   // (0 = Sunday, 1 = Monday, ..., 6 = Saturday)
  //   DateTime now = DateTime.now();
  //   int dayOfWeek = now.weekday;

  //   if (code == "SAVE20" &&
  //       (dayOfWeek == 1 ||
  //           dayOfWeek == 2 ||
  //           dayOfWeek == 3 ||
  //           dayOfWeek == 4 ||
  //           dayOfWeek == 5)) {
  //     double discount = totalPrice * 0.2;
  //     double discountedPrice = totalPrice - discount;

  //     print('Total Price: \$${totalPrice.toStringAsFixed(2)}');
  //     print('Discounted Price: \$${discountedPrice.toStringAsFixed(2)}');
  //   } else {
  //     print('No discount applied');
  //   }
  // }

  // void cricketWorldCup() {
  //   String code = "CRICKET23";
  //   DateTime now = DateTime.now();

  //   // Check if the code is "CRICKET23" and the date is 14th Oct 2023
  //   if (code == "CRICKET23" &&
  //       now.year == 2023 &&
  //       now.month == 10 &&
  //       now.day == 14) {
  //     // Calculate the discount and discounted price here
  //     double totalPrice = calculateTotal();
  //     double discount = totalPrice * 0.5;
  //     double discountedPrice = totalPrice - discount;

  //     // Print or use the discounted price as needed
  //     print('Total Price: \$${totalPrice.toStringAsFixed(2)}');
  //     print('Discounted Price: \$${discountedPrice.toStringAsFixed(2)}');
  //   } else {
  //     // No discount applied
  //     print('No discount applied');
  //   }
  // }

  // void eidMilad() {
  //   String code = "S.A.W.W";
  //   DateTime now = DateTime.now();

  //   // Check if the code is "CRICKET23" and the date is 14th Oct 2023
  //   if (code == "S.A.W.W" &&
  //       now.year == 2023 &&
  //       now.month == 9 &&
  //       now.day == 27) {
  //     // Calculate the discount and discounted price here
  //     double totalPrice = calculateTotal();
  //     double discount = totalPrice * 0.25;
  //     double discountedPrice = totalPrice - discount;

  //     // Print or use the discounted price as needed
  //     print('Total Price: \$${totalPrice.toStringAsFixed(2)}');
  //     print('Discounted Price: \$${discountedPrice.toStringAsFixed(2)}');
  //   } else {
  //     // No discount applied
  //     print('No discount applied');
  //   }
  // }

  // void iqbalDay() {
  //   String code = "iqbal2023";
  //   DateTime now = DateTime.now();

  //   // Check if the code is "CRICKET23" and the date is 14th Oct 2023
  //   if (code == "iqbal2023" &&
  //       now.year == 2023 &&
  //       now.month == 11 &&
  //       now.day == 9) {
  //     // Calculate the discount and discounted price here
  //     double totalPrice = calculateTotal();
  //     double discount = totalPrice * 0.30;
  //     double discountedPrice = totalPrice - discount;

  //     // Print or use the discounted price as needed
  //     print('Total Price: \$${totalPrice.toStringAsFixed(2)}');
  //     print('Discounted Price: \$${discountedPrice.toStringAsFixed(2)}');
  //   } else {
  //     // No discount applied
  //     print('No discount applied');
  //   }
  // }

  // void quaidDay() {
  //   String code = "quaid2023";
  //   DateTime now = DateTime.now();

  //   // Check if the code is "CRICKET23" and the date is 14th Oct 2023
  //   if (code == "quaid2023" &&
  //       now.year == 2023 &&
  //       now.month == 12 &&
  //       now.day == 25) {
  //     // Calculate the discount and discounted price here
  //     double totalPrice = calculateTotal();
  //     double discount = totalPrice * 0.50;
  //     double discountedPrice = totalPrice - discount;

  //     // Print or use the discounted price as needed
  //     print('Total Price: \$${totalPrice.toStringAsFixed(2)}');
  //     print('Discounted Price: \$${discountedPrice.toStringAsFixed(2)}');
  //   } else {
  //     // No discount applied
  //     print('No discount applied');
  //   }
  // }