import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_application_1/viewmodels/restaurant_viewmodel.dart';
import 'package:flutter_application_1/views/restaurant_detail_screen.dart';
import 'package:flutter_application_1/views/loading_screen.dart';
import 'package:flutter_application_1/widgets/loading_widget.dart';
import 'package:flutter_application_1/widgets/restaurant_card.dart';

class RestaurantListScreen extends StatefulWidget {
  const RestaurantListScreen({super.key});

  @override
  State<RestaurantListScreen> createState() => _RestaurantListScreenState();
}

class _RestaurantListScreenState extends State<RestaurantListScreen> {
  String query = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Mini Food Delivery',
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),

      body: Column(
        children: [
          //Search bar
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search restaurant...',
                hintStyle: TextStyle(color: Colors.grey.shade600, fontSize: 14),
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.grey.shade100,
                contentPadding: const EdgeInsets.symmetric(vertical: 0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide.none,
                ),
              ),
              onChanged: (value) {
                setState(() {
                  query = value;
                });
              },
            ),
          ),

          //Restaurant List
          Expanded(
            child: Consumer<RestaurantViewModel>(
              builder: (context, vm, _) {
                // ⏳ Loading
                if (vm.state == ViewState.loading) {
                  return const LoadingWidget();
                }

                //Error
                if (vm.state == ViewState.error) {
                  return Center(child: Text(vm.errorMessage));
                }

                //Filter by search
                final filtered = vm.restaurants
                    .where(
                      (r) => r.name.toLowerCase().contains(query.toLowerCase()),
                    )
                    .toList();

                //No Restaurants
                if (filtered.isEmpty) {
                  return const Center(child: Text('No restaurants found'));
                }

                //Success
                return ListView.builder(
                  itemCount: filtered.length,
                  itemBuilder: (context, index) {
                    final r = filtered[index];
                    return RestaurantCard(
                      restaurant: r,
                      onTap: () async {
                        //loading
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const LoadingScreen(),
                          ),
                        );

                        //โหลด 1 วิ
                        await Future.delayed(const Duration(seconds: 1));

                        //ปิดโหลด
                        Navigator.pop(context);

                        //ไปหน้า Detail
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => RestaurantDetailScreen(r),
                          ),
                        );
                      },
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
}
