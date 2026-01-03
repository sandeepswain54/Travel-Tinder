import 'package:flutter/material.dart';
import 'package:swipe_cards/swipe_cards.dart';
import '../theme/app_theme.dart';
import '../models/profile_model.dart';
import '../widgets/reusable_widgets.dart';

/// Improved Travel Match Screen with swipe functionality
class TravelMatchScreen extends StatefulWidget {
  const TravelMatchScreen({super.key});

  @override
  State<TravelMatchScreen> createState() => _TravelMatchScreenState();
}

class _TravelMatchScreenState extends State<TravelMatchScreen> {
  late MatchEngine _matchEngine;
  final List<SwipeItem> _swipeItems = [];
  int _likeCount = 0;
  int _skipCount = 0;

  final List<ProfileModel> profiles = [
    ProfileModel(
      id: '1',
      name: 'Sophie Chen',
      age: 28,
      location: 'Singapore',
      description:
          'Adventure seeker with love for hiking and cultural experiences. Always up for spontaneous trips!',
      imageUrl:
          'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=500',
      interests: ['Hiking', 'Photography', 'Food'],
      travelStyle: 'Adventure',
      verified: true,
      rating: 4.8,
      reviewCount: 23,
    ),
    ProfileModel(
      id: '2',
      name: 'Marcus Williams',
      age: 32,
      location: 'San Francisco',
      description:
          'Tech professional who loves exploring new cultures. Beach lover and foodie.',
      imageUrl:
          'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?w=500',
      interests: ['Beach', 'Food', 'Technology'],
      travelStyle: 'Luxury',
      verified: true,
      rating: 4.6,
      reviewCount: 18,
    ),
    ProfileModel(
      id: '3',
      name: 'Emma Thompson',
      age: 26,
      location: 'London',
      description:
          'Passionate about sustainable travel and meeting locals. Love hostels and authentic experiences.',
      imageUrl:
          'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?w=500',
      interests: ['Culture', 'Sustainability', 'Music'],
      travelStyle: 'Budget',
      verified: false,
      rating: 4.7,
      reviewCount: 15,
    ),
    ProfileModel(
      id: '4',
      name: 'Raj Patel',
      age: 29,
      location: 'Mumbai',
      description:
          'Love exploring off-beaten paths. Always looking for travel buddies for unique experiences.',
      imageUrl:
          'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=500',
      interests: ['Adventure', 'Photography', 'Hiking'],
      travelStyle: 'Adventure',
      verified: true,
      rating: 4.9,
      reviewCount: 32,
    ),
    ProfileModel(
      id: '5',
      name: 'Lara Müller',
      age: 30,
      location: 'Berlin',
      description:
          'Wine enthusiast and architecture lover. Looking for cultured travel companions.',
      imageUrl:
          'https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=500',
      interests: ['Wine', 'Culture', 'Architecture'],
      travelStyle: 'Luxury',
      verified: true,
      rating: 4.5,
      reviewCount: 20,
    ),
  ];

  @override
  void initState() {
    super.initState();
    _initializeSwipeItems();
  }

  void _initializeSwipeItems() {
    _swipeItems.clear();
    for (var profile in profiles) {
      _swipeItems.add(
        SwipeItem(
          content: profile,
          likeAction: () => _handleLike(profile),
          nopeAction: () => _handleSkip(profile),
          superlikeAction: () => _handleSuperLike(profile),
        ),
      );
    }
    _matchEngine = MatchEngine(swipeItems: _swipeItems);
  }

  void _handleLike(ProfileModel profile) {
    setState(() => _likeCount++);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('You liked ${profile.name} 👍'),
        duration: const Duration(milliseconds: 800),
        backgroundColor: AppTheme.successColor,
      ),
    );
  }

  void _handleSkip(ProfileModel profile) {
    setState(() => _skipCount++);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Skipped ${profile.name}'),
        duration: const Duration(milliseconds: 800),
        backgroundColor: AppTheme.textLight,
      ),
    );
  }

  void _handleSuperLike(ProfileModel profile) {
    setState(() => _likeCount++);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Super liked ${profile.name}! 💕'),
        duration: const Duration(milliseconds: 800),
        backgroundColor: AppTheme.primaryColor,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Find Travel Buddies'),
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: Text(
                'Matches: $_likeCount',
                style: const TextStyle(
                  color: AppTheme.primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
      body: _swipeItems.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.sentiment_satisfied,
                    size: 80,
                    color: AppTheme.primaryColor,
                  ),
                  const SizedBox(height: AppTheme.spacingMd),
                  const Text(
                    'No more profiles!',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: AppTheme.spacingSm),
                  Text(
                    'You liked $_likeCount travelers',
                    style: const TextStyle(
                      color: AppTheme.textLight,
                    ),
                  ),
                  const SizedBox(height: AppTheme.spacingMd),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _likeCount = 0;
                        _skipCount = 0;
                        _initializeSwipeItems();
                      });
                    },
                    child: const Text('Refresh Profiles'),
                  ),
                ],
              ),
            )
          : Column(
              children: [
                // Stats Bar
                Container(
                  padding: const EdgeInsets.all(AppTheme.spacingMd),
                  decoration: BoxDecoration(
                    color: AppTheme.lightBackground,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(AppTheme.radiusLarge),
                      bottomRight: Radius.circular(AppTheme.radiusLarge),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildStatColumn('Profiles', _swipeItems.length),
                      _buildStatColumn('Liked', _likeCount),
                      _buildStatColumn('Skipped', _skipCount),
                    ],
                  ),
                ),

                const SizedBox(height: AppTheme.spacingMd),

                // Swipe Cards
                Expanded(
                  child: SwipeCards(
                    matchEngine: _matchEngine,
                    itemBuilder: (context, index) {
                      final profile =
                          _swipeItems[index].content as ProfileModel;
                      return _buildProfileCard(profile);
                    },
                    onStackFinished: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'You matched with $_likeCount travelers! 🎉',
                          ),
                          backgroundColor: AppTheme.primaryColor,
                        ),
                      );
                    },
                    itemChanged: (item, index) {},
                    upSwipeAllowed: true,
                    fillSpace: true,
                  ),
                ),

                // Action Buttons
                Padding(
                  padding: const EdgeInsets.all(AppTheme.spacingMd),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildActionButton(
                        Icons.close,
                        AppTheme.errorColor,
                        () => _matchEngine.currentItem?.nope(),
                      ),
                      _buildActionButton(
                        Icons.star,
                        AppTheme.warningColor,
                        () => _matchEngine.currentItem?.superLike(),
                      ),
                      _buildActionButton(
                        Icons.favorite,
                        AppTheme.primaryColor,
                        () => _matchEngine.currentItem?.like(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }

  Widget _buildProfileCard(ProfileModel profile) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: AppTheme.spacingMd),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppTheme.radiusXLarge),
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          // Background Image
          ClipRRect(
            borderRadius: BorderRadius.circular(AppTheme.radiusXLarge),
            child: Image.network(
              profile.imageUrl,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: Colors.grey[300],
                  child: const Center(
                    child: Icon(Icons.image_not_supported),
                  ),
                );
              },
            ),
          ),

          // Gradient Overlay
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.transparent,
                    Colors.black.withOpacity(0.9),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              padding: const EdgeInsets.all(AppTheme.spacingMd),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Name, Age and Verification
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  '${profile.name}, ${profile.age}',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 26,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                if (profile.verified)
                                  const Padding(
                                    padding: EdgeInsets.only(
                                        left: AppTheme.spacingSm),
                                    child: Icon(
                                      Icons.verified,
                                      color: AppTheme.secondaryColor,
                                      size: 20,
                                    ),
                                  ),
                              ],
                            ),
                            const SizedBox(height: AppTheme.spacingSm),
                            Row(
                              children: [
                                const Icon(
                                  Icons.location_on,
                                  color: Colors.white70,
                                  size: 16,
                                ),
                                const SizedBox(width: AppTheme.spacingSm),
                                Text(
                                  profile.location,
                                  style: const TextStyle(
                                    color: Colors.white70,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppTheme.spacingSm,
                          vertical: AppTheme.spacingSm,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.5),
                          borderRadius:
                              BorderRadius.circular(AppTheme.radiusSmall),
                        ),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 16,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              '${profile.rating}',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: AppTheme.spacingMd),

                  // Travel Style
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppTheme.spacingSm,
                      vertical: AppTheme.spacingSm,
                    ),
                    decoration: BoxDecoration(
                      color: AppTheme.primaryColor,
                      borderRadius:
                          BorderRadius.circular(AppTheme.radiusSmall),
                    ),
                    child: Text(
                      profile.travelStyle,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  const SizedBox(height: AppTheme.spacingMd),

                  // Description
                  Text(
                    profile.description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),

                  const SizedBox(height: AppTheme.spacingMd),

                  // Interests
                  Wrap(
                    spacing: AppTheme.spacingSm,
                    runSpacing: AppTheme.spacingSm,
                    children: profile.interests
                        .map(
                          (interest) => Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: AppTheme.spacingSm,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(
                                AppTheme.radiusSmall,
                              ),
                            ),
                            child: Text(
                              interest,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton(
    IconData icon,
    Color color,
    VoidCallback onPressed,
  ) {
    return FloatingActionButton(
      onPressed: onPressed,
      backgroundColor: color,
      child: Icon(icon, color: Colors.white),
    );
  }

  Widget _buildStatColumn(String label, int value) {
    return Column(
      children: [
        Text(
          value.toString(),
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppTheme.primaryColor,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            color: AppTheme.textLight,
          ),
        ),
      ],
    );
  }
}
