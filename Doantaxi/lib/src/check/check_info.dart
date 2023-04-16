import 'dart:async';
import 'package:doantaxi/src/firebase/firebase.dart';

class CheckInfo {
  final _fireBase = Firebase();

  final StreamController _nameController = StreamController();
  final StreamController _phoneController = StreamController();
  final StreamController _gmailController = StreamController();
  final StreamController _passwordController = StreamController();

  Stream get nameStream => _nameController.stream;
  Stream get phoneStream => _phoneController.stream;
  Stream get gmailStream => _gmailController.stream;
  Stream get passwordStream => _passwordController.stream;

  bool isValid(String name, String phone, String gmail, String pass) {
    if (name == null || name.length == 0) {
      _nameController.sink.addError("Nhập Họ & Tên");
      return false;
    }
    _nameController.sink.add("");

    if (phone == null || phone.length == 0) {
      _phoneController.sink.addError("Nhập Số Điện Thoại");
      return false;
    }
    _phoneController.sink.add("");

    if (gmail == null || gmail.length == 0) {
      _gmailController.sink.addError("Nhập Gmail");
      return false;
    }
    _gmailController.sink.add("");

    if (pass == null || pass.length <= 6) {
      _passwordController.sink.addError("Nhập Password");
      return false;
    }
    _passwordController.sink.add("");

    return true;
  }

  void signUp(String gmail, String password, String name, String phone,
      Function onSuccess, Function(String) onRegisterError) {
      _fireBase.signUp(gmail, password, name, phone, onSuccess, onRegisterError);
  }

  void signIn(String gmail, String password, Function onSuccess, Function(String) onSignInError){
    _fireBase.signIn(gmail, password, onSuccess, onSignInError);
  }

  void dispose() {
    _nameController.close();
    _phoneController.close();
    _gmailController.close();
    _passwordController.close();
  }
}
