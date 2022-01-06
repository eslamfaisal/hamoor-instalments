import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:instalment/screens/base_view.dart';
import 'package:instalment/screens/instalments/viewmodel/instalments_view_model.dart';
import 'package:instalment/screens/orders_screen/model/order_model.dart';

class InstalmentsScreen extends StatelessWidget {
  OrderModel orderModel;

  InstalmentsScreen(this.orderModel, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<InstalmentsViewModel>(
      onModelReady: (viewModel) {
        viewModel.getInstalments(orderModel.client_id!,orderModel.id!);
      },
      builder: (context, viewModel, child) {
        return ListView.builder(
            itemBuilder: (context, index) {
              return SwitchListTile(
                  value: viewModel.instalments[index].isPaid!,
                  onChanged: (value) {
                    viewModel.updateInstalment(index);
                  },
                  title: ListTile(
                    title: Text(
                      DateFormat('yyyy-MM-dd')
                          .format(viewModel.instalments[index].dueDate!)
                          .toString(),
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                        viewModel.instalments[index].amount!.toString(),
                        style: const TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold)),
                    onTap: () {
                      viewModel.navigateToClientDetails(
                          context, viewModel.instalments[index]);
                    },
                  ));
            },
            itemCount: viewModel.instalments.length);
      },
    );
  }
}
