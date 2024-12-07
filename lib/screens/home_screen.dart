import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../data/food_data.dart';
import 'food_detail_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final currencyFormatter = NumberFormat.currency(locale: 'vi_VN', symbol: 'đ');

    return Scaffold(
      appBar: AppBar(
        title: Text('Food App'),
      ),
      body: ListView.builder(
        itemCount: foodItems.length,
        itemBuilder: (context, index) {
          final food = foodItems[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FoodDetailScreen(
                    title: food.title,
                    description: food.description,
                    price: food.price,
                    imageUrl: food.imageUrl,
                  ),
                ),
              );
            },
            child: Card(
              child: ListTile(
                leading: Image.asset(food.imageUrl, width: 50, fit: BoxFit.cover),
                title: Text(food.title),
                subtitle: Text(food.description),
                trailing: Text(currencyFormatter.format(food.price)),
              ),
            ),
          );
        },
      ),
    );
  }
}
