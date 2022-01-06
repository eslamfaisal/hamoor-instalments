import 'package:flutter/material.dart';
import 'package:instalment/enums/screen_state.dart';
import 'package:instalment/locator.dart';
import 'package:instalment/models/status.dart';
import 'package:instalment/routs/routs_names.dart';
import 'package:instalment/screens/base_view_model.dart';
import 'package:instalment/screens/instalments/model/instalment_model.dart';
import 'package:instalment/services/firebase_services.dart';
import 'package:instalment/services/navigation_service.dart';

class InstalmentsViewModel extends BaseViewModel {
  final FirebaseServices _firebaseServices = locator<FirebaseServices>();

  List<InstalmentModel> instalments = [];

  void getInstalments(String clientId, String orderId) async {
    setState(ViewState.Busy);
    var resource = await _firebaseServices.getInstalments(clientId, orderId);

    if (resource.status == Status.SUCCESS) {
      instalments = resource.data!;
      setState(ViewState.Idle);
    }
  }

  void navigateToClientDetails(BuildContext context, InstalmentModel client) {
    locator<NavigationService>()
        .navigateTo(RouteName.INSTALMENT_DETAILS, arguments: client);
  }

  void updateInstalment(int index) {
    instalments[index].isPaid = !instalments[index].isPaid!;
    _firebaseServices.updateInstalment(instalments[index].id!, instalments[index].isPaid!);

    setState(ViewState.Idle);
  }
}
