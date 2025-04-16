import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/common/common.dart';
import 'package:go_router/go_router.dart';
import 'package:frontend/features/home/screens/home_screen.dart';
import 'package:typewritertext/typewritertext.dart';
import 'dart:ui';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();

    _initializeApp();
  }

  Future<void> _initializeApp() async {
    try {
      await Future.delayed(const Duration(milliseconds: 3500));

      if (mounted) {
        context.go('/home');
      }
    } catch (error) {
      throw Exception('Error during initialization: $error');
    }
  }


  @override
  void dispose() {
    super.dispose();
  }

  void _clickScreen() {
    context.go('/home');
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const HomeScreen(),
        Scaffold(
          backgroundColor: AppColor.color_transparent,
          body: ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      AppColor.color_FBC2EB.withOpacity(0.3),
                      AppColor.color_A6C1EE.withOpacity(0.3),
                    ],
                  ),
                ),
                child: InkWell(
                  splashColor: AppColor.color_transparent,
                  highlightColor: AppColor.color_transparent,
                  focusColor: AppColor.color_transparent,
                  hoverColor: AppColor.color_transparent,
                  onTap: _clickScreen,
                  child: SafeArea(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  AppImagePath.splashIconPath,
                                  width: 70,
                                  height: 70,
                                ),
                                const SizedBox(
                                  height: 14,
                                ),
                                SizedBox(
                                  width: double.infinity,
                                  child: TypeWriter.text(
                                    AppString.splashTitle,
                                    duration: const Duration(milliseconds: 150),
                                    softWrap: false,
                                    alignment: Alignment.center,
                                    style: const TextStyle(
                                        fontSize: 24,
                                        color: AppColor.color_000000,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(bottom: 20),
                          child: Column(
                            children: [
                              Text(
                                AppString.marryDate,
                                style: TextStyle(
                                    fontSize: 16,
                                    color: AppColor.color_000000,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                AppString.marryPlace,
                                style: TextStyle(
                                    fontSize: 16,
                                    color: AppColor.color_000000,
                                    fontWeight: FontWeight.w500),
                              )
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
        ),
      ],
    );
  }
}
