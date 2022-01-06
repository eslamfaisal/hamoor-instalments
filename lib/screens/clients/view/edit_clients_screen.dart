import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:instalment/screens/base_view.dart';
import 'package:instalment/screens/clients/model/clients_model.dart';
import 'package:instalment/screens/clients/viewmodel/edit_clients_view_model.dart';

class EditClientsScreen extends StatelessWidget {

  bool isNewClient;
  ClientModel? clientModel;

  EditClientsScreen(this.isNewClient, this.clientModel, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<EditClientsViewModel>(
      onModelReady: (viewModel) {
        print('isNewClient ${isNewClient}');
      },
      builder: (context, viewModel, child) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              title: Text(
                isNewClient
                    ? tr('add_client')
                    : tr('edit_client').toUpperCase(),
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              centerTitle: true,
              leading: IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            body: Center(
              child: Text(
                tr('app_name'),
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {},
              child: const Icon(Icons.add),
            ),
          ),
        );
      },
    );
  }
}
