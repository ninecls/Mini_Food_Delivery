import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/restaurant.dart';

class RestaurantService {
  Future<List<Restaurant>> fetchRestaurants() async {
    await Future.delayed(const Duration(seconds: 2)); // simulate loading

    final data = await rootBundle.loadString('assets/restaurants.json');
    final List decoded = json.decode(data);

    return decoded.map((e) => Restaurant.fromJson(e)).toList();
  }
}
