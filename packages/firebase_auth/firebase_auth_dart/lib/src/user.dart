// ignore_for_file: require_trailing_commas

part of firebase_auth_dart;

/// User object wrapping the responses from identity toolkit.
class User {
  /// Return a dart user object from Google's identity toolkit response.
  User(this._user, this._auth) : _idToken = _user['idToken'];

  final Auth _auth;
  final Map<String, dynamic> _user;
  final String _idToken;

  /// Returns a JWT refresh token for the user.
  ///
  /// This property maybe `null` or empty if the underlying platform does not
  /// support providing refresh tokens.
  String? get refreshToken {
    return _user['refreshToken'];
  }

  /// Deletes and signs out the user.
  ///
  /// **Important**: this is a security-sensitive operation that requires the
  /// user to have recently signed in. If this requirement isn't met, ask the
  /// user to authenticate again and then call [User.reauthenticateWithCredential].
  ///
  /// A [AuthException] maybe thrown with the following error code:
  ///
  Future<void> delete() async {
    try {
      await _auth._api.delete(_idToken, uid);
      await _auth.signOut();
    } catch (e) {
      throw _auth.getException(e);
    }
  }

  /// Returns a JSON Web Token (JWT) used to identify the user to a Firebase
  /// service.
  ///
  /// Returns the current token if it has not expired. Otherwise, this will
  /// refresh the token and return a new one.
  ///
  /// If [forceRefresh] is `true`, the token returned will be refresh regardless
  /// of token expiration.
  Future<String?> getIdToken([bool forceRefresh = false]) async {
    await _refreshIdToken(forceRefresh);

    return _idToken;
  }

  /// Returns a [IdTokenResult] containing the users JSON Web Token (JWT) and
  /// other metadata.
  ///
  /// If [forceRefresh] is `true`, the token returned will be refresh regardless
  /// of token expiration.
  Future<IdTokenResult> getIdTokenResult([bool forceRefresh = false]) async {
    await _refreshIdToken(forceRefresh);

    return IdTokenResult(_idToken.decodeJWT);
  }

  Future _refreshIdToken(bool forceRefresh) async {
    if (forceRefresh || _idToken.expirationTime.isBefore(DateTime.now())) {
      _user['idToken'] = await _auth.refreshIdToken();
      _auth._idTokenChangedController.add(this);
    }
  }

  /// The unique id of a user.
  String get uid {
    return _user['localId'];
  }

  /// The users email address.
  ///
  /// Will be `null` if signing in anonymously.
  String? get email {
    return _user['email'];
  }

  /// Returns whether the users email address has been verified.
  ///
  /// To send a verification email, see [sendEmailVerification].
  ///
  /// Once verified, call [reload] to ensure the latest user information is
  /// retrieved from Firebase.
  bool get emailVerified {
    return _user['emailVerified'];
  }

  /// Returns whether the user is a anonymous.
  bool get isAnonymous {
    return _user['isAnonymous'];
  }

  /// The users display name.
  ///
  /// Will be `null` if signing in anonymously or via password authentication.
  String? get displayName {
    return _user['displayName'];
  }

  /// The photo URL of a user, could be `null`.
  String? get photoURL {
    return _user['photoUrl'];
  }

  /// Re-authenticates a user using a fresh credential.
  ///
  /// Use before operations such as [User.updatePassword] that require tokens
  /// from recent sign-in attempts.
  ///
  /// A [AuthException] maybe thrown with the following error code:
  ///
  void reauthenticateWithCredential(AuthCredential credential) {
    throw UnimplementedError('updateEmail() is not implemented');
  }

  /// Refreshes the current user, if signed in.
  Future<void> reload() async {
    _assertSignedIn(_auth);

    _user.addAll(await _auth.reloadCurrentUser(_idToken));
    _auth.updateCurrentUserAndEvents(_auth.currentUser);
  }

  /// Updates the user's email address.
  ///
  /// An email will be sent to the original email address (if it was set) that
  /// allows to revoke the email address change, in order to protect them from
  /// account hijacking.
  ///
  /// **Important**: this is a security sensitive operation that requires the
  /// user to have recently signed in. If this requirement isn't met, ask the
  /// user to authenticate again and then call [User.reauthenticateWithCredential].
  ///
  /// A [AuthException] maybe thrown with the following error code:
  ///
  Future<void> updateEmail(String newEmail) async {
    _assertSignedIn(_auth);

    await _auth.updateEmail(newEmail, _idToken);
    await reload();
  }

  /// Updates the user's password.
  ///
  /// **Important**: this is a security sensitive operation that requires the
  ///   user to have recently signed in. If this requirement isn't met, ask the
  ///   user to authenticate again and then call [User.reauthenticateWithCredential].
  ///
  /// A [AuthException] maybe thrown with the following error code:
  ///
  Future<void> updatePassword(String newPassword) async {
    throw UnimplementedError('updatePassword() is not implemented');
  }

  /// Update the user name.
  Future<void> updateDisplayName(String displayName) async {
    _assertSignedIn(_auth);

    await _auth.updateProfile({'displayName': displayName}, _idToken);
    await reload();
  }

  /// Update the user's profile picture.
  Future<void> updatePhotoURL(String photoURL) async {
    _assertSignedIn(_auth);

    await _auth.updateProfile({'photoURL': photoURL}, _idToken);
    await reload();
  }

  /// A Map representation of this instance.
  Map<String, dynamic> toMap() => {
        'idToken': _idToken,
        'uid': uid,
        'email': email,
        'displayName': displayName,
        'photoURL': photoURL,
      };
}

@protected
void _assertSignedIn(Auth instance) {
  if (instance.currentUser != null) {
    return;
  } else {
    throw AuthException.fromErrorCode(ErrorCode.userNotSignedIn);
  }
}
