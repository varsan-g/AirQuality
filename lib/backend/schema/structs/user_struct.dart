// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserStruct extends BaseStruct {
  UserStruct({
    String? email,
    String? firstName,
    String? institutionName,
    bool? isAdmin,
  })  : _email = email,
        _firstName = firstName,
        _institutionName = institutionName,
        _isAdmin = isAdmin;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  set email(String? val) => _email = val;
  bool hasEmail() => _email != null;

  // "first_name" field.
  String? _firstName;
  String get firstName => _firstName ?? '';
  set firstName(String? val) => _firstName = val;
  bool hasFirstName() => _firstName != null;

  // "institutionName" field.
  String? _institutionName;
  String get institutionName => _institutionName ?? '';
  set institutionName(String? val) => _institutionName = val;
  bool hasInstitutionName() => _institutionName != null;

  // "isAdmin" field.
  bool? _isAdmin;
  bool get isAdmin => _isAdmin ?? false;
  set isAdmin(bool? val) => _isAdmin = val;
  bool hasIsAdmin() => _isAdmin != null;

  static UserStruct fromMap(Map<String, dynamic> data) => UserStruct(
        email: data['email'] as String?,
        firstName: data['first_name'] as String?,
        institutionName: data['institutionName'] as String?,
        isAdmin: data['isAdmin'] as bool?,
      );

  static UserStruct? maybeFromMap(dynamic data) =>
      data is Map ? UserStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'email': _email,
        'first_name': _firstName,
        'institutionName': _institutionName,
        'isAdmin': _isAdmin,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'email': serializeParam(
          _email,
          ParamType.String,
        ),
        'first_name': serializeParam(
          _firstName,
          ParamType.String,
        ),
        'institutionName': serializeParam(
          _institutionName,
          ParamType.String,
        ),
        'isAdmin': serializeParam(
          _isAdmin,
          ParamType.bool,
        ),
      }.withoutNulls;

  static UserStruct fromSerializableMap(Map<String, dynamic> data) =>
      UserStruct(
        email: deserializeParam(
          data['email'],
          ParamType.String,
          false,
        ),
        firstName: deserializeParam(
          data['first_name'],
          ParamType.String,
          false,
        ),
        institutionName: deserializeParam(
          data['institutionName'],
          ParamType.String,
          false,
        ),
        isAdmin: deserializeParam(
          data['isAdmin'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'UserStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is UserStruct &&
        email == other.email &&
        firstName == other.firstName &&
        institutionName == other.institutionName &&
        isAdmin == other.isAdmin;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([email, firstName, institutionName, isAdmin]);
}

UserStruct createUserStruct({
  String? email,
  String? firstName,
  String? institutionName,
  bool? isAdmin,
}) =>
    UserStruct(
      email: email,
      firstName: firstName,
      institutionName: institutionName,
      isAdmin: isAdmin,
    );
