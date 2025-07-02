A command-line Dart application that fetches user data from an API and lets users explore it through a simple terminal-based menu. This is a summer training project designed to demonstrate use of variables, lists, maps, conditionals, async/await, and switch-case statements in Dart.

# Features Implemented: 

- Fetch user data from a public API
- Show all usernames
- View detailed user information by ID
- Filter users by city
- Menu-based CLI with input handling
- Uses async/await for HTTP requests
- Error handling using try-catch
- Keeps menu active until user exits
- Nicely formatted terminal output

# Project Structure:

user_manager_app/
├── bin/
│   └── main.dart
├── images/
│   └── terminal-screenshot.png
├── README.md
├── pubspec.yaml

# Packages(Added in pubspec.yaml):

dependencies:
  http: ^0.13.0

# Terminal Output images:

![UserManagerApp Screenshot](images/terminal-screenshot.png)