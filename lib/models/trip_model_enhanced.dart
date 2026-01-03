import 'package:intl/intl.dart';

/// Enhanced model representing a trip with more details
class TripModelEnhanced {
  final String id;
  final String name;
  final String description;
  final int budget;
  final DateTime startDate;
  final DateTime endDate;
  final List<String> imagePaths;
  final String destination;
  final List<String> activities;
  final String difficulty; // Easy, Medium, Hard
  final int maxTravelers;
  final int currentTravelers;
  final double rating;
  final String createdBy;

  TripModelEnhanced({
    required this.id,
    required this.name,
    required this.description,
    required this.budget,
    required this.startDate,
    required this.endDate,
    required this.imagePaths,
    required this.destination,
    this.activities = const [],
    this.difficulty = 'Medium',
    this.maxTravelers = 4,
    this.currentTravelers = 1,
    this.rating = 4.5,
    required this.createdBy,
  });

  /// Get duration in days
  int get durationDays => endDate.difference(startDate).inDays + 1;

  /// Get budget per day
  double get budgetPerDay => budget / durationDays;

  /// Format date range
  String get dateRange {
    final formatter = DateFormat('MMM dd, yyyy');
    return '${formatter.format(startDate)} - ${formatter.format(endDate)}';
  }

  /// Check if trip is upcoming
  bool get isUpcoming => startDate.isAfter(DateTime.now());

  /// Check if spots available
  bool get hasAvailableSpots => currentTravelers < maxTravelers;

  factory TripModelEnhanced.fromMap(Map<String, dynamic> map) {
    return TripModelEnhanced(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      budget: map['budget'] ?? 0,
      startDate: map['startDate'] is DateTime ? map['startDate'] : DateTime.parse(map['startDate']),
      endDate: map['endDate'] is DateTime ? map['endDate'] : DateTime.parse(map['endDate']),
      imagePaths: List<String>.from(map['imagePaths'] ?? []),
      destination: map['destination'] ?? '',
      activities: List<String>.from(map['activities'] ?? []),
      difficulty: map['difficulty'] ?? 'Medium',
      maxTravelers: map['maxTravelers'] ?? 4,
      currentTravelers: map['currentTravelers'] ?? 1,
      rating: (map['rating'] ?? 4.5).toDouble(),
      createdBy: map['createdBy'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'budget': budget,
      'startDate': startDate.toIso8601String(),
      'endDate': endDate.toIso8601String(),
      'imagePaths': imagePaths,
      'destination': destination,
      'activities': activities,
      'difficulty': difficulty,
      'maxTravelers': maxTravelers,
      'currentTravelers': currentTravelers,
      'rating': rating,
      'createdBy': createdBy,
    };
  }
}
