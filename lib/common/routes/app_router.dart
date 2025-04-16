import 'package:flutter/cupertino.dart';
import 'package:frontend/features/features.dart';
import 'package:frontend/common/common.dart';
import 'package:go_router/go_router.dart';

final GoRouter appRouter = GoRouter(
    initialLocation: "/splash",
    routes: [
      GoRoute(
        path: '/splash',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: '/home',
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const HomeScreen(),
          transitionDuration: const Duration(milliseconds: 800),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        ),
      ),
      GoRoute(
        path: '/gallery',
        builder: (context, state) => const GalleryScreen(),
      )
    ]
);