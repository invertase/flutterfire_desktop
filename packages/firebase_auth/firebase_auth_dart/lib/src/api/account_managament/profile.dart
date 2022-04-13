part of api;

/// Class wrapping methods that calls to the following endpoints:
/// - `setAccountInfo`: change a user's displayName or photoUrl.
@protected
class UserProfile {
  // ignore: public_member_api_docs
  UserProfile(this._api);

  final API _api;

  /// TODO: write endpoint details
  Future<SetAccountInfoResponse> updateProfile(
    String idToken,
    String uid, {
    String? photoUrl = '',
    String? displayName = '',
  }) async {
    final _response = await _api.identityToolkit.setAccountInfo(
      IdentitytoolkitRelyingpartySetAccountInfoRequest(
        displayName: displayName == '' ? null : displayName,
        photoUrl: photoUrl == '' ? null : photoUrl,
        idToken: idToken,
        localId: uid,
        returnSecureToken: true,
        deleteAttribute: [
          if (photoUrl == null) 'PHOTO_URL',
          if (displayName == null) 'DISPLAY_NAME'
        ],
      ),
    );
    return _response;
  }
}