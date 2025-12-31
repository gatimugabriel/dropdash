import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../core/widgets/bottom_nav_bar.dart';
import '../features/auth/presentation/forgot_password_screen.dart';
import '../features/auth/presentation/login_screen.dart';
import '../features/auth/presentation/onboarding_screen.dart';
import '../features/auth/presentation/reset_password_screen.dart';
import '../features/auth/presentation/signup_screen.dart';
import '../features/cart/presentation/cart_screen.dart';
import '../features/home/home_screen.dart';
import '../features/orders/presentation/checkout_screen.dart';
import '../features/products/presentation/product_detail_screen.dart';
import '../features/profile/settings_screen.dart';

final supabase = Supabase.instance.client;

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/onboarding',
      builder: (context, state) => const OnboardingScreen(),
    ),
    GoRoute(path: '/login', builder: (context, state) => const LoginScreen()),
    GoRoute(path: '/signup', builder: (context, state) => const SignUpScreen()),
    GoRoute(
      path: '/forgot-password',
      builder: (context, state) => const ForgotPasswordScreen(),
    ),
    GoRoute(
      path: '/reset-password',
      builder: (context, state) => const ResetPasswordScreen(),
    ),
    // Product detail screen (outside shell route for full screen)
    GoRoute(
      path: '/product/:id',
      builder: (context, state) {
        final productId = state.pathParameters['id']!;
        return ProductDetailScreen(productId: productId);
      },
    ),
    // Cart screen (outside shell route for full screen)
    GoRoute(path: '/cart', builder: (context, state) => const CartScreen()),
    // Checkout screen (outside shell route for full screen)
    GoRoute(
      path: '/checkout',
      builder: (context, state) => const CheckoutScreen(),
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
        GoRoute(path: '/', builder: (context, state) => const HomeScreen()),
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
    final authPaths = [
      '/login',
      '/signup',
      '/onboarding',
      '/forgot-password',
      '/reset-password',
    ];
    final onAuthScreens = authPaths.contains(state.matchedLocation);

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
  if (location == '/') {
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
