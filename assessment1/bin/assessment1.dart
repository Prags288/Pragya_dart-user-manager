import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

Future<void> main() async {
  final String apiUrl = 'https://jsonplaceholder.typicode.com/users';
  List<Map<String, dynamic>> users = [];

  try {
    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      users = List<Map<String, dynamic>>.from(data);
    } else {
      print('Failed to fetch users. Status code: \${response.statusCode}');
      return;
    }
  } catch (e) {
    print('An error occurred while fetching data: \$e');
    return;
  }

  while (true) {
    print('\n==== User Manager Menu ====');
    print('1. Show all usernames');
    print('2. Show details of a user by ID');
    print('3. Filter users by city');
    print('4. Exit');
    stdout.write('Enter your choice: ');
    String? choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        print('\n-- All Usernames --');
        for (var user in users) {
          print('- ${user['username']}');
        }
        break;

      case '2':
        stdout.write('Enter user ID: ');
        String? idInput = stdin.readLineSync();
        int? userId = int.tryParse(idInput ?? '');
        if (userId == null) {
          print('Invalid ID. Please enter a valid number.');
          break;
        }
        var user = users.firstWhere(
          (u) => u['id'] == userId,
          orElse: () => {},
        );
        if (user.isEmpty) {
          print('User not found.');
        } else {
          print('\n-- User Details --');
          print('Name   : ${user['name']}');
          print('Username: ${user['username']}');
          print('Email  : ${user['email']}');
          print('City   : ${user['address']['city']}');
          print('Company: ${user['company']['name']}');
        }
        break;

      case '3':
        stdout.write('Enter city name: ');
        String? city = stdin.readLineSync();
        if (city == null || city.isEmpty) {
          print('City name cannot be empty.');
          break;
        }
        var filteredUsers = users.where(
          (u) => u['address']['city'].toString().toLowerCase() == city.toLowerCase(),
        );
        if (filteredUsers.isEmpty) {
          print('No users found in city "$city".');
        } else {
          print('\n-- Users in $city --');
          for (var u in filteredUsers) {
            print('- ${u['name']} (${u['username']})');
          }
        }
        break;

      case '4':
        print('Goodbye!');
        return;

      default:
        print('Invalid choice. Please try again.');
    }
  }
}
