class CreditCard {
  CreditCard({
      this.ccNumber,});

  CreditCard.fromJson(dynamic json) {
    ccNumber = json['cc_number'];
  }
  String? ccNumber;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['cc_number'] = ccNumber;
    return map;
  }

}