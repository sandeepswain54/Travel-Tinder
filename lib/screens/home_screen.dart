import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../models/profile_model.dart';
import '../widgets/reusable_widgets.dart';
import 'travel_match_screen.dart';
import 'find_buddies_screen.dart';

/// Main home screen with tab navigation
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const DiscoverScreen(),
    const FindBuddiesScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: AppTheme.primaryColor,
        unselectedItemColor: AppTheme.textLight,
        onTap: (index) {
          setState(() => _currentIndex = index);
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: 'Discover',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Buddies',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

/// Discover trips screen
class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({super.key});

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Discover Trips'),
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Section
            Padding(
              padding: const EdgeInsets.all(AppTheme.spacingMd),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Ready for an\nAdventure?',
                    style: TextStyle(
                      fontFamily: 'Playfair',
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.textDark,
                    ),
                  ),
                  const SizedBox(height: AppTheme.spacingMd),
                  // Search Bar
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Search destinations...',
                      prefixIcon: const Icon(Icons.search),
                      suffixIcon: const Icon(Icons.tune),
                    ),
                  ),
                ],
              ),
            ),

            // Featured Trips Section
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppTheme.spacingMd,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Featured Trips',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text('View All'),
                      ),
                    ],
                  ),
                  const SizedBox(height: AppTheme.spacingMd),
                ],
              ),
            ),

            // Featured Trip Cards
            SizedBox(
              height: 300,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(
                  horizontal: AppTheme.spacingMd,
                ),
                itemCount: 3,
                itemBuilder: (context, index) {
                  final trips = [
                    {
                      'title': 'Bali Beach Escape',
                      'destination': 'Bali, Indonesia',
                      'budget': '₹25,000',
                      'dateRange': 'Jan 15 - Jan 22',
                      'imageUrl':
                          'https://images.unsplash.com/photo-1537225228614-b4fad34a0b60?w=500',
                      'spots': 2,
                    },
                    {
                      'title': 'Himalayan Trek',
                      'destination': 'Himalayas, India',
                      'budget': '₹35,000',
                      'dateRange': 'Jan 20 - Feb 05',
                      'imageUrl':
                          'https://images.unsplash.com/photo-1506905925346-21bda4d32df4?w=500',
                      'spots': 1,
                    },
                    {
                      'title': 'Paris City Tour',
                      'destination': 'Paris, France',
                      'budget': '₹45,000',
                      'dateRange': 'Feb 01 - Feb 08',
                      'imageUrl':
                          'https://images.unsplash.com/photo-1502602898657-3e91760cbb34?w=500',
                      'spots': 3,
                    },
                  ];

                  final trip = trips[index];
                  return Padding(
                    padding: const EdgeInsets.only(right: AppTheme.spacingMd),
                    child: SizedBox(
                      width: 280,
                      child: TripCard(
                        title: trip['title']!,
                        destination: trip['destination']!,
                        budget: trip['budget']!,
                        dateRange: trip['dateRange']!,
                        imageUrl: trip['imageUrl']!,
                        availableSpots: int.parse(trip['spots']!),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) =>
                                  const TravelMatchScreen(),
                            ),
                          );
                        },
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: AppTheme.spacingMd),

            // Categories Section
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppTheme.spacingMd,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Categories',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: AppTheme.spacingMd),
                  Wrap(
                    spacing: AppTheme.spacingMd,
                    runSpacing: AppTheme.spacingMd,
                    children: [
                      _buildCategoryChip('Adventure', Icons.hiking),
                      _buildCategoryChip('Beach', Icons.waves),
                      _buildCategoryChip('Culture', Icons.museum),
                      _buildCategoryChip('Food', Icons.restaurant),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: AppTheme.spacingLg),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryChip(String label, IconData icon) {
    return FilterChip(
      avatar: Icon(
        icon,
        size: 18,
        color: AppTheme.primaryColor,
      ),
      label: Text(label),
      onSelected: (selected) {},
      backgroundColor: AppTheme.lightBackground,
      side: const BorderSide(color: AppTheme.borderColor),
    );
  }
}

/// Profile screen
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Profile'),
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Profile Header
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(AppTheme.spacingMd),
              decoration: BoxDecoration(
                color: AppTheme.lightBackground,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(AppTheme.radiusLarge),
                  bottomRight: Radius.circular(AppTheme.radiusLarge),
                ),
              ),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: const NetworkImage(
                      'https://images.unsplash.com/photo-1535746051778-46e50028b48d?w=400',
                    ),
                  ),
                  const SizedBox(height: AppTheme.spacingMd),
                  const Text(
                    'Alex Johnson',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: AppTheme.spacingSm),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.location_on,
                        color: AppTheme.primaryColor,
                        size: 16,
                      ),
                      const SizedBox(width: AppTheme.spacingSm),
                      const Text(
                        'New York, USA',
                        style: TextStyle(
                          color: AppTheme.textLight,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: AppTheme.spacingMd),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildStatItem('42', 'Trips'),
                      _buildStatItem('4.8', 'Rating'),
                      _buildStatItem('128', 'Friends'),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: AppTheme.spacingMd),

            // Bio Section
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppTheme.spacingMd,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'About',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: AppTheme.spacingSm),
                  const Text(
                    'Adventure seeker, photographer, and solo traveler. '
                    'Love exploring new cultures and meeting interesting people.',
                    style: TextStyle(
                      color: AppTheme.textLight,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: AppTheme.spacingMd),

            // Interests
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppTheme.spacingMd,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Interests',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: AppTheme.spacingMd),
                  Wrap(
                    spacing: AppTheme.spacingMd,
                    runSpacing: AppTheme.spacingMd,
                    children: [
                      _buildInterestTag('Hiking'),
                      _buildInterestTag('Photography'),
                      _buildInterestTag('Food'),
                      _buildInterestTag('Culture'),
                      _buildInterestTag('Beach'),
                      _buildInterestTag('Music'),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: AppTheme.spacingLg),

            // Action Buttons
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppTheme.spacingMd,
              ),
              child: Column(
                children: [
                  CustomButton(
                    label: 'Edit Profile',
                    icon: Icons.edit,
                    onPressed: () {},
                    width: double.infinity,
                  ),
                  const SizedBox(height: AppTheme.spacingMd),
                  CustomButton(
                    label: 'My Trips',
                    icon: Icons.calendar_month,
                    onPressed: () {},
                    width: double.infinity,
                    isOutlined: true,
                  ),
                ],
              ),
            ),

            const SizedBox(height: AppTheme.spacingLg),
          ],
        ),
      ),
    );
  }

  Widget _buildStatItem(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppTheme.primaryColor,
          ),
        ),
        const SizedBox(height: AppTheme.spacingSm),
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

  Widget _buildInterestTag(String text) {
    return Chip(
      label: Text(text),
      backgroundColor: AppTheme.primaryColor.withOpacity(0.1),
      labelStyle: const TextStyle(
        color: AppTheme.primaryColor,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
