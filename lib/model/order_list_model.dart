class OrderListModel {
  String masp;
  String datetime;
  String form;
  String place_from;
  String place_to;

  OrderListModel({
    this.masp,
    this.datetime,
    this.form,
    this.place_from,
    this.place_to,
  });
  OrderListModel.fromJson(Map<String, dynamic> json)
      : masp = json['masp'] as String,
        datetime = json['datetime'] as String,
        form = json['form'] as String,
        place_from = json['place_from'] as String,
        place_to = json['place_to'] as String;

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = Map<String, dynamic>();
    data['masp'] = this.masp;
    data['datetime'] = this.datetime;
    data['form'] = this.form;
    data['place_from'] = this.place_from;
    data['place_to'] = this.place_to;
    return data;
  }
}
