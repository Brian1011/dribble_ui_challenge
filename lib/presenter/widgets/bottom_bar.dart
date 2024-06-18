import 'package:drible_real_estate_ui/core/core.dart';
import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  final bool isHomeActive;
  const BottomBar({super.key, required this.isHomeActive});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65.0,
      padding: padding4,
      margin: margin8,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.8),
        borderRadius: BorderRadius.circular(40.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          MenuIcon(
              icon: Icons.search,
              isPrimary: isHomeActive ? false : true,
              onPressed: () {
                Navigator.of(context).pushNamed('/search');
              }),
          MenuIcon(icon: Icons.message, isPrimary: false, onPressed: () {}),
          MenuIcon(
              icon: Icons.home,
              isPrimary: isHomeActive ? true : false,
              onPressed: () {
                Navigator.of(context).pushReplacementNamed('/');
              }),
          MenuIcon(icon: Icons.favorite, isPrimary: false, onPressed: () {}),
          MenuIcon(icon: Icons.person, isPrimary: false, onPressed: () {}),
        ],
      ),
    );
  }
}

class MenuIcon extends StatelessWidget {
  final IconData icon;
  final bool isPrimary;
  final Function() onPressed;

  const MenuIcon(
      {super.key,
      required this.icon,
      required this.isPrimary,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPressed();
      },
      child: AbsorbPointer(
        child: Container(
          margin: margin8,
          width: isPrimary ? 60 : 50,
          height: isPrimary ? 60 : 50,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isPrimary ? Colors.orange : Colors.black.withOpacity(0.8),
          ),
          child: Center(
            child: IconButton(
              icon: Icon(
                icon,
                color: Colors.white,
              ),
              onPressed: () {
                // Handle icon press
              },
            ),
          ),
        ),
      ),
    );
  }
}
