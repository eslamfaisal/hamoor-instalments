import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:instalment/models/resources.dart';
import 'package:instalment/models/status.dart';
import 'package:instalment/screens/clients/model/clients_model.dart';
import 'package:instalment/screens/orders_screen/model/order_model.dart';

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

  Future<Resource<List<OrderModel>>> getOrders(String clientId) async {
    print('getOrders = ${clientId}');
    try {
      QuerySnapshot<Map<String, dynamic>> response =
      await db.collection('orders').where("client_id", isEqualTo: clientId).get();

      print('getOrders = ${response.docs.length}');
      List<OrderModel> servicesList =
      response.docs.map((doc) => OrderModel.fromJson(doc.data())).toList();
      print('getOrders = ${servicesList.length}');
      return Resource(Status.SUCCESS, data: servicesList);
    } catch (e) {
      print(e);
      return Resource(Status.ERROR, errorMessage: e.toString());
    }
  }


}