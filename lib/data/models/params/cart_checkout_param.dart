class CartCheckoutParam {
  bool? cartPluggedIn;
  bool? keysReturned;
  bool? trashRemoved;
  bool? doorsLocked;
  String? additionalNote;

  CartCheckoutParam({
    this.cartPluggedIn,
    this.keysReturned,
    this.trashRemoved,
    this.doorsLocked,
    this.additionalNote,
  });

  CartCheckoutParam.fromJson(Map<String, dynamic> json) {
    cartPluggedIn = json['cart_plugged_in'];
    keysReturned = json['keys_returned'];
    trashRemoved = json['trash_removed'];
    doorsLocked = json['doors_locked'];
    additionalNote = json['additional_note'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cart_plugged_in'] = cartPluggedIn;
    data['keys_returned'] = keysReturned;
    data['trash_removed'] = trashRemoved;
    data['doors_locked'] = doorsLocked;
    data['additional_note'] = additionalNote;
    return data;
  }
}
