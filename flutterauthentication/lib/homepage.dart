import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title: const Text('Firebase Install' , style: TextStyle(
            color: Colors.orange
          ),),
          actions: [
            IconButton(onPressed: () async{
              await FirebaseAuth.instance.signOut();
              Navigator.of(context).pushNamedAndRemoveUntil("login", (route) =>false);
            }, icon: Icon(Icons.exit_to_app,color: Colors.black,))
          ],
        ),
        body: ListView(
          children: [
            // Text("How Are You", style: )
            FirebaseAuth.instance.currentUser!.emailVerified
              ?Text("welcome") 
                :MaterialButton(
                textColor: Colors.white,
                color:Colors.blue,
                onPressed: (){
                  FirebaseAuth.instance.currentUser!.sendEmailVerification();                },
                child:Text("pleasy verify email"))
          ],
        ));
  }
}
