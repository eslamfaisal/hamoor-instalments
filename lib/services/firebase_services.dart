import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:instalment/models/resources.dart';
import 'package:instalment/models/status.dart';
import 'package:instalment/screens/clients/model/clients_model.dart';

class FirebaseServices {
  var db = FirebaseFirestore.instance;
  var auth = FirebaseAuth.instance;


  Future<Resource<List<ClientModel>>> getClients() async {
    try {
      QuerySnapshot<Map<String, dynamic>> response =
      await db.collection('clients').get();

      List<ClientModel> servicesList =
      response.docs.map((doc) => ClientModel.fromJson(doc.data())).toList();
      return Resource(Status.SUCCESS, data: servicesList);
    } catch (e) {
      return Resource(Status.ERROR, errorMessage: e.toString());
    }
  }


}