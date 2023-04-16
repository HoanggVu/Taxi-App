
import 'package:doantaxi/src/resources/dialog/loading.dart';
import 'package:doantaxi/src/resources/dialog/mess_error.dart';
import 'package:doantaxi/src/resources/home_page.dart';
import 'package:flutter/material.dart';

import '../check/check_info.dart';



class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  CheckInfo checkInfo = new CheckInfo();

  TextEditingController _nameController = new TextEditingController();
  TextEditingController _phoneController = new TextEditingController();
  TextEditingController _gmailController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();

  @override
  void dispose() {
    checkInfo.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Color(0xff3277D8)),
        elevation: 0,
      ),
      body: Container(
        padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
        constraints: const BoxConstraints.expand(),
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 80,
              ),
              //Image.asset("car.png"),
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 40, 0, 6),
                child: Text(
                  "Wellcome 3 Chị Em!",
                  style: TextStyle(fontSize: 22, color: Color(0xff333333)),
                ),
              ),
              const Text(
                "Đăng Ký Ngay Đi Nào",
                style: TextStyle(fontSize: 16, color: Color(0xff606470)),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 80, 0, 20),
                child: StreamBuilder(
                    stream: checkInfo.nameStream,
                    builder: (context, snapshot) => TextField(
                      controller: _nameController,
                      style: const TextStyle(
                          color: Colors.black, fontSize: 18),
                      decoration: InputDecoration(
                        errorText: snapshot.error?.toString(),
                        labelText: "Name",
                        prefixIcon: Container(
                          width: 50,
                          //  child: Image.asset("lock.png"),
                        ),
                        border: const OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(0xffCED0D2), width: 1),
                            borderRadius:
                            BorderRadius.all(Radius.circular(6))),
                      ),
                    )),
              ),
              StreamBuilder(
                  stream: checkInfo.phoneStream,
                  builder: (context, snapshot) => TextField(
                    controller: _phoneController,
                    style:
                    const TextStyle(fontSize: 18, color: Colors.black),
                    decoration: InputDecoration(
                        errorText: snapshot.error?.toString(),
                        labelText: "Phone",
                        prefixIcon: Container(
                          width: 50,
                          //  child: Image.asset("lock.png"),
                        ),
                        border: const OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(0xffCED0D2), width: 1),
                            borderRadius:
                            BorderRadius.all(Radius.circular(6)))),
                  )),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                child: StreamBuilder(
                    stream: checkInfo.gmailStream,
                    builder: (context, snapshot) => TextField(
                      controller: _gmailController,
                      style: const TextStyle(
                          color: Colors.black, fontSize: 18),
                      decoration: InputDecoration(
                        errorText: snapshot.error?.toString(),
                        labelText: "Gmail",
                        prefixIcon: Container(
                          width: 50,
                          //  child: Image.asset("lock.png"),
                        ),
                        border: const OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(0xffCED0D2), width: 1),
                            borderRadius:
                            BorderRadius.all(Radius.circular(6))),
                      ),
                    )),
              ),
              StreamBuilder(
                  stream: checkInfo.passwordStream,
                  builder: (context, snapshot) => TextField(
                    controller: _passwordController,
                    style:
                    const TextStyle(fontSize: 18, color: Colors.black),
                    obscureText: true,
                    decoration: InputDecoration(
                        errorText: snapshot.error?.toString(),
                        labelText: "Password",
                        prefixIcon: Container(
                          width: 50,
                          //  child: Image.asset("lock.png"),
                        ),
                        border: const OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(0xffCED0D2), width: 1),
                            borderRadius:
                            BorderRadius.all(Radius.circular(6)))),
                  )),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 30, 0, 40),
                child: SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: FilledButton(
                    onPressed: _onSignUpClick,
                    child: const Text(
                      'Signup',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                child: RichText(
                  text: const TextSpan(
                      text: "Already a User? ",
                      style: TextStyle(color: Color(0xff606470), fontSize: 16),
                      children: <TextSpan>[
                        TextSpan(
                            text: "Login now",
                            style: TextStyle(
                                color: Color(0xff3277D8), fontSize: 16))
                      ]),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _onSignUpClick() {
    print("Check");
    var checkValid = checkInfo.isValid(_nameController.text, _phoneController.text, _gmailController.text, _passwordController.text);
    if (checkValid) {
      LoadingDialog.showLoadingDialog(context, "Loading...");
      checkInfo.signUp(_gmailController.text, _passwordController.text, _nameController.text, _phoneController.text, () {
        LoadingDialog.hideShowDialog(context);
        Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
      }, (msg) {
          LoadingDialog.hideShowDialog(context);
          MessErrorDialog.showMessErrorDialog(context, "Sign-in", msg);
      });
    }
  }
}
