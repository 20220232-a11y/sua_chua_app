import 'package:flutter/material.dart';
import '../models/appliance.dart';
import '../services/api_service.dart';
import 'detail_screen.dart';

class HomeScreen extends StatelessWidget {
  // Thêm constructor const để tối ưu hiệu năng
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ApiService apiService = ApiService();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Hướng Dẫn Sửa Chữa"),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
      ),
      body: FutureBuilder<List<Appliance>>(
        future: apiService.fetchAppliances(),
        builder: (context, snapshot) {
          // 1. Đang chờ dữ liệu
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          // 2. Có lỗi xảy ra
          if (snapshot.hasError) {
            return Center(child: Text("Lỗi: ${snapshot.error}"));
          }

          // 3. Không có dữ liệu
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("Không có thiết bị nào được tìm thấy!"));
          }

          final data = snapshot.data!;

          return ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: data.length,
            itemBuilder: (context, index) {
              final item = data[index];
              return Card(
                margin: const EdgeInsets.symmetric(vertical: 8),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                elevation: 4,
                child: ListTile(
                  contentPadding: const EdgeInsets.all(10),
                  // Xử lý ảnh với cơ chế chống lỗi 404
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      item.imageUrl,
                      width: 60,
                      height: 60,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) =>
                          Container(width: 60, height: 60, color: Colors.grey[200], child: const Icon(Icons.broken_image)),
                    ),
                  ),
                  title: Text(item.title, style: const TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text(item.subtitle),
                  trailing: const Icon(Icons.chevron_right),
                  onTap: () {
                    // Điều hướng sang trang chi tiết với tham số 'appliance'
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => DetailScreen(appliance: item),
                      ),
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}