import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mozz/features/chats_page/view/chats_screen.dart';
import 'package:mozz/features/login_page/view/login_screen.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        // user is logged in
        if (snapshot.hasData) {
          return ChatsScreen();
        }

        //user is NOT logged in
        else {
          return LoginScreen();
        }
      },
    ));
  }
}
