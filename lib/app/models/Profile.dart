import 'Employment.dart';
import 'Address.dart';
import 'CreditCard.dart';
import 'Subscription.dart';

class Profile {
  Profile({
      this.id, 
      this.uid, 
      this.password, 
      this.firstName, 
      this.lastName, 
      this.username, 
      this.email, 
      this.avatar, 
      this.gender, 
      this.phoneNumber, 
      this.socialInsuranceNumber, 
      this.dateOfBirth, 
      this.employment, 
      this.address, 
      this.creditCard, 
      this.subscription,});

  Profile.fromJson(dynamic json) {
    id = json['id'];
    uid = json['uid'];
    password = json['password'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    username = json['username'];
    email = json['email'];
    avatar = json['avatar'];
    gender = json['gender'];
    phoneNumber = json['phone_number'];
    socialInsuranceNumber = json['social_insurance_number'];
    dateOfBirth = json['date_of_birth'];
    employment = (json['employment'] != null ? Employment.fromJson(json['employment']) : null)!;
    address = (json['address'] != null ? Address.fromJson(json['address']) : null)!;
    creditCard = (json['credit_card'] != null ? CreditCard.fromJson(json['credit_card']) : null)!;
    subscription = (json['subscription'] != null ? Subscription.fromJson(json['subscription']) : null)!;
  }
  int? id;
  String? uid;
  String? password;
  String? firstName;
  String? lastName;
  String? username;
  String? email;
  String? avatar;
  String? gender;
  String? phoneNumber;
  String? socialInsuranceNumber;
  String? dateOfBirth;
  Employment? employment;
  Address? address;
  CreditCard? creditCard;
  Subscription? subscription;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['uid'] = uid;
    map['password'] = password;
    map['first_name'] = firstName;
    map['last_name'] = lastName;
    map['username'] = username;
    map['email'] = email;
    map['avatar'] = avatar;
    map['gender'] = gender;
    map['phone_number'] = phoneNumber;
    map['social_insurance_number'] = socialInsuranceNumber;
    map['date_of_birth'] = dateOfBirth;
    final employment = this.employment;
    if (employment != null) {
      map['employment'] = employment.toJson();
    }
    final address = this.address;
    if (address != null) {
      map['address'] = address.toJson();
    }
    final creditCard = this.creditCard;
    if (creditCard != null) {
      map['credit_card'] = creditCard.toJson();
    }
    final subscription = this.subscription;
    if (subscription != null) {
      map['subscription'] = subscription.toJson();
    }
    return map;
  }

}