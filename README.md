# Flutter To-Do List Application

The Flutter To-Do List Application is a cross-platform mobile and web app designed to help users efficiently manage their daily tasks. This app reflects my journey as a developer, blending my interest in mobile app development, Flutter Dart, and cross-platform development. The app offers a simple and responsive interface, ensuring seamless usability across devices.

## Key Features

- Task creation, editing, and deletion
- Real-time updates with Flutter's state management
- Cross-platform support for web and mobile
- Easy-to-follow project structure with well-documented code

This project was born out of my desire to learn and implement Flutter for building scalable applications. Throughout the process, I sought assistance with code review, debugging, and creating a comprehensive README.md that helps others run and contribute to the app. The app represents not only a task manager but also my continuous growth and learning as a developer.

## Running the Flutter To-Do List App on Web (Laptop)

Running Flutter on another device can be a little complex, but here are some guides that will put you through the process:

### 1. Install Flutter SDK

- Download and install Flutter SDK from [Flutter's official website](https://flutter.dev).
- Add Flutter to your PATH environment variable.

### 2. Clone the Repository

```bash
git clone <your-repo-url>
cd <your-project-folder>
```

### 3. Install Dependencies

```bash
flutter pub get
```

### 4. Run The App on Web

```bash
flutter run -d chrome
```

## Debugging the Flutter To-Do List App on a Mobile Phone

Debugging on a phone can be hard sometimes, for example when your GradleTask is malfunctioning. Here are the steps to debug on a mobile phone:

### 1. Install Flutter SDK

Follow the same steps as above to install Flutter.

### 2. Enable Developer Mode on Your Phone

- Go to `Settings > About Phone > Build Number` and tap it 7 times to enable developer mode.
- Enable USB Debugging under Developer Options.

### 3. Connect Your Phone to the Laptop

- Use a USB cable to connect your phone to the laptop.
- Verify the device is detected with:

```bash
flutter devices
```

### 4. Run The App on Your Phone

```bash
flutter run -d <your-device-id>
```

You can get the device ID from the `flutter devices` command.

### 5. Hot Reload for Debugging

While the app is running, press `r` in the terminal for hot reload or `R` for a full restart.
---
## Screenshot of the ToDo List App

![image](https://github.com/user-attachments/assets/70936506-e9b3-4371-8913-679cf2812075)
