# Github Users App

A client app that allows you to view GitHub users.

## Getting Started

These instructions will help you set up and run the Flutter project on your local machine.

### Prerequisites

Before starting, ensure you have met the following requirements:

- [Flutter SDK](https://flutter.dev/docs/get-started/install) (version 3.0.0 or higher)
- [Dart SDK](https://dart.dev/get-dart) (included with Flutter)
- An IDE or text editor with Flutter and Dart plugins (e.g., [Android Studio](https://developer.android.com/studio), [VS Code](https://code.visualstudio.com/))

### Installation

1. Clone the repository:

   ```bash
   git clone https://github.com/jpmehedi/github_users_app.git
   ```

2. Navigate to the project directory:

   ```bash
   cd github_users_app
   ```

3. Install the dependencies:

   ```bash
   flutter pub get
   ```

### Running the Project

1. Ensure a device is connected or an emulator is running:

   - Check the connected devices with:
   
     ```bash
     flutter devices
     ```

2. Run the application:

   ```bash
   flutter run
   ```

### Build for Production

To build the app for production (release mode), use the following command:

- For Android:

  ```bash
  flutter build apk --release
  ```

- For iOS:

  ```bash
  flutter build ios --release
  ```

For more build options and detailed instructions, refer to the [Flutter build documentation](https://flutter.dev/docs/deployment).

## Folder Structure

Here’s an overview of the folder structure in the project:

```
your-repo-name/
├── lib/                      # Main source code folder
│   ├── main.dart             # Entry point of the application
│   ├── model/                # Data models
│   ├── view/                 # UI screens
│   ├── controller/           # Business logic and API services
│   ├── utilities/            # Global, Keys, Api Endpint, etc.
│   ├── router/               #Router setting.
│   └── theme/                # Theme services
├── test/                     # Unit and widget tests
├── assets/                   # Assets such as images, fonts, etc.
└── pubspec.yaml              # Project configuration file
```

## Troubleshooting

If you encounter issues while running the project, consider the following steps:

- Check Flutter and Dart Versions: Ensure you are using compatible versions of Flutter and Dart.
- Update Flutter: Run `flutter upgrade` to update to the latest version.
- Clear Cache: Try running `flutter clean` followed by `flutter pub get`.
- Check Connected Devices: Ensure a device is connected and recognized by Flutter.

For more troubleshooting tips, refer to the [Flutter documentation](https://flutter.dev/docs/get-started/install/troubleshooting).



