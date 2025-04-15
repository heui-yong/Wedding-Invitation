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
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: '/gallery',
        builder: (context, state) => const GalleryScreen(),
      )
    ]
);