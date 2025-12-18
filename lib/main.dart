import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'viewmodels/restaurant_viewmodel.dart';
import 'views/restaurant_list_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => RestaurantViewModel()..loadRestaurants(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RestaurantListScreen(),
    );
  }
}