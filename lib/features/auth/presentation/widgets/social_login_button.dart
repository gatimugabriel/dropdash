import 'package:flutter/material.dart';

enum SocialProvider { google, facebook, apple }

/// A social login button with provider-specific styling.
class SocialLoginButton extends StatelessWidget {
  final SocialProvider provider;
  final VoidCallback? onPressed;
  final bool isLoading;

  const SocialLoginButton({
    super.key,
    required this.provider,
    this.onPressed,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return SizedBox(
      height: 56,
      child: OutlinedButton(
        onPressed: isLoading ? null : onPressed,
        style: OutlinedButton.styleFrom(
          backgroundColor: _getBackgroundColor(colorScheme),
          foregroundColor: _getForegroundColor(colorScheme),
          side: BorderSide(
            color: colorScheme.outline.withValues(alpha: 0.3),
            width: 1,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24),
        ),
        child: isLoading
            ? SizedBox(
                height: 24,
                width: 24,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: _getForegroundColor(colorScheme),
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildIcon(),
                  const SizedBox(width: 12),
                  Text(
                    _getLabel(),
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  Widget _buildIcon() {
    switch (provider) {
      case SocialProvider.google:
        return Image.asset(
          'assets/images/google_icon.png',
          width: 24,
          height: 24,
          errorBuilder: (context, error, stackTrace) =>
              const Icon(Icons.g_mobiledata, size: 28),
        );
      case SocialProvider.facebook:
        return Image.asset(
          'assets/images/facebook_icon.png',
          width: 24,
          height: 24,
          errorBuilder: (context, error, stackTrace) =>
              const Icon(Icons.facebook, size: 24, color: Color(0xFF1877F2)),
        );
      case SocialProvider.apple:
        return Image.asset(
          'assets/images/apple_icon.png',
          width: 24,
          height: 24,
          errorBuilder: (context, error, stackTrace) =>
              const Icon(Icons.apple, size: 24),
        );
    }
  }

  String _getLabel() {
    switch (provider) {
      case SocialProvider.google:
        return 'Continue with Google';
      case SocialProvider.facebook:
        return 'Continue with Facebook';
      case SocialProvider.apple:
        return 'Continue with Apple';
    }
  }

  Color _getBackgroundColor(ColorScheme colorScheme) {
    switch (provider) {
      case SocialProvider.google:
        return colorScheme.surface;
      case SocialProvider.facebook:
        return colorScheme.surface;
      case SocialProvider.apple:
        return colorScheme.surface;
    }
  }

  Color _getForegroundColor(ColorScheme colorScheme) {
    return colorScheme.onSurface;
  }
}

/// A row of social login buttons.
class SocialLoginButtons extends StatelessWidget {
  final VoidCallback? onGooglePressed;
  final VoidCallback? onFacebookPressed;
  final VoidCallback? onApplePressed;
  final bool isLoading;

  const SocialLoginButtons({
    super.key,
    this.onGooglePressed,
    this.onFacebookPressed,
    this.onApplePressed,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SocialLoginButton(
          provider: SocialProvider.google,
          onPressed: onGooglePressed,
          isLoading: isLoading,
        ),
        const SizedBox(height: 12),
        SocialLoginButton(
          provider: SocialProvider.facebook,
          onPressed: onFacebookPressed,
          isLoading: isLoading,
        ),
        const SizedBox(height: 12),
        SocialLoginButton(
          provider: SocialProvider.apple,
          onPressed: onApplePressed,
          isLoading: isLoading,
        ),
      ],
    );
  }
}
