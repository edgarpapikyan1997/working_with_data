import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import '../address_model/address_model.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  int id;
  String name;
  String? username;
  String? email;
  String? phone;
  String? website;
  Address? address;

  UserModel({
    required this.id,
    required this.name,
    this.username,
    this.email,
    this.phone,
    this.website,
    this.address,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  // return UserModel(
  // id: json['id'],
  // name: json['name'],
  // userName: json['username'],
  // email: json['email'],
  // phoneNumber: json['phone'],
  // website: json['website'],
  // address: Address.fromJson(json['address']),
  // );
  // }

  @override
  String toString() {
    return 'UserModel \n {id: $id,\nname: $name,\nuserName: $username,\nemail: $email,\nphone: $phone,\nwebsite: $website, \naddress: $address}';
  }
}

class UserAdapter extends TypeAdapter<UserModel> {
  @override
  final typeId = 0;

  @override
  UserModel read(BinaryReader reader) {
    final name = reader.readString();
    final id = reader.readInt();

    return UserModel(
      id: id,
      name: name,
    );
  }

  @override
  void write(BinaryWriter writer, UserModel obj) {
    writer.writeString(obj.name);
    writer.writeInt(obj.id);
  }
}
