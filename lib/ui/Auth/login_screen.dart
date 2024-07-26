import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_demo/Widgets/round_button.dart';
import 'package:firebase_demo/ui/Auth/posts/post_screen.dart';
import 'package:firebase_demo/ui/Auth/signup_screen.dart';
import 'package:firebase_demo/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  ValueNotifier<bool> _obsecurePassword = ValueNotifier<bool>(false);
  bool loading = false;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  FocusNode _emailfocusNode = FocusNode();
  FocusNode _passwordfocusNode = FocusNode();

  final FirebaseAuth _auth = FirebaseAuth.instance;

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

  void login() {
    setState(() {
      loading = true;
    });
    _auth
        .signInWithEmailAndPassword(
            email: emailController.text.toString(),
            password: passwordController.text.toString())
        .then((value) {
      setState(() {
        loading = false;
      });
      Utils().toastMessagae(value.user!.email.toString());
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => PostScreen(),
        ),
      );
    }).onError((error, stackTrace) {
      debugPrint(error.toString());
      Utils().toastMessagae(error.toString());
      setState(() {
        loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop();
        return true;
      },
      child: Scaffold(
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
                              _obsecurePassword.value =
                                  !_obsecurePassword.value;
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
              RoundButton(
                  loading: loading,
                  title: 'Login',
                  ontap: () {
                    login();
                  }),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account??"),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => SignUpScreen()));
                    },
                    child: Text("SignUp"),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
