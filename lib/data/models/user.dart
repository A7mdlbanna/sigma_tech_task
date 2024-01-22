import 'address.dart';
import 'bank.dart';
import 'company.dart';
import 'crypto.dart';
import 'hair.dart';

class User {
  User({
      this.id, 
      this.firstName, 
      this.lastName, 
      this.maidenName, 
      this.age, 
      this.gender, 
      this.email, 
      this.phone, 
      this.username, 
      this.password, 
      this.birthDate, 
      this.image, 
      this.bloodGroup, 
      this.height, 
      this.weight, 
      this.eyeColor, 
      this.hair, 
      this.domain, 
      this.ip, 
      this.address, 
      this.macAddress, 
      this.university, 
      this.bank, 
      this.company, 
      this.ein, 
      this.ssn, 
      this.userAgent, 
      this.crypto,});

  User.fromJson(dynamic json) {
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    maidenName = json['maidenName'];
    age = json['age'];
    gender = json['gender'];
    email = json['email'];
    phone = json['phone'];
    username = json['username'];
    password = json['password'];
    birthDate = json['birthDate'];
    image = json['image'];
    bloodGroup = json['bloodGroup'];
    height = json['height'];
    weight = json['weight'];
    eyeColor = json['eyeColor'];
    hair = json['hair'] != null ? Hair.fromJson(json['hair']) : null;
    domain = json['domain'];
    ip = json['ip'];
    address = json['address'] != null ? Address.fromJson(json['address']) : null;
    macAddress = json['macAddress'];
    university = json['university'];
    bank = json['bank'] != null ? Bank.fromJson(json['bank']) : null;
    company = json['company'] != null ? Company.fromJson(json['company']) : null;
    ein = json['ein'];
    ssn = json['ssn'];
    userAgent = json['userAgent'];
    crypto = json['crypto'] != null ? Crypto.fromJson(json['crypto']) : null;
  }
  num? id;
  String? firstName;
  String? lastName;
  String? maidenName;
  num? age;
  String? gender;
  String? email;
  String? phone;
  String? username;
  String? password;
  String? birthDate;
  String? image;
  String? bloodGroup;
  num? height;
  num? weight;
  String? eyeColor;
  Hair? hair;
  String? domain;
  String? ip;
  Address? address;
  String? macAddress;
  String? university;
  Bank? bank;
  Company? company;
  String? ein;
  String? ssn;
  String? userAgent;
  Crypto? crypto;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['firstName'] = firstName;
    map['lastName'] = lastName;
    map['maidenName'] = maidenName;
    map['age'] = age;
    map['gender'] = gender;
    map['email'] = email;
    map['phone'] = phone;
    map['username'] = username;
    map['password'] = password;
    map['birthDate'] = birthDate;
    map['image'] = image;
    map['bloodGroup'] = bloodGroup;
    map['height'] = height;
    map['weight'] = weight;
    map['eyeColor'] = eyeColor;
    if (hair != null) {
      map['hair'] = hair?.toJson();
    }
    map['domain'] = domain;
    map['ip'] = ip;
    if (address != null) {
      map['address'] = address?.toJson();
    }
    map['macAddress'] = macAddress;
    map['university'] = university;
    if (bank != null) {
      map['bank'] = bank?.toJson();
    }
    if (company != null) {
      map['company'] = company?.toJson();
    }
    map['ein'] = ein;
    map['ssn'] = ssn;
    map['userAgent'] = userAgent;
    if (crypto != null) {
      map['crypto'] = crypto?.toJson();
    }
    return map;
  }

  /// this makes sure when comparing two User values
  /// that you get the right result based on the id
  @override
  bool operator ==(Object other) {
    return identical(this, other) || (other is User && runtimeType == other.runtimeType && id == other.id);
  }

  @override
  int get hashCode => id.hashCode;

}