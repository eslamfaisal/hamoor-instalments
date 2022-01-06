import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:instalment/locator.dart';
import 'package:instalment/routs/routs_names.dart';
import 'package:instalment/screens/base_view.dart';
import 'package:instalment/screens/clients/view/clients_screen.dart';
import 'package:instalment/screens/home/viewmodel/home_view_model.dart';
import 'package:instalment/services/navigation_service.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
      onModelReady: (viewModel) {},
      builder: (context, viewModel, child) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              title: Text(
                tr('clients'),
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),
              centerTitle: true,
            ),
            body: ClientsScreen(),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                locator<NavigationService>().navigateTo(RouteName.EDIT_CLIENTS);
              },
              child: const Icon(Icons.add),
            ),
          ),
        );
      },
    );
  }
}
