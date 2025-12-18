import 'package:flutter/material.dart';
import '../models/restaurant.dart';
import '../services/restaurant_service.dart';

enum ViewState { loading, success, error }

class RestaurantViewModel extends ChangeNotifier {
  final RestaurantService _service = RestaurantService();

  ViewState _state = ViewState.loading;
  ViewState get state => _state;

  List<Restaurant> _allRestaurants = []; // เก็บข้อมูลต้นฉบับทั้งหมด
  List<Restaurant> _filteredRestaurants = []; // เก็บข้อมูลที่ผ่านการกรองเพื่อแสดงผล
  
  // Getter สำหรับดึงข้อมูลไปแสดงที่หน้า UI
  List<Restaurant> get restaurants => _filteredRestaurants;

  String _errorMessage = '';
  String get errorMessage => _errorMessage;

  RestaurantViewModel() {
    loadRestaurants();
  }

  Future<void> loadRestaurants() async {
    _state = ViewState.loading;
    notifyListeners();

    try {
      _allRestaurants = await _service.fetchRestaurants();
      _filteredRestaurants = _allRestaurants; // เริ่มต้นให้แสดงผลทั้งหมด
      _state = ViewState.success;
    } catch (e) {
      _errorMessage = e.toString();
      _state = ViewState.error;
    }

    notifyListeners();
  }

  //Method Test 
  void searchRestaurants(String query) {
    if (query.isEmpty) {
      _filteredRestaurants = _allRestaurants;
    } else {
      _filteredRestaurants = _allRestaurants
          .where((restaurant) =>
              restaurant.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    notifyListeners();
  }
}