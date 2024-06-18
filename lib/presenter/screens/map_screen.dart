import 'package:flutter/material.dart';

import '../../core/core.dart';
import '../widgets/widgets.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late OverlayEntry _overlayEntry;
  bool _isMenuOpen = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
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

  OverlayEntry _createOverlayEntry(BuildContext context, Offset position) {
    return OverlayEntry(
      builder: (context) => Positioned(
        left: position.dx,
        top: position.dy,
        child: Material(
          color: Colors.transparent,
          child: FadeTransition(
            opacity: _scaleAnimation,
            child: Container(
              width: 200,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 10,
                    spreadRadius: 5,
                  ),
                ],
              ),
              child: GestureDetector(
                onTap: () {
                  _hideMenu();
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const PopupMenuItem(
                      value: 1,
                      child: Row(
                        children: [
                          Icon(Icons.verified_outlined),
                          smallWidthSpace,
                          Text('Cosy areas'),
                        ],
                      ),
                    ),
                    PopupMenuItem(
                      value: 1,
                      child: Row(
                        children: [
                          Icon(
                            Icons.wallet,
                            color: Theme.of(context).primaryColor,
                          ),
                          smallWidthSpace,
                          Text(
                            'Price',
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const PopupMenuItem(
                      value: 1,
                      child: Row(
                        children: [
                          Icon(Icons.shopping_basket_outlined),
                          smallWidthSpace,
                          Text('Infrastructure'),
                        ],
                      ),
                    ),
                    const PopupMenuItem(
                      value: 1,
                      child: Row(
                        children: [
                          Icon(Icons.layers),
                          smallWidthSpace,
                          Text('Without any layer'),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _showMenu(BuildContext context, Offset offset) async {
    await showMenu(
      context: context,
      position:
          RelativeRect.fromLTRB(offset.dx, offset.dy, offset.dx, offset.dy),
      items: [
        const PopupMenuItem(
          value: 1,
          child: Row(
            children: [
              Icon(Icons.verified_outlined),
              smallWidthSpace,
              Text('Cosy areas'),
            ],
          ),
        ),
        PopupMenuItem(
          value: 1,
          child: Row(
            children: [
              Icon(
                Icons.wallet,
                color: Theme.of(context).primaryColor,
              ),
              smallWidthSpace,
              Text(
                'Price',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ],
          ),
        ),
        const PopupMenuItem(
          value: 1,
          child: Row(
            children: [
              Icon(Icons.shopping_basket_outlined),
              smallWidthSpace,
              Text('Infrastructure'),
            ],
          ),
        ),
        const PopupMenuItem(
          value: 1,
          child: Row(
            children: [
              Icon(Icons.layers),
              smallWidthSpace,
              Text('Without any layer'),
            ],
          ),
        )
      ],
      elevation: 8.0,
    );
  }

  void _hideMenu() {
    _controller.reverse().then((_) {
      setState(() {
        _isMenuOpen = false;
      });
      _overlayEntry.remove();
    });
  }

  @override
  Widget build(BuildContext context) {
    // create a map screen
    return Scaffold(
      body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(mapImage),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              ScaleTransition(
                  scale: _scaleAnimation, child: const CustomAppBar()),
              ScaleTransition(
                  scale: _scaleAnimation, child: const AppartmentIcon()),
              Expanded(
                child: Stack(
                  children: [
                    Positioned(
                        bottom: 400,
                        right: 50,
                        child: ScaleTransition(
                            scale: _scaleAnimation, child: AppartmentIcon())),
                    Positioned(
                        bottom: 250,
                        left: 120,
                        child: ScaleTransition(
                            scale: _scaleAnimation, child: AppartmentIcon())),
                    Positioned(
                      bottom: 100,
                      left: 10,
                      child: Column(
                        children: [
                          ScaleTransition(
                            scale: _scaleAnimation,
                            child: Container(
                              padding: padding8,
                              decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.6),
                                borderRadius: borderRadius30,
                              ),
                              child: GestureDetector(
                                onTapDown: (TapDownDetails details) {
                                  if (!_isMenuOpen) {
                                    _showMenu(context, details.globalPosition);
                                  } else {
                                    _hideMenu();
                                  }
                                },
                                child: Icon(
                                  Icons.account_balance_sharp,
                                  color: Theme.of(context).secondaryHeaderColor,
                                  size: 30,
                                ),
                              ),
                            ),
                          ),
                          mediumHeightSpace,
                          ScaleTransition(
                            scale: _scaleAnimation,
                            child: Container(
                              padding: padding8,
                              decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.6),
                                borderRadius: borderRadius30,
                              ),
                              child: GestureDetector(
                                  child: Icon(Icons.navigation_outlined,
                                      color: Theme.of(context)
                                          .secondaryHeaderColor,
                                      size: 30),
                                  onTapDown: (TapDownDetails details) {
                                    if (!_isMenuOpen) {
                                      _showMenu(
                                          context, details.globalPosition);
                                    } else {
                                      _hideMenu();
                                    }
                                  }),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 100,
                      right: 10,
                      child: ScaleTransition(
                        scale: _scaleAnimation,
                        child: Container(
                          padding: padding8,
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.6),
                            borderRadius: borderRadius30,
                          ),
                          child: const Row(
                            children: [
                              Icon(Icons.format_align_left,
                                  color: Colors.white, size: 30),
                              mediumWidthSpace,
                              Text(
                                "List of variants",
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    const Positioned(
                      bottom: 10,
                      right: 0,
                      left: 0,
                      child: BottomBar(
                        isHomeActive: false,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}

class AppartmentIcon extends StatelessWidget {
  const AppartmentIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding16,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
          bottomRight: Radius.circular(16),
        ),
      ),
      child: Icon(
        Icons.apartment,
        color: Theme.of(context).secondaryHeaderColor,
        size: 30,
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      margin: margin32,
      width: MediaQuery.of(context).size.width * 0.8,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Padding(
              padding: padding8,
              child: Container(
                height: 70,
                width: double.infinity,
                padding: padding8,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: borderRadius30,
                ),
                child: const TextField(
                  decoration: InputDecoration(
                    hintText: 'Saint Petersburg',
                    hintStyle: TextStyle(color: Colors.black),
                    border: InputBorder.none,
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ),
          //const Spacer(),
          Padding(
            padding: padding8,
            child: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              padding: padding8,
              child: const Icon(
                Icons.settings,
                color: Colors.black,
                size: 35,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
