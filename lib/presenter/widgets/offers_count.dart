import 'package:drible_real_estate_ui/core/core.dart';
import 'package:flutter/material.dart';

class OffersCount extends StatefulWidget {
  const OffersCount({super.key});

  @override
  State<OffersCount> createState() => _OffersCountState();
}

class _OffersCountState extends State<OffersCount>
    with SingleTickerProviderStateMixin {
  final Tween<int> _countAnimation1 = IntTween(begin: 0, end: 1034);
  final Tween<int> _countAnimation2 = IntTween(begin: 0, end: 2212);
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3500),
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
    return Padding(
      padding: padding16,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: TweenAnimationBuilder<int>(
                tween: _countAnimation1,
                duration: const Duration(seconds: 3),
                builder: (context, value, child) {
                  return ScaleTransition(
                    scale: _scaleAnimation,
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.2,
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        shape: BoxShape.circle,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('BUY',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(color: Colors.white)),
                          extraLargeHeightSpace,
                          Text(
                            '$value',
                            style: Theme.of(context)
                                .textTheme
                                .headlineLarge
                                ?.copyWith(color: Colors.white),
                          ),
                          smallHeightSpace,
                          Text(
                            'offers',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          ),
          const SizedBox(width: 16.0),
          Expanded(
            child: TweenAnimationBuilder<int>(
                tween: _countAnimation2,
                duration: const Duration(seconds: 3),
                builder: (context, value, child) {
                  return ScaleTransition(
                    scale: _scaleAnimation,
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.2,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(18.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 2,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('RENT',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                  )),
                          extraLargeHeightSpace,
                          Text('$value',
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineLarge
                                  ?.copyWith(
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                  )),
                          smallHeightSpace,
                          Text(
                            'offers',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
