import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:project_secondbite/utils/theme/theme.dart';

void main() {
  runApp(const App());
} 

@override
Widget build(BuildContext context) {
  return MaterialApp(
    themeMode: ThemeMode.system,
    theme: ThemeApp.lightTheme,
    darkTheme: ThemeApp.darkTheme,
  );
}