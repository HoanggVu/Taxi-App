import 'package:doantaxi/src/app.dart';
import 'package:doantaxi/src/resources/dialog/loading.dart';
import 'package:doantaxi/src/resources/dialog/mess_error.dart';
import 'package:doantaxi/src/resources/home_page.dart';
import 'package:doantaxi/src/resources/register_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _gmailController = TextEditingController();
  final TextEditingController _passwrodController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
        constraints: const BoxConstraints.expand(),
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 40,
              ),
              //Image.asset('car.png'),
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 40, 0, 6),
                child: Text(
                  "Taxi 3 Chị Em",
                  style: TextStyle(fontSize: 22, color: Color(0xff333333)),
                ),
              ),
              const Text(
                "Hân Hạnh Được Phục Vụ Bạn",
                style: TextStyle(fontSize: 16, color: Color(0xff606470)),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 145, 0, 20),
                child: TextField(
                  controller: _gmailController,
                  style: const TextStyle(fontSize: 18, color: Colors.black),
                  decoration: InputDecoration(
                      labelText: "Gmail",
                      prefixIcon: Container(
                        width: 50,
                        // child: Image.asset("phone.png"),
                      ),
                      border: const OutlineInputBorder(
                          borderSide:
                          BorderSide(color: Color(0xffCED0D2), width: 1),
                          borderRadius: BorderRadius.all(Radius.circular(6)))),
                ),
              ),
              TextField(
                controller: _passwrodController,
                style: const TextStyle(fontSize: 18, color: Colors.black),
                obscureText: true,
                decoration: InputDecoration(
                    labelText: "Password",
                    prefixIcon: Container(
                      width: 50,
                      //  child: Image.asset("lock.png"),
                    ),
                    border: const OutlineInputBorder(
                        borderSide:
                        BorderSide(color: Color(0xffCED0D2), width: 1),
                        borderRadius: BorderRadius.all(Radius.circular(6)))),
              ),
              Container(
                constraints:
                BoxConstraints.loose(const Size(double.infinity, 30)),
                alignment: AlignmentDirectional.centerEnd,
                child: const Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: Text(
                    "Forget password",
                    style: TextStyle(fontSize: 16, color: Color(0xff606470)),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 30, 0, 40),
                child: SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: FilledButton(
                    onPressed: _onLoginClick,
                    child: const Text(
                      'Login',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                child: RichText(
                  text: TextSpan(
                      text: "New user? ",
                      style: const TextStyle(
                          color: Color(0xff606470), fontSize: 16),
                      children: <TextSpan>[
                        TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      // ignore: non_constant_identifier_names
                                        builder: (Context) => RegisterPage()));
                              },
                            text: "Sign up for a new Account",
                            style: const TextStyle(
                                color: Color(0xff3277D8), fontSize: 16)),
                      ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onLoginClick(){
    String gmail = _gmailController.text;
    String password = _passwrodController.text;

    var checkInfo = MyApp.of(context)?.checkInfo;
    LoadingDialog.showLoadingDialog(context, "Loading...");
    checkInfo?.signIn(gmail, password, () {
      LoadingDialog.hideShowDialog(context);
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomePage()));
    }, (msg){
      LoadingDialog.hideShowDialog(context);
      MessErrorDialog.showMessErrorDialog(context, "Sign-in", msg);
    });
  }
}
