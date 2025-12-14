# Project Blueprint

## Overview

This document outlines the architecture, features, and design of a Flutter application integrated with Firebase. The goal is to create a multi-platform application that shares a backend with an existing Next.js web application, featuring a modern design, robust navigation, and core Firebase services.

## Implemented Features

### Version 1.0

*   **Project Setup:**
    *   Initialized a new Flutter project.
    *   Configured the project for both Android and Web platforms.
*   **Firebase Integration:**
    *   Connected the Flutter application to the `connectonic-live` Firebase project.
    *   Added `firebase_core` dependency.
    *   Initialized Firebase in `lib/main.dart`.
    *   Generated `firebase_options.dart` for both Android and Web.
*   **Version Control:**
    *   Set up a Git repository and pushed the initial project to GitHub.
*   **Core Dependencies:**
    *   Installed `provider` for state management.
    *   Installed `google_fonts` for custom typography.
    *   Installed `go_router` for declarative navigation.
    *   Installed `firebase_auth` for authentication.
*   **Theming:**
    *   Implemented a Material 3 theme using `ColorScheme.fromSeed` and `google_fonts`.
    *   Created a `ThemeProvider` to manage light and dark modes.
    *   The app now supports system theme, light mode, and dark mode.
*   **Navigation:**
    *   Set up a declarative routing system with `go_router`.
    *   Implemented a persistent bottom navigation bar using `ShellRoute`.
    *   Created three placeholder screens: Home, Data, and Profile.
*   **Authentication:**
    *   Created an `AuthService` to handle Firebase Authentication logic.
    *   Implemented anonymous sign-in and sign-out functionality.
    *   The Profile screen now displays the user's authentication status and provides sign-in/sign-out controls.

## Current Plan: Firestore Integration and UI Polish

1.  **Firestore Integration:**
    *   Create a "Data" screen that subscribes to a Firestore collection in real-time.
    *   Display the Firestore data in a styled list format.
2.  **Home Screen:**
    *   Design a visually appealing, modern home screen to serve as the main landing page.
