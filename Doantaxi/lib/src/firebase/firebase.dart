import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';


class Firebase {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  void signUp(String gmail, String password, String name, String phone,
      Function onSuccess, Function(String) onRegisterError) {
    _firebaseAuth
        .createUserWithEmailAndPassword(email: gmail, password: password)
        .then((user) {
      // success
      _createUser("", name, phone, onSuccess, onRegisterError);
      print(user);
    }).catchError((err) {
      _onSignUpError(err.code, onRegisterError);
    });
  }

  void signIn(String gmail, String password, Function onSuccess, Function(String) onSignInError){
    _firebaseAuth.signInWithEmailAndPassword(email: gmail, password: password).then((user) {
      print("on sign in success");
      onSuccess();
    }).catchError((err) {
      onSignInError("Sign-in fail, please try again");
    });
  }

  _createUser(String userId, String name, String phone, Function onSuccess, Function(String) onRegisterError) {
    var user = {"name" : name, "phone" : phone};

    final DatabaseReference ref = FirebaseDatabase.instance.reference().child("users");
    ref.child(name).set(user).then((v1) {

      onSuccess();
    }).catchError((err) {
      onRegisterError("Signup fail, please try again");
    });
  }
  void _onSignUpError(String code, Function(String) onRegisterError){
    switch(code){
      case "ERROR_INVALID_EMAIL":
      case "ERROR_INVALID_CREDENTIAL":
        onRegisterError("Invalid email");
        break;
      case "ERROR_EMAIL_ALREADY_IN_USER":
        onRegisterError("Email has existed");
        break;
      case "ERROR_WEAK_PASSWORD":
        onRegisterError("The password is not strong enough");
        break;
      default:
        onRegisterError("Signup fail, please try again");
        break;
    }
  }
}
