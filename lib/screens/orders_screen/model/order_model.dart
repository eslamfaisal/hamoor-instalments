class OrderModel {
  String? id;
  String? client_id;
  String? product_name;
  int? main_price;
  int? instalment_total_price;
  bool? is_instalment;

  OrderModel(
    this.id,
    this.client_id,
    this.product_name,
    this.main_price,
    this.instalment_total_price,
    this.is_instalment,
  );

  OrderModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    client_id = json['client_id'];
    product_name = json['product_name'];
    main_price = json['main_price'];
    instalment_total_price = json['instalment_total_price'];
    is_instalment = json['is_instalment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['client_id'] = this.client_id;
    data['product_name'] = this.product_name;
    data['main_price'] = this.main_price;
    data['instalment_total_price'] = this.instalment_total_price;
    data['is_instalment'] = this.is_instalment;
    return data;
  }
}
