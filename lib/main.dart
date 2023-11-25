import 'package:flutter/material.dart';
import 'package:iqro/config/config.dart';
import 'package:iqro/features/auth/presentation/pages/intro/intro_page.dart';
import 'package:iqro/features/auth/presentation/pages/compass_page/compass_page.dart';
import 'package:iqro/service_locator.dart';
import 'package:shared_preferences/shared_preferences.dart';

bool show = true;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  show = await prefs.getBool("ON_BOARDING") ?? true;
  await init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: themeData,
      debugShowCheckedModeBanner: false,
      home: const CompassScreen(),
    );
  }
}
