import 'package:coffeeshop_demo/dashboard.dart';
import 'package:coffeeshop_demo/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
void main(){
  runApp(const MyApp());
}

class SplashScreen extends StatefulWidget{
  static const String routeName = '/splash-screen';
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override

  void initState() {
    super.initState();
    Future.delayed(
      const Duration(
        milliseconds: 3000,
      ), () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Dashboard_Page()), 
        );
      }
    );
  }

  @override
 Widget build (BuildContext context) {
  return Scaffold(
    backgroundColor: Colors.white,
    body: Center(
      child: Animate(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/logosplash.png ',
                width: 200,
              )
            ],
          ),
        ).animate(). fade(duration: 2000.ms),
      ),
    ),
  );
 }
}