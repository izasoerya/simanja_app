import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Welcome to the app!',
              style: TextStyle(fontFamily: 'Gilroy', fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}
