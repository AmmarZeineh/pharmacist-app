import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pharmacy_app/constants.dart';
import 'package:pharmacy_app/models/order_model.dart';
import 'package:pharmacy_app/models/pharmacist_model.dart';
import 'package:pharmacy_app/services/get_all_orders.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key, required this.pharmacistModel});
  final PharmacistModel pharmacistModel;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          const SizedBox(
            height: 60,
          ),
          ListTile(
            title: const Text(
              'Your Orders',
              style: TextStyle(fontSize: 19),
            ),
            onTap: () async {
              List<OrderModel> ordersList =
                  await GetAllOrders().getAllOrders(pharmacistModel.id);
              // ignore: use_build_context_synchronously
              Navigator.pushNamed(context, kOrdersScreen,
                  arguments: ordersList);
            },
            leading: const Icon(
              FontAwesomeIcons.list,
              size: 32,
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          ListTile(
            title: const Text(
              'Favorite',
              style: TextStyle(fontSize: 19),
            ),
            onTap: () {
              Navigator.pushNamed(context, kFavoriteScreen,
                  arguments: pharmacistModel);
            },
            leading: const Icon(
              Icons.favorite,
              size: 32,
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          ListTile(
            title: const Text(
              'Settings',
              style: TextStyle(fontSize: 19),
            ),
            onTap: () {
              Navigator.pushNamed(context, kSettingsScreen,
                  arguments: pharmacistModel.token);
            },
            leading: const Icon(
              Icons.settings,
              size: 32,
            ),
          ),
        ],
      ),
    );
  }
}
