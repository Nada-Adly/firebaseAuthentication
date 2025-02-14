import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterauthentication/components/custombutton.dart';
import 'package:flutterauthentication/homepage.dart';
import '../components/customlogoauth.dart';
import '../components/textformfield.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        child: ListView(
          // list view take full width , and you can't change the dimension of the child inside it so that to git rid of this we can add Column inside the list view directly
          children: [
            Form(
              key: formState,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 50,
                  ),
                  CustomLogoAuth(),
                  // Container(height: 20,),
                  SizedBox(height: 20),
                  Text(
                    "Register",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),

                  Text(
                    "Enter your personal information",
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    "Username",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomTextForm(
                      hintText: "Enter your name", myController: username, validator: (val){
                    if (val==0){
                      return "this field can;t be empty ";
                    }
                  },),
                  // SizedBox(height: 20),
                  SizedBox(height: 20),
                  Text(
                    "Email",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomTextForm(
                      hintText: "Enter your email", myController: email, validator: (val){
                    if (val==0){
                      return "this field can;t be empty ";
                    }
                  },),
                  SizedBox(height: 20),
                  Text(
                    "Password",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomTextForm(
                      hintText: "Enter your password", myController: password, validator: (val){
                    if (val==0){
                      return "this field can;t be empty ";
                    }
                  },),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            CustomButton(
              title: "Register",
              onPressed: () async {
               if (formState.currentState!.validate()){
                 try {
                   final credential = await FirebaseAuth.instance
                       .createUserWithEmailAndPassword(
                     email: email.text,
                     password: password.text,
                   );
                   FirebaseAuth.instance.currentUser!.sendEmailVerification();
                   Navigator.of(context).pushReplacementNamed("login");
                 }
                 on FirebaseAuthException catch (e) {
                   if (e.code == 'weak-password') {
                     // print('The password provided is too weak.');
                     AwesomeDialog(
                       context: context,
                       dialogType: DialogType.error,
                       animType: AnimType.rightSlide,
                       title: 'info',
                       desc: 'The password provided is too weak.',).show();
                   } else if (e.code == 'email-already-in-use') {
                     // print('The account already exists for that email.');
                     AwesomeDialog(
                       context: context,
                       dialogType: DialogType.error,
                       animType: AnimType.rightSlide,
                       title: 'info',
                       desc: 'The account already exists for that email.',).show();
                   }
                 } catch (e) {
                   print(e);
                 }
               }

              },
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).pushNamed("login");
              },
              child: Center(
                child: Text.rich(TextSpan(children: [
                  TextSpan(text: "Have an account? "),
                  TextSpan(
                      text: "Login",
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      )),
                ])),
              ),
            )
          ],
        ),
      ),
    );
  }
}
