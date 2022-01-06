import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:instalment/screens/base_view.dart';
import 'package:instalment/screens/clients/viewmodel/clients_view_model.dart';

class ClientsScreen extends StatelessWidget {

  ClientsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<ClientsViewModel>(
      onModelReady: (viewModel) {
        viewModel.getClients();
      },
      builder: (context, viewModel, child) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            body: ListView.builder(
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      viewModel.clients[index].name,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(viewModel.clients[index].phone, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                    onTap: () {
                      viewModel.navigateToClientDetails(
                          context, viewModel.clients[index]);
                    },
                  );
                },
                itemCount: viewModel.clients.length),
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
