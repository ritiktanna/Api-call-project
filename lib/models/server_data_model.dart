// To parse this JSON data, do
//
//     final serverDataModelClass = serverDataModelClassFromJson(jsonString);

import 'dart:convert';

String serverDataModelClassToJson(List<ServerDataModelClass> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ServerDataModelClass {
  ServerDataModelClass({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.address,
    required this.phone,
    required this.website,
    required this.company,
  });

  int id;
  String name;
  String username;
  String email;
  Address address;
  String phone;
  String website;
  Company company;

  factory ServerDataModelClass.fromJson(Map<String, dynamic> json) =>
      ServerDataModelClass(
        id: json["id"] as int,
        name: json["name"] as String,
        username: json["username"] as String,
        email: json["email"] as String,
        address: Address.fromJson(json["address"] as Map<String, dynamic>),
        phone: json["phone"] as String,
        website: json["website"] as String,
        company: Company.fromJson(json["company"] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "username": username,
        "email": email,
        "address": address.toJson(),
        "phone": phone,
        "website": website,
        "company": company.toJson(),
      };
}

class Address {
  Address({
    required this.street,
    required this.suite,
    required this.city,
    required this.zipcode,
    required this.geo,
  });

  String street;
  String suite;
  String city;
  String zipcode;
  Geo geo;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        street: json["street"] as String,
        suite: json["suite"] as String,
        city: json["city"] as String,
        zipcode: json["zipcode"] as String,
        geo: Geo.fromJson(json["geo"] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        "street": street,
        "suite": suite,
        "city": city,
        "zipcode": zipcode,
        "geo": geo.toJson(),
      };
}

class Geo {
  Geo({
    required this.lat,
    required this.lng,
  });

  String lat;
  String lng;

  factory Geo.fromJson(Map<String, dynamic> json) => Geo(
        lat: json["lat"] as String,
        lng: json["lng"] as String,
      );

  Map<String, dynamic> toJson() => {
        "lat": lat,
        "lng": lng,
      };
}

class Company {
  Company({
    required this.name,
    required this.catchPhrase,
    required this.bs,
  });

  String name;
  String catchPhrase;
  String bs;

  factory Company.fromJson(Map<String, dynamic> json) => Company(
        name: json["name"] as String,
        catchPhrase: json["catchPhrase"] as String,
        bs: json["bs"] as String,
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "catchPhrase": catchPhrase,
        "bs": bs,
      };
}
