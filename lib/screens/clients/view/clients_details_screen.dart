import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:instalment/screens/clients/model/clients_model.dart';

class ClientsDetailsScreen extends StatelessWidget {
  ClientModel clientModel;
  ClientsDetailsScreen(this.clientModel, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.details)),
              Tab(icon: Icon(Icons.monetization_on_outlined)),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Column(
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
                ListTile(
                  title: Text(tr('national_id')),
                  subtitle: Text(clientModel.id_num),
                ),
              ],
            ),
            Column(
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
                ListTile(
                  title: Text(tr('national_id')),
                  subtitle: Text(clientModel.id_num),
                ),
              ],
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
