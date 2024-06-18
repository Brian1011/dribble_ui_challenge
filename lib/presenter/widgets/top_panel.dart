import 'package:drible_real_estate_ui/core/styling/styling.dart';
import 'package:drible_real_estate_ui/presenter/widgets/search_bar.dart';
import 'package:flutter/material.dart';

class TopPanel extends StatelessWidget {
  const TopPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding16,
      child: Column(
        children: [
          const Row(
            children: [
              Expanded(flex: 2, child: CustomSearchBar()),
              Spacer(),
              Profile(),
            ],
          ),
          mediumHeightSpace,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hi, Marina',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: Theme.of(context).colorScheme.secondary,
                      fontWeight: FontWeight.normal,
                    ),
              ),
              smallHeightSpace,
              const PerfectPlace(),
            ],
          ),
        ],
      ),
    );
  }
}

class PerfectPlace extends StatefulWidget {
  const PerfectPlace({super.key});

  @override
  State<PerfectPlace> createState() => _PerfectPlaceState();
}

class _PerfectPlaceState extends State<PerfectPlace>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );

    _offsetAnimation = Tween<Offset>(
      begin: const Offset(0.0, 1.0),
      end: const Offset(0.0, 0.0),
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
    return SlideTransition(
      position: _offsetAnimation,
      child: Text(
        "let's select your perfect place",
        style: Theme.of(context).textTheme.headlineLarge?.copyWith(
              fontWeight: FontWeight.normal,
            ),
      ),
    );
  }
}

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );

    _scaleAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    ));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _scaleAnimation,
      child: CircleAvatar(
        backgroundColor: Theme.of(context).primaryColor,
        radius: 30.0,
        child: const Icon(
          Icons.person,
          color: Colors.white,
        ),
      ),
    );
  }
}
