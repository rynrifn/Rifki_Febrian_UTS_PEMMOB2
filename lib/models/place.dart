class Place {
  final String id;
  final String name;
  final String description;
  final double latitude;
  final double longitude;
  final String category;
  final double rating;

  Place({
    required this.id,
    required this.name,
    required this.description,
    required this.latitude,
    required this.longitude,
    required this.category,
    required this.rating,
  });

  factory Place.fromJson(Map<String, dynamic> json) {
    return Place(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      category: json['category'],
      rating: json['rating'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'latitude': latitude,
      'longitude': longitude,
      'category': category,
      'rating': rating,
    };
  }
}
