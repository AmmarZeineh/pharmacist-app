import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmacy_app/constants.dart';
import 'package:pharmacy_app/cubits/get%20medicines/get_medicine_cubit.dart';
import 'package:pharmacy_app/models/category_item_model.dart';
import 'package:pharmacy_app/models/medicine_model.dart';
import 'package:pharmacy_app/models/pharmacist_model.dart';
import 'package:pharmacy_app/widgets/category_item.dart';
import 'package:pharmacy_app/widgets/category_item_list_view_builder.dart';
import 'package:pharmacy_app/widgets/custom_app_bar.dart';
import 'package:pharmacy_app/widgets/custom_drawer.dart';
import 'package:pharmacy_app/widgets/custom_text_field.dart';
import 'package:pharmacy_app/widgets/medicine_grid_view_builder.dart';
import 'package:pharmacy_app/widgets/your_cart_container.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static String id = kHomeScreen;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? searchText;
  @override
  Widget build(BuildContext context) {
    PharmacistModel pharmacistModel =
        ModalRoute.of(context)!.settings.arguments as PharmacistModel;
    dynamic request =
        BlocProvider.of<GetMedicineCubit>(context).getAllMedicines();
    List<CategoryItem> categoryItemList = [
      CategoryItem(
        categoryModel: CategoryModel(
            onTap: () {
              request =
                  BlocProvider.of<GetMedicineCubit>(context).getAllMedicines();
            },
            title: 'All'),
      ),
      CategoryItem(
        categoryModel: CategoryModel(
            onTap: () {
              request = BlocProvider.of<GetMedicineCubit>(context)
                  .getMedicinesByCategory('1');
            },
            title: 'Pain Killer'),
      ),
      CategoryItem(
        categoryModel: CategoryModel(
            onTap: () {
              request = BlocProvider.of<GetMedicineCubit>(context)
                  .getMedicinesByCategory('2');
            },
            title: 'Antipyretics'),
      ),
      CategoryItem(
        categoryModel: CategoryModel(
            onTap: () {
              request = BlocProvider.of<GetMedicineCubit>(context)
                  .getMedicinesByCategory('3');
            },
            title: 'Analgesics'),
      ),
      CategoryItem(
        categoryModel: CategoryModel(
            onTap: () {
              request = BlocProvider.of<GetMedicineCubit>(context)
                  .getMedicinesByCategory('4');
            },
            title: 'Antimalarial'),
      ),
      CategoryItem(
        categoryModel: CategoryModel(
            onTap: () {
              request = BlocProvider.of<GetMedicineCubit>(context)
                  .getMedicinesByCategory('5');
            },
            title: 'Antibiotics'),
      ),
      CategoryItem(
        categoryModel: CategoryModel(
            onTap: () {
              request = BlocProvider.of<GetMedicineCubit>(context)
                  .getMedicinesByCategory('6');
            },
            title: 'Antiseptics'),
      ),
      CategoryItem(
        categoryModel: CategoryModel(
            onTap: () {
              request = BlocProvider.of<GetMedicineCubit>(context)
                  .getMedicinesByCategory('7');
            },
            title: 'Depressants'),
      ),
    ];
    return BlocBuilder<GetMedicineCubit, GetMedicineState>(
      builder: (context, state) {
        return Scaffold(
          appBar: PreferredSize(
              preferredSize: const Size.fromHeight(50),
              child: CustomAppBar(pharmacistModel: pharmacistModel)),
          drawer: CustomDrawer(pharmacistModel: pharmacistModel),
          body: FutureBuilder(
            future: request,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<MedicineModel> medicinesList =
                    snapshot.data! as List<MedicineModel>;
                return RefreshIndicator(
                  onRefresh: () {
                    setState(() {});
                    return Future.delayed(const Duration(milliseconds: 500));
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        CustomTextField(
                          onChanged: (value) {
                            setState(() {
                              searchText = value;
                            });
                          },
                        ),
                        const SizedBox(height: 15),
                        YourCartWidget(
                          pharmacistModel: pharmacistModel,
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        SizedBox(
                          height: 70,
                          child: CategoryItemListViewBuilder(
                              categoryItemList: categoryItemList),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Expanded(
                          child: MedicineGridViewBuilder(
                              pharmacistModel: pharmacistModel,
                              searchText: searchText,
                              medicinesList: medicinesList),
                        ),
                      ],
                    ),
                  ),
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        );
      },
    );
  }
}
