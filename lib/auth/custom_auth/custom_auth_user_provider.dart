import 'package:rxdart/rxdart.dart';

import '/backend/schema/structs/index.dart';
import 'custom_auth_manager.dart';

class AirQualMonitorAuthUser {
  AirQualMonitorAuthUser({
    required this.loggedIn,
    this.uid,
    this.userData,
  });

  bool loggedIn;
  String? uid;
  UserStruct? userData;
}

/// Generates a stream of the authenticated user.
BehaviorSubject<AirQualMonitorAuthUser> airQualMonitorAuthUserSubject =
    BehaviorSubject.seeded(AirQualMonitorAuthUser(loggedIn: false));
Stream<AirQualMonitorAuthUser> airQualMonitorAuthUserStream() =>
    airQualMonitorAuthUserSubject
        .asBroadcastStream()
        .map((user) => currentUser = user);
