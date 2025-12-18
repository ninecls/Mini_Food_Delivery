import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_1/viewmodels/restaurant_viewmodel.dart';

void main() {
  group('RestaurantViewModel Search Tests', () {
    late RestaurantViewModel viewModel;

    setUp(() {
      viewModel = RestaurantViewModel();
    });

    test('ฟังก์ชัน searchRestaurants กรองข้อมูลได้ถูกต้อง', () async {
      // รอให้การโหลดข้อมูล Local JSON เสร็จก่อน
      await Future.delayed(Duration(milliseconds: 100));

      if (viewModel.state == ViewState.success) {
        // ทดสอบค้นหา
        viewModel.searchRestaurants("Pizza");
        
        // ตรวจสอบว่าผลลัพธ์ต้องมีแต่ร้านที่มีคำว่า Pizza เท่านั้น
        for (var r in viewModel.restaurants) {
          expect(r.name.toLowerCase().contains("pizza"), true);
        }
      }
    });

    test('ลบคำค้นหาต้องกลับมาแสดงร้านทั้งหมด', () async {
      await Future.delayed(Duration(milliseconds: 100));

      if (viewModel.state == ViewState.success) {
        int totalBefore = viewModel.restaurants.length;
        
        viewModel.searchRestaurants("Something"); // ค้นหาบางอย่าง
        viewModel.searchRestaurants(""); // ล้างค่า
        
        expect(viewModel.restaurants.length, totalBefore);
      }
    });

    test('ค้นหาไม่สนเรื่องอักษรตัวเล็กหรือตัวใหญ่', () {
      // ค้นหาด้วยตัวเล็กทั้งหมด
      viewModel.searchRestaurants("pizza");
      int resultCount = viewModel.restaurants.length;

      // ค้นหาด้วยตัวใหญ่
      viewModel.searchRestaurants("PIZZA");
      
      expect(viewModel.restaurants.length, resultCount);
    });

  });
}