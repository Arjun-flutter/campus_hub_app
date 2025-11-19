import 'package:campus_hub_app/models/student.dart';
import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/student_list_screen.dart';

void main() {
  runApp(const CampusHubApp());
}

class CampusHubApp extends StatefulWidget {
  const CampusHubApp({super.key});

  @override
  State<CampusHubApp> createState() => _CampusHubAppState();
}

class _CampusHubAppState extends State<CampusHubApp> {
  ThemeMode _mode = ThemeMode.dark;

  void toggleTheme() {
    setState(
      () => _mode = _mode == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark,
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'Campus Hub App',
      debugShowCheckedModeBanner: false,
      themeMode: _mode,
      initialRoute: 'loginScreen',
      routes: {
        "loginScreen": (context) => const LoginScreen(),
        "studentListScreen": (context) => const StudentListScreen(),
      },
      //home: const LoginScreen(),
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.indigo,
        scaffoldBackgroundColor: Colors.grey[50],
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.indigo,
        scaffoldBackgroundColor: Colors.black,
      ),
    );
  }
}
