
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../screens/onboarding_screen.dart';
import '../screens/login_screen.dart';
import '../screens/signup_screen.dart';
import '../screens/home_screen.dart';
// import '../screens/profile_screen.dart';
import '../screens/settings_screen.dart';
import '../widgets/bottom_nav_bar.dart';

final supabase = Supabase.instance.client;

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/onboarding',
      builder: (context, state) => const OnboardingScreen(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/signup',
      builder: (context, state) => const SignUpScreen(),
    ),
    ShellRoute(
      builder: (context, state, child) {
        return Scaffold(
          body: child,
          bottomNavigationBar: BottomNavBar(
            currentIndex: _calculateSelectedIndex(context),
          ),
        );
      },
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const HomeScreen(),
        ),
        // GoRoute(
        //   path: '/profile',
        //   builder: (context, state) => const ProfileScreen(),
        // ),
        GoRoute(
          path: '/settings',
          builder: (context, state) => const SettingsScreen(),
        ),
      ],
    ),
  ],
  redirect: (context, state) {
    final session = supabase.auth.currentSession;
    final onAuthScreens =
        state.matchedLocation == '/login' || state.matchedLocation == '/signup' || state.matchedLocation == '/onboarding';

    if (session == null && !onAuthScreens) {
      return '/onboarding';
    }

    if (session != null && onAuthScreens) {
      return '/';
    }

    return null;
  },
);

int _calculateSelectedIndex(BuildContext context) {
  final String location = GoRouterState.of(context).matchedLocation;
  if (location.startsWith('/')) {
    return 0;
  }
  if (location.startsWith('/profile')) {
    return 1;
  }
  if (location.startsWith('/settings')) {
    return 2;
  }
  return 0;
}
