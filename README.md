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

## 📱 Screenshots

🎨 Full UI design available on Figma
https://www.figma.com/design/xQqC79GT8hoJ2NFKGaBiRM/Online-exam--Copy-?node-id=23-4924&t=vImSgSthCWOAUKUJ-0
<h3>🔍 Online Exam</h3>

<table>

<tr>
<td><img width="1125" height="2436" alt="Login" src="https://github.com/user-attachments/assets/c1196f26-ec95-4f0a-bc59-8d57b20c0668" /></td>
<td><img width="1125" height="2436" alt="Login (Email error)" src="https://github.com/user-attachments/assets/14d5c905-cf29-4ac9-8e6f-f28bbdb18336" /></td>
<td><img width="1125" height="2436" alt="Login (1)" src="https://github.com/user-attachments/assets/99ef4d1e-d274-4484-aa6a-980d1220a835" /></td>
</tr>
</table>

<table>

<tr>
<td><img width="1125" height="2436" alt="Sign up" src="https://github.com/user-attachments/assets/79870b02-33f4-4c84-817c-16f8bebc3bff" /></td>
<td><img width="1125" height="2436" alt="Sign up (Email error)" src="https://github.com/user-attachments/assets/79e83840-b7c5-4f41-8e20-54e0e961ce78" /></td>
<td><img width="1125" height="2436" alt="Sign up (Username error) (1)" src="https://github.com/user-attachments/assets/cfa9cca6-cbab-4def-8142-9fa81a46e201" /></td>
<td><img width="1125" height="2436" alt="Sign up (Username error)" src="https://github.com/user-attachments/assets/9358f667-8f84-4a4b-995f-a3d890b21347" /></td>

</tr>
</table>

<table>

<tr>
<td><img width="1125" height="2436" alt="Reset password" src="https://github.com/user-attachments/assets/fa4f8ae5-953a-4961-8535-d60277e21abc" /></td>
<td><img width="1125" height="2436" alt="Profile" src="https://github.com/user-attachments/assets/8170e6f0-d0f2-455b-8903-03769fb2a296" /></td>

</tr>
</table>

<table>
<tr>


<td><img width="1125" height="2436" alt="Forget password (Email error)" src="https://github.com/user-attachments/assets/38f131e3-a07e-4cda-a6b9-68c17b8745bd" /></td>
<td><img width="1125" height="2436" alt="Forget password" src="https://github.com/user-attachments/assets/b140d097-44b8-46ed-9e3b-69a575873dce" /></td>
<td><img width="1125" height="2436" alt="Verification code error (1)" src="https://github.com/user-attachments/assets/637fcb85-f102-45e3-bb16-c7d7db887953" /></td>
<td><img width="1125" height="2436" alt="Verification code error" src="https://github.com/user-attachments/assets/a7ef7e01-b0ae-47bd-9fc2-0278b80e2af7" /></td>
<td><img width="1125" height="2436" alt="Verification code" src="https://github.com/user-attachments/assets/eaca19df-aab3-455b-b0f3-9e2d63117613" /></td>
</tr>
</table>


<table>
<tr>
<td><img width="1125" height="2436" alt="Start exam" src="https://github.com/user-attachments/assets/5e930010-9f7a-4eac-9092-60da5f9e732f" /></td>
<td><img width="1125" height="2436" alt="Explore (1)" src="https://github.com/user-attachments/assets/6c5ddd94-28d3-452e-a066-b7d907591abb" /></td>
<td><img width="1125" height="2436" alt="Explore" src="https://github.com/user-attachments/assets/18a44f77-72f0-447f-9fa6-2f89adaa3e57" /></td>
</tr>
</table>

<table>
<tr>
<td><img width="1125" height="2436" alt="Exam 1" src="https://github.com/user-attachments/assets/383bbb9a-6508-4a35-8c42-990524978320" /></td>
<td><img width="1125" height="2436" alt="Exam 4" src="https://github.com/user-attachments/assets/6f13a6fa-deef-4709-81e7-84c0c56a5a5e" /></td>
<td><img width="1125" height="2436" alt="Time out" src="https://github.com/user-attachments/assets/9eedaa22-adab-45a8-a702-752df9e0be0d" /></td>
<td><img width="1125" height="2436" alt="Score" src="https://github.com/user-attachments/assets/3792b6fb-07bd-40ed-ba45-bc18938bd3f8" /></td>	
</tr>
</table>

<table>
<tr>
<td><img width="1125" height="2436" alt="Results" src="https://github.com/user-attachments/assets/9ba27718-317f-455d-bbf2-9d650eabe716" /></td>
<td><img width="1125" height="5982" alt="Answers" src="https://github.com/user-attachments/assets/b568be2c-ca7d-4874-9b56-bd28f0b3e1f6" /></td>
</tr>
</table>


<table>
<tr>
<td><img width="1125" height="2436" alt="Profile" src="https://github.com/user-attachments/assets/124a14cb-b0eb-46c6-a7b8-0fb5fd2d0d56" /></td>
<td><img width="1125" height="2436" alt="Reset password" src="https://github.com/user-attachments/assets/10d28d50-a97e-4c8c-85c9-04c01b73e655" /></td>
</tr>
</table>



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
  </tr>
</table>

<br/>

[![PRs Welcome](https://img.shields.io/badge/PRs-Welcome!-brightgreen?style=for-the-badge)](https://github.com/mohamedali015/Online-Exam/pulls)

Want to contribute? Fork the repo, create a feature branch, and open a PR! 🌱




</div>
 
---
