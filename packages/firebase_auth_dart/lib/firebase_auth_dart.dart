library firebase_auth_dart;

import 'package:firebase_auth_platform_interface/firebase_auth_platform_interface.dart';
import 'package:firebase_core/firebase_core.dart';

/// A Dart only implmentation of FirebaseAuth for managing Firebase users.
class FirebaseAuthDart extends FirebaseAuthPlatform {
  @override
  UserPlatform? currentUser;

  @override
  String? tenantId;

  @override
  FirebaseAuthPlatform delegateFor({required FirebaseApp app}) {
    // TODO: implement delegateFor
    throw UnimplementedError();
  }

  @override
  Future<void> applyActionCode(String code) {
    // TODO: implement applyActionCode
    throw UnimplementedError();
  }

  @override
  Stream<UserPlatform?> authStateChanges() {
    // TODO: implement authStateChanges
    throw UnimplementedError();
  }

  @override
  Future<ActionCodeInfo> checkActionCode(String code) {
    // TODO: implement checkActionCode
    throw UnimplementedError();
  }

  @override
  Future<void> confirmPasswordReset(String code, String newPassword) {
    // TODO: implement confirmPasswordReset
    throw UnimplementedError();
  }

  @override
  Future<UserCredentialPlatform> createUserWithEmailAndPassword(
      String email, String password) {
    // TODO: implement createUserWithEmailAndPassword
    throw UnimplementedError();
  }

  @override
  Future<List<String>> fetchSignInMethodsForEmail(String email) {
    // TODO: implement fetchSignInMethodsForEmail
    throw UnimplementedError();
  }

  @override
  Future<UserCredentialPlatform> getRedirectResult() {
    // TODO: implement getRedirectResult
    throw UnimplementedError();
  }

  @override
  Stream<UserPlatform?> idTokenChanges() {
    // TODO: implement idTokenChanges
    throw UnimplementedError();
  }

  @override
  bool isSignInWithEmailLink(String emailLink) {
    // TODO: implement isSignInWithEmailLink
    throw UnimplementedError();
  }

  @override
  // TODO: implement languageCode
  String? get languageCode => throw UnimplementedError();

  @override
  void sendAuthChangesEvent(String appName, UserPlatform? userPlatform) {
    // TODO: implement sendAuthChangesEvent
  }

  @override
  Future<void> sendPasswordResetEmail(String email,
      [ActionCodeSettings? actionCodeSettings]) {
    // TODO: implement sendPasswordResetEmail
    throw UnimplementedError();
  }

  @override
  Future<void> sendSignInLinkToEmail(
      String email, ActionCodeSettings actionCodeSettings) {
    // TODO: implement sendSignInLinkToEmail
    throw UnimplementedError();
  }

  @override
  FirebaseAuthPlatform setInitialValues(
      {Map<String, dynamic>? currentUser, String? languageCode}) {
    // TODO: implement setInitialValues
    throw UnimplementedError();
  }

  @override
  Future<void> setLanguageCode(String languageCode) {
    // TODO: implement setLanguageCode
    throw UnimplementedError();
  }

  @override
  Future<void> setPersistence(Persistence persistence) {
    // TODO: implement setPersistence
    throw UnimplementedError();
  }

  @override
  Future<void> setSettings(
      {bool? appVerificationDisabledForTesting,
      String? userAccessGroup,
      String? phoneNumber,
      String? smsCode,
      bool? forceRecaptchaFlow}) {
    // TODO: implement setSettings
    throw UnimplementedError();
  }

  @override
  Future<UserCredentialPlatform> signInAnonymously() {
    // TODO: implement signInAnonymously
    throw UnimplementedError();
  }

  @override
  Future<UserCredentialPlatform> signInWithCredential(
      AuthCredential credential) {
    // TODO: implement signInWithCredential
    throw UnimplementedError();
  }

  @override
  Future<UserCredentialPlatform> signInWithCustomToken(String token) {
    // TODO: implement signInWithCustomToken
    throw UnimplementedError();
  }

  @override
  Future<UserCredentialPlatform> signInWithEmailAndPassword(
      String email, String password) {
    // TODO: implement signInWithEmailAndPassword
    throw UnimplementedError();
  }

  @override
  Future<UserCredentialPlatform> signInWithEmailLink(
      String email, String emailLink) {
    // TODO: implement signInWithEmailLink
    throw UnimplementedError();
  }

  @override
  Future<ConfirmationResultPlatform> signInWithPhoneNumber(String phoneNumber,
      RecaptchaVerifierFactoryPlatform applicationVerifier) {
    // TODO: implement signInWithPhoneNumber
    throw UnimplementedError();
  }

  @override
  Future<UserCredentialPlatform> signInWithPopup(AuthProvider provider) {
    // TODO: implement signInWithPopup
    throw UnimplementedError();
  }

  @override
  Future<void> signInWithRedirect(AuthProvider provider) {
    // TODO: implement signInWithRedirect
    throw UnimplementedError();
  }

  @override
  Future<void> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }

  @override
  Future<void> useAuthEmulator(String host, int port) {
    print('Hi!');

    return Future.value();
  }

  @override
  Stream<UserPlatform?> userChanges() {
    // TODO: implement userChanges
    throw UnimplementedError();
  }

  @override
  Future<String> verifyPasswordResetCode(String code) {
    // TODO: implement verifyPasswordResetCode
    throw UnimplementedError();
  }

  @override
  Future<void> verifyPhoneNumber(
      {required String phoneNumber,
      required PhoneVerificationCompleted verificationCompleted,
      required PhoneVerificationFailed verificationFailed,
      required PhoneCodeSent codeSent,
      required PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout,
      Duration timeout = const Duration(seconds: 30),
      int? forceResendingToken,
      String? autoRetrievedSmsCodeForTesting}) {
    // TODO: implement verifyPhoneNumber
    throw UnimplementedError();
  }
}