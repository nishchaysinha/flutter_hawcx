# flutter_hawcx

![Demo Video](media/demo.mp4)

A new Flutter project.

## Overview

`flutter_hawcx` is a starting point for a Flutter application. This project is set up with essential configurations and dependencies to kickstart Flutter development with ease.

## Getting Started

### Prerequisites

- [Flutter SDK](https://flutter.dev/docs/get-started/install) - Make sure you have the Flutter SDK installed.
- An IDE like [VS Code](https://code.visualstudio.com/) or [Android Studio](https://developer.android.com/studio) configured for Flutter development.

### Installation

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/nishchaysinha/flutter_hawcx.git
   cd flutter_hawcx
   ```

2. **Install Dependencies**:
   Run the following command to install the required dependencies.
   ```bash
   flutter pub get
   ```

3. **Run the App**:
   To start the app on an emulator or connected device, use:
   ```bash
   flutter run
   ```

## Features

- **Local Authentication**: Integrates with biometrics for secure user login.
- **Email Validation**: Built-in email validation for user input.
- **URL Launcher**: Enables launching URLs from within the app.
- **Material Design**: Uses Flutter’s Material Design for consistent UI across platforms.

## Project Structure

- `lib/` - Main source code for the Flutter application.
- `android/` and `ios/` - Platform-specific code.
- `assets/` - Contains image and media assets like icons.
- `pubspec.yaml` - Configuration file for dependencies and assets.

## Customizing the App Icon

To customize the app icon, make sure you have an icon image in `assets/icon/` and follow these steps:

1. Edit the `pubspec.yaml` to set the path to your icon:
   ```yaml
   flutter_icons:
     android: true
     ios: true
     image_path: "assets/icon/icon.png"
   ```
   
2. Run the command to generate the icons:
   ```bash
   flutter pub run flutter_launcher_icons:main
   ```

## Developer Experience

*(To be filled in)*
