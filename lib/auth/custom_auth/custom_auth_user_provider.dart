import 'package:rxdart/rxdart.dart';

import '/backend/schema/structs/index.dart';
import 'custom_auth_manager.dart';

class AirQualAuthUser {
  AirQualAuthUser({
    required this.loggedIn,
    this.uid,
    this.userData,
  });

  bool loggedIn;
  String? uid;
  UserStruct? userData;
}

/// Generates a stream of the authenticated user.
BehaviorSubject<AirQualAuthUser> airQualAuthUserSubject =
    BehaviorSubject.seeded(AirQualAuthUser(loggedIn: false));
Stream<AirQualAuthUser> airQualAuthUserStream() => airQualAuthUserSubject
    .asBroadcastStream()
    .map((user) => currentUser = user);
