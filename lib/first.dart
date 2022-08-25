import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class first extends StatefulWidget {
  const first({Key? key}) : super(key: key);

  @override
  State<first> createState() => _firstState();
}

class _firstState extends State<first> {

  TextEditingController t1 = TextEditingController();
  TextEditingController t2 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("App")),
      body: Column(
        children: [
          TextField(controller: t1),
          TextField(controller: t2),
          ElevatedButton(onPressed: () async {

            String temil = t1.text;
            String tpass = t2.text;
            try {
              final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                email: temil,
                password: tpass,
              );
            } on FirebaseAuthException catch (e) {
              if (e.code == 'weak-password') {
                print('The password provided is too weak.');
              } else if (e.code == 'email-already-in-use') {
                print('The account already exists for that email.');
              }
            } catch (e) {
              print(e);
            }


          }, child: Text("Registon"))
        ],
      ),

    );
  }
}
