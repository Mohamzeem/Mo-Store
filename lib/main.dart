import 'package:flutter/material.dart';
import 'package:mo_store/core/app/app_globals.dart';
import 'package:mo_store/core/app/app_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  AppGlobals.systemOverlay();
  runApp(const AppView());
}
