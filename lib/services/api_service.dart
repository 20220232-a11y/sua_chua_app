import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/appliance.dart';

class ApiService {
  static const String apiUrl = "https://654321.mockapi.io/api/v1/appliances";

  Future<List<Appliance>> fetchAppliances() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        List<dynamic> body = jsonDecode(response.body);
        return body.map((dynamic item) => Appliance.fromJson(item)).toList();
      } else {
        return getFallbackData();
      }
    } catch (e) {
      return getFallbackData();
    }
  }

  // Dữ liệu mẫu với link ảnh ổn định
  List<Appliance> getFallbackData() {
    return [
      Appliance(
        id: '1',
        title: 'Máy Giặt',
        subtitle: 'Lỗi không thoát nước',
        description: 'Kiểm tra đường ống xả và bộ lọc.',
        imageUrl: 'https://images.unsplash.com/photo-1626806787461-102c1b38f881?auto=format&fit=crop&q=80&w=300',
        steps: ['Ngắt điện', 'Mở bộ lọc', 'Vệ sinh'],
      ),
      Appliance(
        id: '2',
        title: 'Tủ Lạnh',
        subtitle: 'Ngăn mát không lạnh',
        description: 'Đảm bảo cửa đã đóng kín.',
        imageUrl: 'https://images.unsplash.com/photo-1571175483880-72e105e2d83c?auto=format&fit=crop&q=80&w=300',
        steps: ['Kiểm tra nhiệt độ', 'Vệ sinh dàn lạnh'],
      ),
    ];
  }
}