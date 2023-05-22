class Subscription {
  Subscription({
      this.plan, 
      this.status, 
      this.paymentMethod, 
      this.term,});

  Subscription.fromJson(dynamic json) {
    plan = json['plan'];
    status = json['status'];
    paymentMethod = json['payment_method'];
    term = json['term'];
  }
  String? plan;
  String? status;
  String? paymentMethod;
  String? term;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['plan'] = plan;
    map['status'] = status;
    map['payment_method'] = paymentMethod;
    map['term'] = term;
    return map;
  }

}