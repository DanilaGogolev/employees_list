// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Employee _$$_EmployeeFromJson(Map<String, dynamic> json) => _$_Employee(
      id: json['id'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      patronymic: json['patronymic'] as String,
      phoneNumber: json['phoneNumber'] as String,
      email: json['email'] as String,
      birthday: DateTime.parse(json['birthday'] as String),
      comments: json['comments'] as String? ?? '',
    );

Map<String, dynamic> _$$_EmployeeToJson(_$_Employee instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'patronymic': instance.patronymic,
      'phoneNumber': instance.phoneNumber,
      'email': instance.email,
      'birthday': instance.birthday.toIso8601String(),
      'comments': instance.comments,
    };
