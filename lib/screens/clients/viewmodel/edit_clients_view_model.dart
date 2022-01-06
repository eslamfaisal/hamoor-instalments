import 'package:flutter/material.dart';
import 'package:instalment/enums/screen_state.dart';
import 'package:instalment/locator.dart';
import 'package:instalment/models/status.dart';
import 'package:instalment/routs/routs_names.dart';
import 'package:instalment/screens/base_view_model.dart';
import 'package:instalment/screens/clients/model/clients_model.dart';
import 'package:instalment/services/firebase_services.dart';
import 'package:instalment/services/navigation_service.dart';

class EditClientsViewModel extends BaseViewModel {
  TextEditingController nameController = TextEditingController();
  TextEditingController percentageController = TextEditingController();

  final FirebaseServices _firebaseServices = locator<FirebaseServices>();

  List<ClientModel> clients = [];

  void getClients() async {
    setState(ViewState.Busy);
    var resource = await _firebaseServices.getClients();

    if (resource.status == Status.SUCCESS) {
      clients = resource.data!;
      setState(ViewState.Idle);
    }
  }

}
