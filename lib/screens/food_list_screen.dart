import 'package:flutter/material.dart';
import 'package:intl/intl.dart';  // Thêm thư viện intl để định dạng tiền
import '../data/food_data.dart';
import 'food_detail_screen.dart';

class FoodListScreen extends StatelessWidget {
  final String categoryId;
  final String categoryName;

  FoodListScreen({required this.categoryId, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    // Lọc món ăn theo danh mục
    final filteredFoods = foodItems.where((food) => food.id == categoryId).toList();

    // Định dạng tiền Việt Nam (VNĐ)
    final currencyFormatter = NumberFormat.currency(locale: 'vi_VN', symbol: 'đ');

    return Scaffold(
      appBar: AppBar(
        title: Text('Danh sách món: $categoryName'),
      ),
      body: ListView.builder(
        itemCount: filteredFoods.length,
        itemBuilder: (context, index) {
          final food = filteredFoods[index];
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
                // Hiển thị giá bằng tiền VNĐ
                trailing: Text(currencyFormatter.format(food.price)),
              ),
            ),
          );
        },
      ),
    );
  }
}
