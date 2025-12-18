# Mini Food Delivery Browser

## ฟีเจอร์ (Features)
- **Restaurant List:** แสดงรายการร้านอาหารพร้อมประเภท และเวลาเปิด-ปิด
- **Search Bar:** ค้นหาร้านอาหารได้
- **Restaurant Detail:** แสดงประเภทและเวลาเปิด-ปิด และรายการเมนูอาหารพร้อมราคา
- **State Management:** รองรับสถานะ Loading, Success และ Error

## โครงสร้างแอป
ใช้ **MVVM (Model-View-ViewModel-Main)** ประกอบด้วยกันดังนี้:

### Models
- `restaurant.dart`: ข้อมูลหลักของร้านอาหาร
- `menu_item.dart`: ข้อมูลรายการอาหาร

### Services
- `restaurant_service.dart`: การดึงข้อมูลจาก Local JSON 

### ViewModels
- `restaurant_viewmodel.dart`:  Logic, สถานะการโหลดข้อมูล และการค้นหา

### Views
- `restaurant_list_screen.dart`: หน้าหลักแสดงรายการทั้งหมดร้านอาหาร
- `restaurant_detail_screen.dart`: หน้าจอแสดงรายละเอียดของร้านอาหาร
- `loading_screen.dart`: หน้าจอรอโหลดข้อมูล

### Widgets
- `restaurant_card.dart`: UI สำหรับแสดงข้อมูลร้านแต่ละร้าน
- `loading_widget.dart`: UI สำหรับแสดงสถานะการโหลด

## Tech Stack
- **Language:** Dart
- **Framework:** Flutter
- **Architecture:** MVVM
- **Data Source:** Local JSON

## Tests

1. **searchRestaurants Validation:** สามารถกรองรายชื่อร้านอาหารได้ถูกต้องตามคำค้นหา
2. **Clear Search Results:** เมื่อลบคำค้นหา จะต้องแสดงรายการร้านอาหารทั้งหมดกลับมาอย่างถูกต้อง
3. **Case Insensitive Search:** ช่องค้นหาสามารถค้นหาได้ทั้งตัวอักษรพิมพ์เล็กและพิมพ์ใหญ่โดยผลลัพธ์ต้องได้เหมือนกัน (เช่น "pizza" และ "PIZZA")
4. **Data Consistency:** ความถูกต้องของข้อมูลหลังจากการโหลดจากไฟล์ Local JSON

### วิธีการรันการทดสอบ (How to run tests):
เปิด Terminal:
```bash
flutter test

## วิธีการติดตั้ง (Setup)
1. Clone Repository:
   ```bash
   git clone [https://github.com/yourusername/your-repo-name.git](https://github.com/yourusername/your-repo-name.git)
