import 'package:flutter/material.dart';
import 'package:instalment/screens/base_view.dart';
import 'package:instalment/screens/clients/model/clients_model.dart';
import 'package:instalment/screens/orders_screen/viewmodel/orders_view_model.dart';

class OrdersScreen extends StatelessWidget {

  ClientModel clientModel;
  OrdersScreen(this.clientModel,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<OrdersViewModel>(
      onModelReady: (viewModel) {
        viewModel.getOrders(clientModel.id);
      },
      builder: (context, viewModel, child) {
        return ListView.builder(
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(
                  viewModel.orders[index].product_name!,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                    viewModel.orders[index].main_price!.toString(),
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold)),
                onTap: () {
                  viewModel.navigateToClientDetails(
                      context, viewModel.orders[index]);
                },
              );
            },
            itemCount: viewModel.orders.length);
      },
    );
  }
}
