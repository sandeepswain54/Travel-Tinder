import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../widgets/reusable_widgets.dart';
import 'travel_match_screen.dart';

/// Screen to find and connect with travel buddies
class FindBuddiesScreen extends StatefulWidget {
  const FindBuddiesScreen({super.key});

  @override
  State<FindBuddiesScreen> createState() => _FindBuddiesScreenState();
}

class _FindBuddiesScreenState extends State<FindBuddiesScreen> {
  String _selectedFilter = 'All';
  String _sortBy = 'Recent';

  final List<Map<String, dynamic>> buddies = [
    {
      'name': 'Adventure Squad',
      'members': 12,
      'destination': 'Southeast Asia',
      'image':
          'https://images.unsplash.com/photo-1469854523086-cc02fe5d8800?w=500',
      'status': 'Active',
    },
    {
      'name': 'Beach Lovers Club',
      'members': 8,
      'destination': 'Caribbean',
      'image':
          'https://images.unsplash.com/photo-1507525428034-b723cf961d3e?w=500',
      'status': 'Active',
    },
    {
      'name': 'Cultural Explorers',
      'members': 15,
      'destination': 'Europe',
      'image':
          'https://images.unsplash.com/photo-1502602898657-3e91760cbb34?w=500',
      'status': 'Active',
    },
    {
      'name': 'Budget Backpackers',
      'members': 20,
      'destination': 'South America',
      'image':
          'https://images.unsplash.com/photo-1488646953014-85cb44e25828?w=500',
      'status': 'Active',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Find Buddies'),
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: _showCreateBuddyGroupDialog,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.all(AppTheme.spacingMd),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Connect with other\ntravelers',
                    style: TextStyle(
                      fontFamily: 'Playfair',
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: AppTheme.spacingMd),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Search groups or travelers...',
                      prefixIcon: const Icon(Icons.search),
                    ),
                  ),
                ],
              ),
            ),

            // Filter and Sort
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppTheme.spacingMd,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Filter Dropdown
                  DropdownButton<String>(
                    value: _selectedFilter,
                    underline: const SizedBox(),
                    items: ['All', 'Active', 'Upcoming', 'Completed']
                        .map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() => _selectedFilter = newValue!);
                    },
                  ),

                  // Sort Dropdown
                  DropdownButton<String>(
                    value: _sortBy,
                    underline: const SizedBox(),
                    items: ['Recent', 'Popular', 'Members', 'Rating']
                        .map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() => _sortBy = newValue!);
                    },
                  ),
                ],
              ),
            ),

            const SizedBox(height: AppTheme.spacingMd),

            // Buddy Groups List
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(
                horizontal: AppTheme.spacingMd,
              ),
              itemCount: buddies.length,
              itemBuilder: (context, index) {
                final buddy = buddies[index];
                return _buildBuddyGroupCard(context, buddy);
              },
            ),

            const SizedBox(height: AppTheme.spacingLg),
          ],
        ),
      ),
    );
  }

  Widget _buildBuddyGroupCard(
    BuildContext context,
    Map<String, dynamic> buddy,
  ) {
    return GestureDetector(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Viewing ${buddy['name']}'),
          ),
        );
      },
      child: Card(
        margin: const EdgeInsets.only(bottom: AppTheme.spacingMd),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppTheme.radiusLarge),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(AppTheme.radiusLarge),
                topRight: Radius.circular(AppTheme.radiusLarge),
              ),
              child: Stack(
                children: [
                  Image.network(
                    buddy['image'],
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: Colors.grey[300],
                        height: 200,
                        child: const Center(
                          child: Icon(Icons.image_not_supported),
                        ),
                      );
                    },
                  ),
                  // Status Badge
                  Positioned(
                    top: 12,
                    right: 12,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppTheme.spacingSm,
                        vertical: AppTheme.spacingSm,
                      ),
                      decoration: BoxDecoration(
                        color: AppTheme.successColor,
                        borderRadius:
                            BorderRadius.circular(AppTheme.radiusSmall),
                      ),
                      child: Text(
                        buddy['status'],
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Content
            Padding(
              padding: const EdgeInsets.all(AppTheme.spacingMd),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              buddy['name'],
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: AppTheme.spacingSm),
                            Row(
                              children: [
                                const Icon(
                                  Icons.location_on,
                                  size: 16,
                                  color: AppTheme.primaryColor,
                                ),
                                const SizedBox(width: AppTheme.spacingSm),
                                Text(
                                  buddy['destination'],
                                  style: const TextStyle(
                                    color: AppTheme.textLight,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppTheme.spacingMd,
                          vertical: AppTheme.spacingSm,
                        ),
                        decoration: BoxDecoration(
                          color: AppTheme.primaryColor.withOpacity(0.1),
                          borderRadius:
                              BorderRadius.circular(AppTheme.radiusSmall),
                        ),
                        child: Column(
                          children: [
                            Text(
                              '${buddy['members']}',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: AppTheme.primaryColor,
                              ),
                            ),
                            const Text(
                              'members',
                              style: TextStyle(
                                fontSize: 10,
                                color: AppTheme.textLight,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: AppTheme.spacingMd),

                  // Action Buttons
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Joined ${buddy['name']}!',
                                ),
                              ),
                            );
                          },
                          child: const Text('View'),
                        ),
                      ),
                      const SizedBox(width: AppTheme.spacingMd),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Joined ${buddy['name']}!',
                                ),
                                backgroundColor: AppTheme.successColor,
                              ),
                            );
                          },
                          child: const Text('Join'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showCreateBuddyGroupDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Create Travel Group'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Group name',
                    border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(AppTheme.radiusMedium),
                    ),
                  ),
                ),
                const SizedBox(height: AppTheme.spacingMd),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Destination',
                    border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(AppTheme.radiusMedium),
                    ),
                  ),
                ),
                const SizedBox(height: AppTheme.spacingMd),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Description',
                    border: OutlineInputBorder(
                      borderRadius:
                          BorderRadius.circular(AppTheme.radiusMedium),
                    ),
                  ),
                  maxLines: 3,
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Group created successfully!'),
                    backgroundColor: AppTheme.successColor,
                  ),
                );
              },
              child: const Text('Create'),
            ),
          ],
        );
      },
    );
  }
}
