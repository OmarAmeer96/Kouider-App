# Kouider App 🚀

A comprehensive Flutter project designed to demonstrate advanced skills in Flutter development, state management, dependency injection, Firebase integration, and CI/CD workflows. Built as part of a hiring process, this project showcases professional-grade practices for scalable and maintainable mobile app development.

---

## Overview 🌟

Kouider App is a modern Flutter application designed with a focus on:

- **Responsive Design**
- **Robust State Management**
- **Firebase Integration**
- **Automated CI/CD Workflows**

---

## Table of Contents 📚

- [Kouider App 🚀](#kouider-app)
  - [Overview 🌟](#overview-)
  - [Table of Contents 📚](#table-of-contents-)
  - [Getting Started 🛠️](#getting-started-️)
    - [Prerequisites ✅](#prerequisites-)
    - [Installation 📥](#installation-)
  - [Project Features ✨](#project-features-)
  - [Tech Stack and Dependencies 🔧](#tech-stack-and-dependencies-)
  - [Folder Structure 📂](#folder-structure-)
  - [Firebase Integration 🔥](#firebase-integration-)
  - [CI/CD Workflow 🔄](#cicd-workflow-)
    - [GitHub Actions Workflow Example](#github-actions-workflow-example)
  - [Screenshots 📸](#screenshots-)

---

## Getting Started 🛠️

### Prerequisites ✅

Ensure the following are installed on your machine:

- **Flutter SDK** (version 3.6.0 or higher)
- **Dart SDK**
- **Android Studio** or **Visual Studio Code**
- **Firebase Account**

### Installation 📥

1. Clone the repository:

   ```bash
   git clone https://github.com/yourusername/kouider_app.git
   cd kouider_app
   ```

2. Install dependencies:

   ```bash
   flutter pub get
   ```

3. Set up Firebase:

   - Add `google-services.json` for Android in the `android/app/` directory.
   - Add `GoogleService-Info.plist` for iOS in the `ios/Runner/` directory.

4. Run the app:
   ```bash
   flutter run
   ```

---

## Project Features ✨

- **Responsive Design**: Works seamlessly across multiple screen sizes and orientations.
- **State Management**: Built with `flutter_bloc` for efficient and scalable state handling.
- **Dependency Injection**: Powered by `get_it` for service location.
- **Networking**: Utilizes `dio` and `retrofit` for API interaction.
- **Local Storage**: Persistent data storage with `shared_preferences`.
- **Secure Storage**: Secure sensitive data with `flutter_secure_storage`.
- **Error Tracking**: Integrated with `sentry_flutter` for monitoring.
- **Firebase Integration**: Backend support with Firebase services.
- **CI/CD Workflows**: Automated testing, building, and deployment using GitHub Actions and Fastlane.

---

## Tech Stack and Dependencies 🔧

Key dependencies include:

- `flutter_bloc`
- `get_it`
- `dio`, `retrofit`, `pretty_dio_logger`
- `shared_preferences`, `flutter_secure_storage`
- `flutter_screenutil`, `flutter_svg`
- `sentry_flutter`
- `firebase_core`

Full details available in `pubspec.yaml`.

---

## Folder Structure 📂

```
lib/
├── core/                # Core application logic
├── features/            # Feature-specific modules
├── generated/           # Generated localization files
├── l10n/                # Localization resources
├── firebase_options.dart  # Firebase configuration
├── main_production.dart  # Entry point for production
├── main_development.dart # Entry point for development
├── kouider_app.dart      # Main app setup and configuration
```

---

## Firebase Integration 🔥

- **Authentication**
- **Firestore Database**
- **Cloud Messaging**
- **App Distribution**

Setup Firebase using `flutterfire configure` and add required files for Android and iOS.

---

## CI/CD Workflow 🔄

Automated processes include:

- **Building APKs**
- **Testing**
- **Deployment to Firebase App Distribution**

### GitHub Actions Workflow Example

```yaml
name: Android Fastlane with Firebase App Distribution Workflow

on:
  push:
    branches:
      - main

jobs:
  distribute_to_firebase:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout my repo code
        uses: actions/checkout@v2

      - name: Set up JDK 17
        uses: actions/setup-java@v2
        with:
          java-version: "17"
          distribution: "temurin"

      - name: Install Flutter
        uses: subosito/flutter-action@v2
        with:
          channel: stable

      - name: Setup Ruby
        uses: ruby/setup-ruby@v1
        with:
          ruby-version: "3.3.4"
          bundler-cache: true
          working-directory: android

      - name: Build and Distribute App
        env:
          APP_ID: ${{ secrets.APP_ID }}
          FIREBASE_CLI_TOKEN: ${{ secrets.FIREBASE_CLI_TOKEN }}
          FIREBASE_OPTIONS_ANDROID_API_KEY: ${{ secrets.FIREBASE_OPTIONS_ANDROID_API_KEY }}
          FIREBASE_OPTIONS_ANDROID_APP_ID: ${{ secrets.FIREBASE_OPTIONS_ANDROID_APP_ID }}
          FIREBASE_OPTIONS_IOS_API_KEY: ${{ secrets.FIREBASE_OPTIONS_IOS_API_KEY }}
          FIREBASE_OPTIONS_IOS_APP_ID: ${{ secrets.FIREBASE_OPTIONS_IOS_APP_ID }}
        run: |
          bundle exec fastlane android firebase_distribution
        working-directory: android
```

---

## Screenshots 📸

| App Demo                          | Splash Screen                           | Home Screen                             |
| ------------------------------------ | -------------------------------------- | ------------------------------------------ |
| ![Demo](assets/screenshots/home.png) | ![Splash](assets/screenshots/login.png) | ![Home](assets/screenshots/profile.png) |
