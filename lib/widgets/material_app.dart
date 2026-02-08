import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_app/cubits/theme%20cubit/theme_cubit.dart';
import 'package:pharmacy_app/screens/cart_screen.dart';
import 'package:pharmacy_app/screens/favorite_medicines_screen.dart';
import 'package:pharmacy_app/screens/home_screen.dart';
import 'package:pharmacy_app/screens/login_screen.dart';
import 'package:pharmacy_app/screens/medicine_details_screen.dart';
import 'package:pharmacy_app/screens/orders_screen.dart';
import 'package:pharmacy_app/screens/settings_screen.dart';
import 'package:pharmacy_app/screens/signup_screen.dart';
import 'package:pharmacy_app/screens/welcome_screen.dart';

class MaterialAppWidget extends StatefulWidget {
  const MaterialAppWidget({super.key});

  @override
  State<MaterialAppWidget> createState() => _MaterialAppWidgetState();
}

class _MaterialAppWidgetState extends State<MaterialAppWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return MaterialApp(
          routes: {
            CartScreen.id: (context) => const CartScreen(),
            OrdersScreen.id: (context) => const OrdersScreen(),
            HomeScreen.id: (context) => const HomeScreen(),
            LoginScreen.id: (context) => const LoginScreen(),
            SignUpScreen.id: (context) => const SignUpScreen(),
            WelcomeScreen.id: (context) => const WelcomeScreen(),
            SettingsScreen.id: (context) => const SettingsScreen(),
            MedicineDetailsScreen.id: (context) =>
                const MedicineDetailsScreen(),
            FavoriteMedicinesScreen.id: (context) =>
                const FavoriteMedicinesScreen(),
          },
          theme: ThemeData(
              fontFamily: 'Poppins',
              brightness: BlocProvider.of<ThemeCubit>(context).theme),
          debugShowCheckedModeBanner: false,
          home: const WelcomeScreen(),
        );
      },
    );
  }
}
