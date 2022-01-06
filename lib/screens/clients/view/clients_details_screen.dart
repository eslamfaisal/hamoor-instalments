import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:instalment/screens/base_view.dart';
import 'package:instalment/screens/clients/model/clients_model.dart';
import 'package:instalment/screens/clients/viewmodel/clients_view_model.dart';

class ClientsDetailsScreen extends StatelessWidget {

  ClientModel clientModel;
  ClientsDetailsScreen(this.clientModel, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            ListTile(
              title: Text(tr('name')),
              subtitle: Text(clientModel.name),
            ),
            ListTile(
              title: Text(tr('phone')),
              subtitle: Text(clientModel.phone),
            ),
            ListTile(
              title: Text(tr('address')),
              subtitle: Text(clientModel.address),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
