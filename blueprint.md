# Project Blueprint

## Overview

This document outlines the structure, features, and development plan for the Flutter application. The app uses Supabase for authentication and `go_router` for navigation.

## Features

- **Onboarding:** A three-page onboarding flow to introduce users to the app.
- **Authentication:** User authentication (login and sign-up) using Supabase.
- **Navigation:** Routing handled by `go_router` with authentication-based redirects.
- **Profile Screen:** Displays user information (email) and allows password updates and logout.
- **Settings Screen:** Allows users to toggle between light, dark, and system theme.
- **Bottom Navigation:** A bottom navigation bar for easy access to the main screens.
- **Home Screen:** Displays a list of items from a Supabase table and allows adding new items.

## Project Structure

```
lib/
├── providers/
│   └── theme_provider.dart
├── screens/
│   ├── onboarding_screen.dart
│   ├── login_screen.dart
│   ├── signup_screen.dart
│   ├── home_screen.dart
│   ├── profile_screen.dart
│   └── settings_screen.dart
├── utils/
│   └── router.dart
├── widgets/
│   ├── add_item_dialog.dart
│   ├── bottom_nav_bar.dart
│   └── update_password_dialog.dart
├── main.dart
└── supabase_options.dart
```

## Current Plan

- The application is now feature-complete based on the initial requirements.
- Future work could include adding more features, such as editing and deleting items, and improving the UI/UX.
