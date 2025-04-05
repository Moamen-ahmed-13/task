import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:task/core/routes/routes.dart';

class AuthController extends GetxController {
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  String? email, password, name;
  Rxn<User?> firebaseUser = Rxn<User>();

  String? get user => firebaseUser.value?.email;

  @override
  void onInit() {
    super.onInit();
    firebaseUser.bindStream(_firebaseAuth.authStateChanges());
    // if (firebaseUser.value != null) {
    //         getCurrentUserData(firebaseUser.value!.uid);

    // }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    GoogleSignInAuthentication googleAuth = await googleUser!.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    await _firebaseAuth
        .signInWithCredential(credential)
        .then((value) => Get.toNamed(Routes.homeScreen));
  }

  Future<void> signInWithEmailAndPassword() async {
    try {
      await _firebaseAuth
          .signInWithEmailAndPassword(
            email: email!,
            password: password!,
          )
          .then((value) => Get.toNamed(Routes.homeScreen));
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  Future<void> signOut() async {
    await _firebaseAuth
        .signOut()
        .then((value) => Get.toNamed(Routes.signinScreen));
  }

  Future<void> createUserWithEmailAndPassword() async {
    try {
      await _firebaseAuth
          .createUserWithEmailAndPassword(
            email: email!,
            password: password!,
          )
          .then((value) => Get.toNamed(Routes.homeScreen));
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }
}
