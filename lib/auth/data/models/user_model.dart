import 'package:errands/auth/domain/entities/user.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class UserModel {
  final String id;
  final String name;
  final String email;
  final String? picture;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    this.picture,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    id: json['id'],
    name: json['name'],
    email: json['email'],
    picture: json['picture'],
  );

  factory UserModel.fromSupabaseRes(User user) => UserModel(
    id: user.id,
    name: user.userMetadata!['name'],
    email: user.email!,
    picture: null,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    "email": email,
    'picture': picture,
  };

  UserEntity toEntity() => (
    id: id,
    name: name,
    email: email,
    picture: picture
  ) as UserEntity;
}
