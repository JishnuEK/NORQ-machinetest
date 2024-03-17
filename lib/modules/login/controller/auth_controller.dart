import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:test16032024/common/general.dart';
import 'package:test16032024/local_storage/local_storage_cache.dart';
import 'package:test16032024/routes/app_routes.dart';

class AuthController extends GetxController {
  FirebaseAuth _auth = FirebaseAuth.instance;

  String get WidgetID => 'WidgetID';
  bool isLoading = false;
  User? userData;
  @override
  void onReady() {
    super.onReady();
    initializeAuth();
  }

  initializeAuth() async {
    await Future.delayed(const Duration(seconds: 2)).then((value) {
      redirect();
    });
  }

  redirect() async {
    if (LocalStorageCache.getUserCache() == null) {
      Get.offAllNamed(Routes.LOGIN);
    } else {
      Get.offAllNamed(Routes.HOME);
    }
  }

  void login(String email, String password) async {
    isLoading = (true);
    update([WidgetID]);
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      userData = userCredential.user;
      LocalStorageCache.saveUserCache(user: userCredential.user!);
      isLoading = (false);
      update([WidgetID]);
      redirect();
    } on FirebaseAuthException catch (e) {
      isLoading = (false);
      update([WidgetID]);
      CustomAlert.ErrorSnackbar(e.message ?? e.code, duration: 2000);
    }
  }

  void register(String email, String password) async {
    try {
      isLoading = (true);
      update([WidgetID]);
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      isLoading = (false);
      update([WidgetID]);
      Get.offAndToNamed(Routes.LOGIN);
    } on FirebaseAuthException catch (e) {
      isLoading = (false);
      update([WidgetID]);
      CustomAlert.ErrorSnackbar(e.message ?? e.code, duration: 2000);
    }
  }

  Future<void> signOut() async {
    LocalStorageCache.clearData();
    await _auth.signOut();
    Get.offAllNamed(Routes.LOGIN);
  }

  User? getCurrentUser() {
    return _auth.currentUser;
  }

  //VALIDATION
  FormValidation loginsaveValidation(String email, String pswd) {
    FormValidation res =
        FormValidation(true, "Successfully validated all fields");
    if (email == '') {
      res.status = false;
      res.message = "Enter Email";
      return res;
    }
    if (EmailValidator.validate(email) == false) {
      res.status = false;
      res.message = "Enter valid email";
      return res;
    }
    if (pswd == '') {
      res.status = false;
      res.message = "Enter Password";
      return res;
    }

    return res;
  }

  FormValidation RegisterSaveValidation(String email, String pswd) {
    FormValidation res =
        FormValidation(true, "Successfully validated all fields");
    if (email == '') {
      res.status = false;
      res.message = "Enter Email";
      return res;
    }
    if (EmailValidator.validate(email) == false) {
      res.status = false;
      res.message = "Enter valid email";
      return res;
    }
    if (pswd == '') {
      res.status = false;
      res.message = "Enter Password";
      return res;
    }
    if (pswd.length < 6) {
      res.status = false;
      res.message = "Password must contain 6 characters";
      return res;
    }
    return res;
  }
}
