import 'package:flutter/material.dart';
import '../models/appliance.dart';

class DetailScreen extends StatelessWidget {
  final Appliance appliance;
  const DetailScreen({super.key, required this.appliance});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 250,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(appliance.title),
              background: Image.network(
                appliance.imageUrl,
                fit: BoxFit.cover,
                // THÊM ĐOẠN NÀY ĐỂ XỬ LÝ LỖI 404:
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.blueAccent,
                    child: const Center(
                      child: Icon(Icons.broken_image, size: 50, color: Colors.white),
                    ),
                  );
                },
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(appliance.title, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  Text(appliance.subtitle, style: const TextStyle(color: Colors.red, fontSize: 18)),
                  const Divider(),
                  const Text("Quy trình sửa chữa:", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
                  ...appliance.steps.map((step) => ListTile(
                    leading: const Icon(Icons.check_circle, color: Colors.green),
                    title: Text(step),
                  )),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}