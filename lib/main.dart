import 'package:flutter/material.dart';
import 'screens/home_screen.dart'; // Import màn hình danh sách từ thư mục screens

void main() {
  // Đảm bảo các ràng buộc Flutter đã sẵn sàng
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Tắt nhãn debug
      title: 'Ứng Dụng Hướng Dẫn Sửa Chữa',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
        // Cấu hình theme chung cho toàn bộ ứng dụng
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.blueAccent,
          foregroundColor: Colors.white,
          centerTitle: true,
        ),
      ),
      // Gọi màn hình danh sách đã được thiết kế trong screens/home_screen.dart
      home: HomeScreen(),
    );
  }
}