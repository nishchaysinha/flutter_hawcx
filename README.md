# flutter_hawcx

![Demo Video](media/demo.mp4)

Click on the link ^ to view a demo

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


## Developer Experience

	•	Straightforward Integration with Hawcx, but Platform-Specific Challenges: Integrating Hawcx with Flutter was relatively smooth, even for a developer new to app development. However, the use of .aar packages presented some challenges, as they don’t align with Flutter’s cross-platform capabilities and require platform-specific implementations due to the lack of cross-compilation for iOS (I might have faced these issues due to my inadequate knowledge in app development).
	•	Inaccurate Documentation and File Path Confusion: The documentation’s suggestion to place HawcxModule.kt in android/app/src/main/java/com/hawcxapp/ was inconsistent with the example/template projects, where the file is located in the kotlin directory. This discrepancy can lead to confusion, especially for beginners, and would benefit from clarification to accurately reflect the expected directory structure (I might have faced these issues due to my inadequate knowledge in app development).
	•	Sign-Up Endpoint Works Smoothly, but Sign-In Endpoint Lacks Clarity: While the sign-up endpoint worked perfectly, the signin endpoint (specifically verifyCipher) consistently returned a “please give correct input” response. Due to limited documentation, it was difficult to determine the exact cause of this issue. A Postman repository with example requests and responses for each endpoint would be very helpful here to clarify required parameters and expected formats.

Other than these challenges, my experience was a positive one overall. Hope to hear back soon!