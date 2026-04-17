class Appliance {
  final String id;
  final String title;
  final String subtitle;
  final String description;
  final String imageUrl;
  final List<String> steps;

  Appliance({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.imageUrl,
    required this.steps,
  });

  // Chuyển đổi từ JSON (khi gọi API) sang Object Flutter
  factory Appliance.fromJson(Map<String, dynamic> json) {
    return Appliance(
      id: json['id'],
      title: json['title'],
      subtitle: json['subtitle'],
      description: json['description'],
      imageUrl: json['imageUrl'],
      steps: List<String>.from(json['steps']),
    );
  }
}