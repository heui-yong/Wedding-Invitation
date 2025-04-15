import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initializeApp();
  }

  Future<void> _initializeApp() async {
    try {
      await Future.wait([
        Future.delayed(const Duration(seconds: 2))
      ]);

      if (mounted) {
        context.go('/home');
      }
    } catch (error) {
      throw Exception('Error during initialization: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Center(
          child: Text("Splash Screen"),
        )
    );
  }
}
