import 'package:firebase_demo/Widgets/round_button.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  ValueNotifier<bool> _obsecurePassword = ValueNotifier<bool>(true);

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  FocusNode _emailfocusNode = FocusNode();
  FocusNode _passwordfocusNode = FocusNode();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    _emailfocusNode.dispose();
    _passwordfocusNode.dispose();
    _obsecurePassword.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text(
          "Login",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              focusNode: _emailfocusNode,
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: "Email",
                labelText: "Email",
                prefixIcon: Icon(Icons.email),
              ),
              // onFieldSubmitted: (value) {
              //   .fieldFocusChange(
              //       context, _emailfocusNode, _passwordfocusNode);
              // },
            ),
            ValueListenableBuilder(
                valueListenable: _obsecurePassword,
                builder: (context, value, child) {
                  return TextFormField(
                    controller: passwordController,
                    obscureText: _obsecurePassword.value,
                    obscuringCharacter: "*",
                    decoration: InputDecoration(
                      hintText: "password",
                      labelText: "password",
                      prefixIcon: Icon(Icons.lock_open_outlined),
                      suffixIcon: InkWell(
                          onTap: () {
                            _obsecurePassword.value = !_obsecurePassword.value;
                          },
                          child: _obsecurePassword.value
                              ? Icon(Icons.visibility_off_outlined)
                              : Icon(Icons.visibility)),
                    ),
                  );
                }),
            SizedBox(
              height: 10,
            ),
            RoundButton(title: 'Login', ontap: () {}),
          ],
        ),
      ),
    );
  }
}
