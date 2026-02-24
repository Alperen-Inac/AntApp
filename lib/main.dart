import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'theme/app_theme.dart';
import 'screens/booking_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ),
  );
  runApp(const RayRide());
}

class RayRide extends StatelessWidget {
  const RayRide({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RayRide — Antalya Transfers',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme,
      home: const BookingScreen(),
    );
  }
}
