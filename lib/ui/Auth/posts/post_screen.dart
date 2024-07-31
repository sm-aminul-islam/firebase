import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:firebase_demo/ui/Auth/add_screen.dart';
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

  final ref = FirebaseDatabase.instance.ref("Post");
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
      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: FirebaseAnimatedList(
                query: ref,
                itemBuilder: (
                  context,
                  snapshot,
                  animation,
                  index,
                ) {
                  return Container(
                    margin: EdgeInsets.only(bottom: 10, left: 5, right: 5),
                    decoration: BoxDecoration(
                      color: Colors.teal,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: ListTile(
                      iconColor: Colors.white,
                      tileColor: Colors.white,
                      textColor: Colors.white,
                      leading: Icon(Icons.description_outlined),
                      title: Text(snapshot.child('title').value.toString()),
                      trailing: Icon(Icons.delete_forever),
                      //contentPadding: EdgeInsets.all(5),
                    ),
                  );
                }),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => AddScreen(),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
