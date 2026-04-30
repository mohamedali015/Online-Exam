# Online Exam

Online Exam is a Flutter application for managing online quizzes and exams. It lets users sign in or
register, browse subjects, open exams, answer timed questions, and review scores and detailed
results after submission.

## Overview

The app uses a clean layered architecture that separates presentation, state management, domain, and
data. On launch, the app starts with a splash screen, checks the locally stored user session, and
then routes the user either to the login screen or to the home screen if the session is still valid.

## Key Features

- Sign in and create a new account.
- Reset password through email, OTP verification, and a new password flow.
- Browse subjects and search within them.
- View exams attached to each subject.
- Take an exam with a timer and question progress.
- Finish an exam and view the score and breakdown.
- Review previous exam results from the results page.
- Manage profile information and change password.
- Handle sessions securely and remove the token when it expires.

## Tech Stack

- Flutter / Dart
- `flutter_bloc` for state management
- `get_it` and `injectable` for dependency injection
- `dio` and `retrofit` for API communication
- `hive_ce` and `flutter_secure_storage` for local and secure storage
- `flutter_screenutil` for responsive design
- `google_fonts` for the Inter font
- `flutter_svg` and `cached_network_image` for assets and remote images
- `pretty_dio_logger` for debugging network calls during development

## App Flow

1. The app starts on the Splash screen.
2. It checks whether a token exists and whether remember me is enabled.
3. If the session is valid, user data is loaded and the app navigates to the home screen.
4. If the session is not valid, the app navigates to the login screen.
5. From the home screen, the user can browse subjects, open exams, complete them, and review
   results.

## Project Structure

```text
lib/
	main.dart
	config/
		di/
		local_storage/
		module/
		route_manager/
		user/
	core/
		helpers/
		shared_widgets/
		theme/
		utils/
		values/
	features/
		auth/
		exam/
		exams/
		forget_password/
		home/
		profile/
		results/
		splash/
```

- `config`: global configuration such as dependency injection, routing, and storage.
- `core`: shared widgets, helpers, theme, utilities, and constants.
- `features`: the main app features, each following its own layered structure.

## Architecture Highlights

- Centralized routing through `RouteGenerator` and `Routes`.
- `BlocProvider` and `BlocListener` are used to connect UI and state.
- Session expiration is handled consistently through `UserCubit` and a global listener.
- Remote data sources are separated from repositories and use cases.
- Local storage is used for exam results, while secure storage holds sensitive session data.

## Local Setup

### Requirements

- A Flutter SDK compatible with the project.
- The Dart SDK version specified in `pubspec.yaml`.
- Android Studio or VS Code with Flutter configured.

### Install Dependencies

```bash
flutter pub get
```

### Generate Required Files

The project uses code generation for packages such as `injectable`, `retrofit`, `json_serializable`,
and `hive_ce_generator`.

```bash
dart run build_runner build --delete-conflicting-outputs
```

### Run the App

```bash
flutter run
```

### Quality Checks

```bash
flutter analyze
flutter test
```

## Assets

Assets are stored in:

- `assets/svg/`
- `assets/png/`

They include the app logo, bottom navigation icons, and illustrations for empty states and
exam-related screens.

## Notes

- UI text is centralized in `AppStrings`.
- Navigation is controlled through `Routes` and `RouteGenerator`.
- When an invalid token is detected, it is removed automatically and the session-expired flow is
  triggered.

## Project Status

This is not a starter template. It is a full exam application with authentication, subjects, exams,
results, and password reset flows already implemented.

## 👥 Contributors

<div align="center">

A huge thank you to every developer who has poured their effort into this project! 🙏


<br/>

<table>
  <tr>
    <td align="center">
      <a href="https://github.com/mohamedmousa2003">
        <img src="https://github.com/mohamedmousa2003.png" width="90" style="border-radius:50%"/><br/>
        <sub><b>Mohamed Moussa</b></sub>
      </a>
      <br/>
      <sub>🏆 Flutter Developer </sub>
      <br/>
      <br/>
    </td>
    <td align="center">
      <a href="https://github.com/mohamedali015">
        <img src="https://github.com/mohamedali015.png" width="90" style="border-radius:50%"/><br/>
        <sub><b>Mohamed Ali</b></sub>
      </a>
      <br/>
          <sub>🏆 Flutter Developer </sub>
      <br/>
      <br/>
    </td>
    <td align="center">
      <a href="https://github.com/Sarahelkholy">
        <img src="https://github.com/Sarahelkholy.png" width="90" style="border-radius:50%"/><br/>
        <sub><b>Sarah Elkholy</b></sub>
      </a>
      <br/>
          <sub>🏆 Flutter Developer </sub>
      <br/>
      <br/>

    </td>

  </tr>
</table>

<br/>

[![PRs Welcome](https://img.shields.io/badge/PRs-Welcome!-brightgreen?style=for-the-badge)](https://github.com/mohamedali015/Online-Exam/pulls)

Want to contribute? Fork the repo, create a feature branch, and open a PR! 🌱




</div>
 
---
