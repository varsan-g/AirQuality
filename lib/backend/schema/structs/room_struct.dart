// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RoomStruct extends BaseStruct {
  RoomStruct({
    List<String>? co2,
    List<String>? temperatures,
    List<String>? humidities,
    String? roomName,
  })  : _co2 = co2,
        _temperatures = temperatures,
        _humidities = humidities,
        _roomName = roomName;

  // "co2" field.
  List<String>? _co2;
  List<String> get co2 => _co2 ?? const [];
  set co2(List<String>? val) => _co2 = val;

  void updateCo2(Function(List<String>) updateFn) {
    updateFn(co2 ??= []);
  }

  bool hasCo2() => _co2 != null;

  // "temperatures" field.
  List<String>? _temperatures;
  List<String> get temperatures => _temperatures ?? const [];
  set temperatures(List<String>? val) => _temperatures = val;

  void updateTemperatures(Function(List<String>) updateFn) {
    updateFn(temperatures ??= []);
  }

  bool hasTemperatures() => _temperatures != null;

  // "humidities" field.
  List<String>? _humidities;
  List<String> get humidities => _humidities ?? const [];
  set humidities(List<String>? val) => _humidities = val;

  void updateHumidities(Function(List<String>) updateFn) {
    updateFn(humidities ??= []);
  }

  bool hasHumidities() => _humidities != null;

  // "roomName" field.
  String? _roomName;
  String get roomName => _roomName ?? '';
  set roomName(String? val) => _roomName = val;

  bool hasRoomName() => _roomName != null;

  static RoomStruct fromMap(Map<String, dynamic> data) => RoomStruct(
        co2: getDataList(data['co2']),
        temperatures: getDataList(data['temperatures']),
        humidities: getDataList(data['humidities']),
        roomName: data['roomName'] as String?,
      );

  static RoomStruct? maybeFromMap(dynamic data) =>
      data is Map ? RoomStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'co2': _co2,
        'temperatures': _temperatures,
        'humidities': _humidities,
        'roomName': _roomName,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'co2': serializeParam(
          _co2,
          ParamType.String,
          isList: true,
        ),
        'temperatures': serializeParam(
          _temperatures,
          ParamType.String,
          isList: true,
        ),
        'humidities': serializeParam(
          _humidities,
          ParamType.String,
          isList: true,
        ),
        'roomName': serializeParam(
          _roomName,
          ParamType.String,
        ),
      }.withoutNulls;

  static RoomStruct fromSerializableMap(Map<String, dynamic> data) =>
      RoomStruct(
        co2: deserializeParam<String>(
          data['co2'],
          ParamType.String,
          true,
        ),
        temperatures: deserializeParam<String>(
          data['temperatures'],
          ParamType.String,
          true,
        ),
        humidities: deserializeParam<String>(
          data['humidities'],
          ParamType.String,
          true,
        ),
        roomName: deserializeParam(
          data['roomName'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'RoomStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is RoomStruct &&
        listEquality.equals(co2, other.co2) &&
        listEquality.equals(temperatures, other.temperatures) &&
        listEquality.equals(humidities, other.humidities) &&
        roomName == other.roomName;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([co2, temperatures, humidities, roomName]);
}

RoomStruct createRoomStruct({
  String? roomName,
}) =>
    RoomStruct(
      roomName: roomName,
    );
