import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Restaurant Menu',
      theme: ThemeData(primarySwatch: Colors.yellow),
      home: const MenuScreen(),
    );
  }
}

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Restaurant_103014_Wan Adam',
          style: TextStyle(color: Colors.white, fontSize: 24.0),
        ),
        backgroundColor: Colors.deepOrange,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          buildFoodCard(
              context,
              'Vegetable Pizza',
              'assets/images/pizza.png',
              'Fresh vegetables and melted cheese on a crispy crust.'
          ),
          buildFoodCard(
              context,
              'Cheeseburger',
              'assets/images/burger.png',
              'Grilled beef patty with cheddar cheese and fresh lettuce.'
          ),
          buildFoodCard(
              context,
              'Spaghetti Pasta',
              'assets/images/pasta.png',
              'Classic Italian pasta served with rich tomato basil sauce.'
          ),
        ],
      ),
    );
  }

  Widget buildFoodCard(BuildContext context, String name, String imagePath, String description) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => FoodDetailScreen(name: name, imagePath: imagePath, description: description),
          ),
        );
      },
      child: Card(
        elevation: 5,
        color: Colors.orange,
        margin: const EdgeInsets.only(bottom: 16.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Image.asset(imagePath, width: 100, height: 100),
              const SizedBox(width: 20),
              Expanded(
                child: Text(
                  name,
                  style: const TextStyle(fontSize: 24.0, color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FoodDetailScreen extends StatelessWidget {
  final String name;
  final String imagePath;
  final String description;

  const FoodDetailScreen({super.key, required this.name, required this.imagePath, required this.description});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
        backgroundColor: Colors.deepOrange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Image.asset(imagePath, height: 200)),
            const SizedBox(height: 20),
            Text(name, style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Text(description, style: const TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
