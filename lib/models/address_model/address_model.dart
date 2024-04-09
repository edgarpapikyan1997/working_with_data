import 'package:json_annotation/json_annotation.dart';
part 'address_model.g.dart';

@JsonSerializable()
class Address {
  String street;
  String suite;
  String city;
  String zipcode;

  Address(
      {required this.street,
      required this.suite,
      required this.city,
      required this.zipcode});

  factory Address.fromJson(Map<String, dynamic> json) => _$AddressFromJson(json);
  //   return Address(
  //       street: json["street"],
  //       suite: json["suite"],
  //       city: json["city"],
  //       zip: json["zipcode"]);
  // }

  String toString() {
    return "\nCity: $city,\nStreet: $street, \nSuite: $suite, \nZip: $zipcode";
  }
}
