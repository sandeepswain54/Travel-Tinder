import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

/// Reusable profile card widget
class ProfileCard extends StatelessWidget {
  final String name;
  final String age;
  final String location;
  final String description;
  final String imageUrl;
  final bool verified;
  final double rating;
  final VoidCallback onTap;

  const ProfileCard({
    Key? key,
    required this.name,
    required this.age,
    required this.location,
    required this.description,
    required this.imageUrl,
    required this.onTap,
    this.verified = false,
    this.rating = 5.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: AppTheme.spacingMd),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppTheme.radiusXLarge),
        ),
        child: Stack(
          children: [
            // Background Image
            ClipRRect(
              borderRadius: BorderRadius.circular(AppTheme.radiusXLarge),
              child: Image.network(
                imageUrl,
                width: double.infinity,
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
                      Colors.black.withOpacity(0.8),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                padding: const EdgeInsets.all(AppTheme.spacingMd),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Name and Age
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            "$name, $age",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        if (verified)
                          const Icon(
                            Icons.verified,
                            color: AppTheme.secondaryColor,
                            size: 24,
                          ),
                      ],
                    ),

                    const SizedBox(height: AppTheme.spacingSm),

                    // Location
                    Row(
                      children: [
                        const Icon(
                          Icons.location_on,
                          color: Colors.white70,
                          size: 16,
                        ),
                        const SizedBox(width: AppTheme.spacingSm),
                        Text(
                          location,
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: AppTheme.spacingSm),

                    // Description
                    Text(
                      description,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),

                    const SizedBox(height: AppTheme.spacingSm),

                    // Rating
                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: 16,
                        ),
                        const SizedBox(width: AppTheme.spacingSm),
                        Text(
                          rating.toStringAsFixed(1),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Reusable trip card widget
class TripCard extends StatelessWidget {
  final String title;
  final String destination;
  final String budget;
  final String dateRange;
  final String imageUrl;
  final int availableSpots;
  final int maxSpots;
  final double rating;
  final VoidCallback onTap;

  const TripCard({
    Key? key,
    required this.title,
    required this.destination,
    required this.budget,
    required this.dateRange,
    required this.imageUrl,
    required this.onTap,
    this.availableSpots = 3,
    this.maxSpots = 4,
    this.rating = 4.5,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        margin: const EdgeInsets.all(AppTheme.spacingMd),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppTheme.radiusLarge),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Trip Image
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(AppTheme.radiusLarge),
                topRight: Radius.circular(AppTheme.radiusLarge),
              ),
              child: Stack(
                children: [
                  Image.network(
                    imageUrl,
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
                  // Rating badge
                  Positioned(
                    top: 12,
                    right: 12,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppTheme.spacingSm,
                        vertical: AppTheme.spacingSm,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.6),
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
                            rating.toString(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Trip Details
            Padding(
              padding: const EdgeInsets.all(AppTheme.spacingMd),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.textDark,
                    ),
                  ),
                  const SizedBox(height: AppTheme.spacingSm),
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on,
                        color: AppTheme.primaryColor,
                        size: 16,
                      ),
                      const SizedBox(width: AppTheme.spacingSm),
                      Text(
                        destination,
                        style: const TextStyle(
                          color: AppTheme.textLight,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: AppTheme.spacingSm),
                  Row(
                    children: [
                      const Icon(
                        Icons.calendar_today,
                        color: AppTheme.primaryColor,
                        size: 16,
                      ),
                      const SizedBox(width: AppTheme.spacingSm),
                      Text(
                        dateRange,
                        style: const TextStyle(
                          color: AppTheme.textLight,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: AppTheme.spacingMd),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        budget,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: AppTheme.primaryColor,
                        ),
                      ),
                      Text(
                        "$availableSpots/$maxSpots spots",
                        style: const TextStyle(
                          fontSize: 12,
                          color: AppTheme.textLight,
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
}

/// Loading shimmer effect
class ShimmerLoading extends StatefulWidget {
  final double width;
  final double height;
  final double borderRadius;

  const ShimmerLoading({
    Key? key,
    this.width = double.infinity,
    this.height = 200,
    this.borderRadius = AppTheme.radiusLarge,
  }) : super(key: key);

  @override
  State<ShimmerLoading> createState() => _ShimmerLoadingState();
}

class _ShimmerLoadingState extends State<ShimmerLoading>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return Container(
          width: widget.width,
          height: widget.height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(widget.borderRadius),
            gradient: LinearGradient(
              colors: [
                Colors.grey[300]!,
                Colors.grey[100]!,
                Colors.grey[300]!,
              ],
              stops: [
                0,
                _animationController.value,
                1,
              ],
              transform: GradientRotation(_animationController.value * 3.14),
            ),
          ),
        );
      },
    );
  }
}

/// Custom button widget
class CustomButton extends StatefulWidget {
  final String label;
  final VoidCallback onPressed;
  final bool isLoading;
  final bool isOutlined;
  final IconData? icon;
  final double? width;

  const CustomButton({
    Key? key,
    required this.label,
    required this.onPressed,
    this.isLoading = false,
    this.isOutlined = false,
    this.icon,
    this.width,
  }) : super(key: key);

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      child: widget.isOutlined
          ? OutlinedButton.icon(
              onPressed: widget.isLoading ? null : widget.onPressed,
              icon: widget.icon != null ? Icon(widget.icon) : const SizedBox(),
              label: widget.isLoading
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                      ),
                    )
                  : Text(widget.label),
            )
          : ElevatedButton.icon(
              onPressed: widget.isLoading ? null : widget.onPressed,
              icon: widget.icon != null ? Icon(widget.icon) : const SizedBox(),
              label: widget.isLoading
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        valueColor:
                            AlwaysStoppedAnimation<Color>(Colors.white),
                      ),
                    )
                  : Text(widget.label),
            ),
    );
  }
}
