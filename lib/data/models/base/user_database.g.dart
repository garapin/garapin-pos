// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_database.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDatabase _$UserDatabaseFromJson(Map<String, dynamic> json) => UserDatabase(
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      database: (json['database'] as List<dynamic>?)
          ?.map((e) => DatabaseStore.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UserDatabaseToJson(UserDatabase instance) =>
    <String, dynamic>{
      'user': instance.user,
      'database': instance.database,
    };

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['_id'] as String?,
      username: json['username'],
      email: json['email'] as String?,
      storeDatabaseName: json['store_database_name'] as List<dynamic>?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      v: json['__v'] as int?,
      token: json['token'] as String?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      '_id': instance.id,
      'username': instance.username,
      'email': instance.email,
      'store_database_name': instance.storeDatabaseName,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      '__v': instance.v,
      'token': instance.token,
    };
