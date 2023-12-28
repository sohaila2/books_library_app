

import 'package:books_library_app/views/home_view.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});
  static const String id = 'SplashView';

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {


  @override
  void initState() {
    super.initState();

    Future.delayed(
        const Duration(seconds: 3),(){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeView()));
    });
  }
  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      backgroundColor: Color(0xff0047AB),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
        Text.rich(
        TextSpan(
            text: 'Bookwise\n',
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 53,
              color: Colors.white, // Specify the color for "Bookwise"
            ),
            children: <TextSpan>[
              TextSpan(
                text: 'Your smart\nlibrary on\nyour\npocket',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 28,
                  color: Colors.white,
                ),
              ),
            ]
        ),
      ),
          ],
        ),
      ),
    );
  }
}

