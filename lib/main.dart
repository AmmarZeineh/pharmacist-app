import 'package:flutter/material.dart';
import 'package:pharmacy_app/cubits/cart%20model/cart_model_cubit.dart';
import 'package:pharmacy_app/cubits/favorite%20medicine/favorite_medicine_cubit.dart';
import 'package:pharmacy_app/cubits/get%20medicines/get_medicine_cubit.dart';
import 'package:pharmacy_app/cubits/theme%20cubit/theme_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_app/widgets/material_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CartCubit(),
        ),
        BlocProvider(
          create: (context) => GetMedicineCubit(),
        ),
        BlocProvider(
          create: (context) => FavoriteMedicineCubit(),
        ),
        BlocProvider(
          create: (context) => ThemeCubit(),
        ),
      ],
      child: const MaterialAppWidget(),
    );
  }
}
