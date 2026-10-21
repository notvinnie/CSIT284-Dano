import 'package:flutter/material.dart';

class HomeButton extends StatelessWidget {
  const HomeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: null,
      backgroundColor: Colors.white,
      elevation: 2,
      onPressed: () {
        Navigator.popUntil(context, (route) => route.isFirst);
      },
      child: Image.asset(
        'assets/images/home.png',
        width: 28,
        height: 28,
      ),
    );
  }
}