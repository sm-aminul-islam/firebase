import 'package:firebase_demo/Widgets/round_button.dart';
import 'package:firebase_demo/ui/Auth/login_screen.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  ValueNotifier<bool> _obsecurePassword = ValueNotifier<bool>(false);

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
        title: Text(
          "SignUp",
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
            RoundButton(title: 'SignUp', ontap: () {}),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have an account??"),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => LoginScreen()));
                  },
                  child: Text("Login"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
