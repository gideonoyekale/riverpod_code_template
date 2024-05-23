class CartCheckInParam {
  String? cart;
  PreOperationCheck? preOperationCheck;

  CartCheckInParam({this.cart, this.preOperationCheck});

  CartCheckInParam.fromJson(Map<String, dynamic> json) {
    cart = json['cart'];
    preOperationCheck = json['pre_operation_check'] != null
        ? PreOperationCheck.fromJson(json['pre_operation_check'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cart'] = cart;
    if (preOperationCheck != null) {
      data['pre_operation_check'] = preOperationCheck!.toJson();
    }
    return data;
  }
}

class PreOperationCheck {
  bool? batteryCharged;
  bool? noMaintenanceLights;
  bool? allDoorsUnlocked;
  String? additionalNote;

  PreOperationCheck(
      {this.batteryCharged,
      this.noMaintenanceLights,
      this.allDoorsUnlocked,
      this.additionalNote});

  PreOperationCheck.fromJson(Map<String, dynamic> json) {
    batteryCharged = json['battery_charged'];
    noMaintenanceLights = json['no_maintenance_lights'];
    allDoorsUnlocked = json['all_doors_unlocked'];
    additionalNote = json['additional_note'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['battery_charged'] = batteryCharged;
    data['no_maintenance_lights'] = noMaintenanceLights;
    data['all_doors_unlocked'] = allDoorsUnlocked;
    data['additional_note'] = additionalNote;
    return data;
  }
}
