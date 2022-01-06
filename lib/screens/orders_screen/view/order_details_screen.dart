import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:instalment/screens/instalments/view/instalments_screen.dart';
import 'package:instalment/screens/orders_screen/model/order_model.dart';

class OrderDetailsScreen extends StatelessWidget {
  OrderModel orderModel;

  OrderDetailsScreen(this.orderModel, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: Text(
              tr('order_details'),
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            bottom: TabBar(
              tabs: [
                Text(tr('order_details')),
                Text(tr('instalments')),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              userDetailsWidget(),
              InstalmentsScreen(orderModel),
              // OrdersScreen(orderModel),
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
          title: Text(tr('product_name')),
          subtitle: Text(orderModel.product_name!),
        ),
        ListTile(
          title: Text(tr('main_price')),
          subtitle: Text(orderModel.main_price!.toString()),
        ),
        ListTile(
          title: Text(tr('is_installment')),
          subtitle: Text(orderModel.is_instalment! ? tr('yes') : tr('no')),
        ),
        if (orderModel.is_instalment!)
          ListTile(
            title: Text(tr('instalment_total_price')),
            subtitle: Text(orderModel.instalment_total_price!.toString()),
          ),
      ],
    );
  }
}
