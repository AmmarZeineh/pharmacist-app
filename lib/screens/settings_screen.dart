import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_app/constants.dart';
import 'package:pharmacy_app/cubits/cart%20model/cart_model_cubit.dart';
import 'package:pharmacy_app/cubits/favorite%20medicine/favorite_medicine_cubit.dart';
import 'package:pharmacy_app/cubits/theme%20cubit/theme_cubit.dart';
import 'package:pharmacy_app/helper/show_snack_bar.dart';
import 'package:pharmacy_app/screens/welcome_screen.dart';
import 'package:pharmacy_app/services/logout_service.dart';
import 'package:pharmacy_app/widgets/custom_button.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  static String id = kSettingsScreen;

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    String token = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Settings',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16, top: 60, right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Theme',
                  style: TextStyle(fontSize: 24),
                ),
                IconButton(
                  onPressed: () {
                    BlocProvider.of<ThemeCubit>(context).changeTheme();
                    setState(() {});
                  },
                  icon: BlocProvider.of<ThemeCubit>(context).theme ==
                          Brightness.dark
                      ? const Icon(
                          Icons.sunny,
                          size: 30,
                        )
                      : const Icon(
                          Icons.nightlight,
                          size: 30,
                        ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
            child: CustomButton(
              hint: 'Logout',
              hintColor:
                  BlocProvider.of<ThemeCubit>(context).theme == Brightness.light
                      ? Colors.white
                      : Colors.black,
              buttonColor:
                  BlocProvider.of<ThemeCubit>(context).theme == Brightness.light
                      ? Colors.black
                      : Colors.white,
              onTap: () {
                try {
                  logout(token: token);
                  BlocProvider.of<FavoriteMedicineCubit>(context)
                      .favoriteMedicinesList
                      .clear();
                  BlocProvider.of<CartCubit>(context).cartModelsList.clear();
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return const WelcomeScreen();
                  }));
                } catch (e) {
                  showSnackBar(context, e.toString());
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
