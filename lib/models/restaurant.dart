import 'menu_item.dart';

class Restaurant {
  final int id;
  final String name;
  final String category;
  final String hours;
  final List<MenuItem> menu;

  Restaurant({
    required this.id,
    required this.name,
    required this.category,
    required this.hours,
    required this.menu,
  });

  factory Restaurant.fromJson(Map<String, dynamic> json) {
    return Restaurant(
      id: json['id'],
      name: json['name'],
      category: json['category'],
      hours: json['hours'],
      menu: (json['menu'] as List).map((e) => MenuItem.fromJson(e)).toList(),
    );
  }
}
