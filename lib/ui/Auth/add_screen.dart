import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_demo/Widgets/round_button.dart';
import 'package:firebase_demo/utils/utils.dart';
import 'package:flutter/material.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  bool loading = false;
  final databaseRef = FirebaseDatabase.instance.ref("Post");
  final addcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add"),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            TextFormField(
              controller: addcontroller,
              maxLines: 4,
              decoration: InputDecoration(
                  hintText: "What's going on your mind",
                  border: OutlineInputBorder()),
            ),
            SizedBox(
              height: 30,
            ),
            RoundButton(
                loading: loading,
                title: "ADD",
                ontap: () {
                  setState(() {
                    loading = true;
                  });
                  databaseRef
                      .child(DateTime.now().microsecondsSinceEpoch.toString())
                      .set(
                    {
                      'title': addcontroller.text.toString(),
                      'id': DateTime.now().microsecondsSinceEpoch.toString(),
                    },
                  ).then((value) {
                    setState(() {
                      loading = false;
                    });
                    Utils().toastMessagae("Post Added Successfully");
                  }).onError((error, stackTrace) {
                    setState(() {
                      loading = false;
                    });
                    Utils().toastMessagae(error.toString());
                  });
                }),
          ],
        ),
      ),
    );
  }
}
