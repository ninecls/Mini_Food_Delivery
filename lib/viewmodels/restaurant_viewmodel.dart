import 'package:flutter/material.dart';
import '../models/restaurant.dart';
import '../services/restaurant_service.dart';

enum ViewState { loading, success, error }

class RestaurantViewModel extends ChangeNotifier {
  final RestaurantService _service = RestaurantService();

  ViewState _state = ViewState.loading;
  ViewState get state => _state;

  List<Restaurant> restaurants = [];

  String _errorMessage = '';
  String get errorMessage => _errorMessage;

  RestaurantViewModel() {
    loadRestaurants();
  }

  Future<void> loadRestaurants() async {
    _state = ViewState.loading;
    notifyListeners();

    try {
      restaurants = await _service.fetchRestaurants();
      _state = ViewState.success;
    } catch (e) {
      _errorMessage = e.toString();
      _state = ViewState.error;
    }

    notifyListeners();
  }
}
