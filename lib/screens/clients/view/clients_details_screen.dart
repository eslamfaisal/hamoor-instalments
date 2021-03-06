import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:instalment/screens/clients/model/clients_model.dart';
import 'package:instalment/screens/orders_screen/view/orders_screen.dart';

class ClientsDetailsScreen extends StatelessWidget {
  ClientModel clientModel;
  ClientsDetailsScreen(this.clientModel, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: Text(
              tr('clients_details'),
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            centerTitle: true,
            bottom: TabBar(
              tabs: [
                Text(tr('details')),
                Text(tr('orders')),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              userDetailsWidget(),
              OrdersScreen(clientModel),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            child: const Icon(Icons.add),
          ),
        ),
      ),
    );
  }

  Column userDetailsWidget() {
    return Column(
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
    );
  }
}
