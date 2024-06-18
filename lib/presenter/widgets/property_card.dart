import 'package:flutter/material.dart';

import '../../core/core.dart';

class PropertyCard extends StatefulWidget {
  final String title;
  final String imageUrl;
  final bool isVertical;
  const PropertyCard({
    super.key,
    this.title = 'Property Card',
    this.imageUrl = propertyOne,
    this.isVertical = false,
  });

  @override
  State<PropertyCard> createState() => _PropertyCardState();
}

class _PropertyCardState extends State<PropertyCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _slideAnimation;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _slideAnimation = Tween<double>(
      begin: 600.0,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    _opacityAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding8.copyWith(top: 0, bottom: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: borderRadius8,
                child: Image.asset(
                  widget.imageUrl,
                  height: widget.isVertical ? 410 : 200.0,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              AnimatedPositioned(
                bottom: 12.0,
                right: _slideAnimation.value,
                duration: const Duration(milliseconds: 2400),
                child: Container(
                  margin: margin8,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.9),
                    borderRadius: borderRadius30,
                  ),
                  child: Row(
                    children: [
                      AnimatedOpacity(
                        opacity: _opacityAnimation.value,
                        duration: const Duration(seconds: 2),
                        child: Container(
                          padding: padding8,
                          child: Text(
                            widget.title,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        padding: padding8,
                        margin: marginRight4,
                        child: const Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.grey,
                          size: 16.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          mediumHeightSpace,
        ],
      ),
    );
  }
}
