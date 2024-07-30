import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_demo/Widgets/round_button.dart';
import 'package:firebase_demo/ui/Auth/posts/post_screen.dart';
import 'package:firebase_demo/utils/utils.dart';
import 'package:flutter/material.dart';

class VerifyWithCode extends StatefulWidget {
  final String verificationId;

  const VerifyWithCode({super.key, required this.verificationId});

  @override
  State<VerifyWithCode> createState() => _VerifyWithCodeState();
}

class _VerifyWithCodeState extends State<VerifyWithCode> {
  bool loading = false;
  final verifyController = TextEditingController();
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Verify"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            TextFormField(
              controller: verifyController,
              keyboardType: TextInputType.number,
              decoration:
                  InputDecoration(hintText: "please enter 6 digits OTP number"),
            ),
            SizedBox(
              height: 80,
            ),
            RoundButton(
                title: "Verify",
                loading: loading,
                ontap: () async {
                  setState(() {
                    loading = true;
                  });
                  final credential = PhoneAuthProvider.credential(
                      verificationId: widget.verificationId,
                      smsCode: verifyController.text.toString());

                  try {
                    await auth.signInWithCredential(credential);
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => PostScreen()),
                    );
                  } catch (e) {
                    setState(() {
                      loading = false;
                    });
                    Utils().toastMessagae(e.toString());
                  }
                })
          ],
        ),
      ),
    );
  }
}
