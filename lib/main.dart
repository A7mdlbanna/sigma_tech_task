import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:sigma_tech_task/core/bloc_observer.dart';
import 'app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());

  Bloc.observer = MyBlocObserver();
}
