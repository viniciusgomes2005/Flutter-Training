import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget{
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    final login=TextEditingController();
    final password=TextEditingController();
    final CollectionReference users = FirebaseFirestore.instance.collection("Users");

    createUser(BuildContext context){
      FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: login.text.trim(), password: password.text.trim()).then((user) => (
          users.doc(user.user!.uid).set(
            {"email":login.text.trim(),"username":login.text.trim()}
          )
        )
      );
    }
    loginUser(BuildContext context){
      FirebaseAuth.instance
        .signInWithEmailAndPassword(
          email: login.text.trim(),
          password: password.text.trim(),
        );
    }
    resetPassword(BuildContext context){
      FirebaseAuth.instance
        .sendPasswordResetEmail(email: login.text.trim()).then((value) => {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Email enviado"),
                behavior: SnackBarBehavior.floating,
                )
          )
        }
      );
    }
    return Scaffold(
      body: Column(
        children: [
          TextField(
            controller: login,
            decoration: const InputDecoration(
              labelText: "Email",
              border: OutlineInputBorder()
            ),
          ),
          TextField(
            controller: password,
            decoration: const InputDecoration(
              labelText: "Password",
              border: OutlineInputBorder()
            ),
          ),
          Row(
            children: [
              SizedBox(
                height: 50,
                width: 120,
                child: ElevatedButton(
                  onPressed: () {
                    loginUser(context);
                  },
                  child:const Text("Login"),
                ),
              ),
              SizedBox(
                height: 50,
                width: 120,
                child: ElevatedButton(
                  onPressed: () {
                    createUser(context);
                  },
                  child:const Text("Sign Up"),
                ),
              )
            ],
          ),
          SizedBox(
            width: 100,
            height: 40,
            child:
            ElevatedButton(
              child: const Text("Forgot my password"),
              onPressed: () {
                resetPassword(context);
              },
            ),
          )
        ],
      ),
    );
  }
}