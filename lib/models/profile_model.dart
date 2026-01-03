/// Model representing a traveler profile
class ProfileModel {
  final String id;
  final String name;
  final int age;
  final String location;
  final String description;
  final String imageUrl;
  final List<String> interests;
  final String travelStyle; // Adventure, Luxury, Budget, Cultural, etc.
  final bool verified;
  final double rating;
  final int reviewCount;

  ProfileModel({
    required this.id,
    required this.name,
    required this.age,
    required this.location,
    required this.description,
    required this.imageUrl,
    this.interests = const [],
    this.travelStyle = 'Adventure',
    this.verified = false,
    this.rating = 5.0,
    this.reviewCount = 0,
  });

  factory ProfileModel.fromMap(Map<String, dynamic> map) {
    return ProfileModel(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      age: map['age'] ?? 0,
      location: map['location'] ?? '',
      description: map['description'] ?? '',
      imageUrl: map['imageUrl'] ?? '',
      interests: List<String>.from(map['interests'] ?? []),
      travelStyle: map['travelStyle'] ?? 'Adventure',
      verified: map['verified'] ?? false,
      rating: (map['rating'] ?? 5.0).toDouble(),
      reviewCount: map['reviewCount'] ?? 0,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'age': age,
      'location': location,
      'description': description,
      'imageUrl': imageUrl,
      'interests': interests,
      'travelStyle': travelStyle,
      'verified': verified,
      'rating': rating,
      'reviewCount': reviewCount,
    };
  }
}
