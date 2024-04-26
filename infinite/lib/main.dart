import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vice_app/features/home/presentation/screens/home_screen.dart';

import 'core/app/vice_app.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
  );
  runApp(MaterialApp(
    home: HomeScreen(),
  ));
}
