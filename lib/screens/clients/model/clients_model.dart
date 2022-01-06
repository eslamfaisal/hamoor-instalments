class ClientModel {

  String id = "";
  String name = "";
  String phone = "";
  String id_num = "";
  String address = "";

  ClientModel(this.id, this.name, this.phone, this.id_num, this.address);

  ClientModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    id_num = json['id_num'];
    address = json['address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['id_num'] = this.id_num;
    data['address'] = this.address;
    return data;
  }
}
