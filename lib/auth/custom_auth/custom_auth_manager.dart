import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '/backend/schema/structs/index.dart';
import 'custom_auth_user_provider.dart';

export 'custom_auth_manager.dart';

const _kAuthTokenKey = '_auth_authentication_token_';
const _kRefreshTokenKey = '_auth_refresh_token_';
const _kTokenExpirationKey = '_auth_token_expiration_';
const _kUidKey = '_auth_uid_';
const _kUserDataKey = '_auth_user_data_';

class CustomAuthManager {
  // Auth session attributes
  String? authenticationToken;
  String? refreshToken;
  DateTime? tokenExpiration;
  // User attributes
  String? uid;
  UserStruct? userData;

  Future signOut() async {
    authenticationToken = null;
    refreshToken = null;
    tokenExpiration = null;
    uid = null;
    userData = null;
    // Update the current user.
    airQualMonitorAuthUserSubject.add(
      AirQualMonitorAuthUser(loggedIn: false),
    );
    persistAuthData();
  }

  Future<AirQualMonitorAuthUser?> signIn({
    String? authenticationToken,
    String? refreshToken,
    DateTime? tokenExpiration,
    String? authUid,
    UserStruct? userData,
  }) async =>
      _updateCurrentUser(
        authenticationToken: authenticationToken,
        refreshToken: refreshToken,
        tokenExpiration: tokenExpiration,
        authUid: authUid,
        userData: userData,
      );

  void updateAuthUserData({
    String? authenticationToken,
    String? refreshToken,
    DateTime? tokenExpiration,
    String? authUid,
    UserStruct? userData,
  }) {
    assert(
      currentUser?.loggedIn ?? false,
      'User must be logged in to update auth user data.',
    );

    _updateCurrentUser(
      authenticationToken: authenticationToken,
      refreshToken: refreshToken,
      tokenExpiration: tokenExpiration,
      authUid: authUid,
      userData: userData,
    );
  }

  AirQualMonitorAuthUser? _updateCurrentUser({
    String? authenticationToken,
    String? refreshToken,
    DateTime? tokenExpiration,
    String? authUid,
    UserStruct? userData,
  }) {
    this.authenticationToken = authenticationToken;
    this.refreshToken = refreshToken;
    this.tokenExpiration = tokenExpiration;
    uid = authUid;
    this.userData = userData;
    // Update the current user stream.
    final updatedUser = AirQualMonitorAuthUser(
      loggedIn: true,
      uid: authUid,
      userData: userData,
    );
    airQualMonitorAuthUserSubject.add(updatedUser);
    persistAuthData();
    return updatedUser;
  }

  late SharedPreferences _prefs;
  Future initialize() async {
    _prefs = await SharedPreferences.getInstance();

    try {
      authenticationToken = _prefs.getString(_kAuthTokenKey);
      refreshToken = _prefs.getString(_kRefreshTokenKey);
      tokenExpiration = _prefs.getInt(_kTokenExpirationKey) != null
          ? DateTime.fromMillisecondsSinceEpoch(
              _prefs.getInt(_kTokenExpirationKey)!)
          : null;
      uid = _prefs.getString(_kUidKey);
      userData = _prefs.getString(_kUserDataKey) != null
          ? UserStruct.fromSerializableMap(
              (jsonDecode(_prefs.getString(_kUserDataKey)!) as Map)
                  .cast<String, dynamic>(),
            )
          : null;
    } catch (e) {
      if (kDebugMode) {
        print('Error initializing auth: $e');
      }
      return;
    }

    final authTokenExists = authenticationToken != null;
    final tokenExpired =
        tokenExpiration != null && tokenExpiration!.isBefore(DateTime.now());
    final updatedUser = AirQualMonitorAuthUser(
      loggedIn: authTokenExists && !tokenExpired,
      uid: uid,
      userData: userData,
    );
    airQualMonitorAuthUserSubject.add(updatedUser);
  }

  void persistAuthData() {
    authenticationToken != null
        ? _prefs.setString(_kAuthTokenKey, authenticationToken!)
        : _prefs.remove(_kAuthTokenKey);
    refreshToken != null
        ? _prefs.setString(_kRefreshTokenKey, refreshToken!)
        : _prefs.remove(_kRefreshTokenKey);
    tokenExpiration != null
        ? _prefs.setInt(
            _kTokenExpirationKey, tokenExpiration!.millisecondsSinceEpoch)
        : _prefs.remove(_kTokenExpirationKey);
    uid != null ? _prefs.setString(_kUidKey, uid!) : _prefs.remove(_kUidKey);
    userData != null
        ? _prefs.setString(
            _kUserDataKey, jsonEncode(userData!.toSerializableMap()))
        : _prefs.remove(_kUserDataKey);
  }
}

AirQualMonitorAuthUser? currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
