import 'package:flutter/material.dart';
import 'package:instalment/enums/screen_state.dart';
import 'package:instalment/locator.dart';
import 'package:instalment/models/status.dart';
import 'package:instalment/routs/routs_names.dart';
import 'package:instalment/screens/base_view_model.dart';
import 'package:instalment/screens/clients/model/clients_model.dart';
import 'package:instalment/screens/orders_screen/model/order_model.dart';
import 'package:instalment/services/firebase_services.dart';
import 'package:instalment/services/navigation_service.dart';

class OrdersViewModel extends BaseViewModel {

  final FirebaseServices _firebaseServices = locator<FirebaseServices>();

  List<OrderModel> orders = [];

  void getOrders(String id) async {
    setState(ViewState.Busy);
    var resource = await _firebaseServices.getOrders(id);

    if (resource.status == Status.SUCCESS) {
      orders = resource.data!;
      setState(ViewState.Idle);
    }
  }

  void navigateToClientDetails(BuildContext context, OrderModel client) {
    locator<NavigationService>()
        .navigateTo(RouteName.ORDERS_DETAILS, arguments: client);
  }
}
