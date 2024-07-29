import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_demo/ui/Auth/login_screen.dart';
import 'package:firebase_demo/utils/utils.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Post"),
        actions: [
          Center(child: Text("Signout")),
          IconButton(
              onPressed: () {
                auth.signOut().then((value) {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => LoginScreen(),
                    ),
                  );
                }).onError((error, stackTrace) {
                  Utils().toastMessagae(error.toString());
                });
              },
              icon: const Icon(Icons.logout_outlined))
        ],
      ),
    );
  }
}
