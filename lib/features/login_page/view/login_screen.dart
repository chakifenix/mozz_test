import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mozz/services/auth/auth_service.dart';
import 'package:mozz/features/login_page/widgets/my_textfield.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  LoginScreen({super.key});

  void login(BuildContext context) async {
    // auth service
    final authService = AuthService();
    try {
      await authService.signInWithEmailPassword(
          _emailController.text, _passwordController.text);
    } catch (e) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text(e.toString()),
              ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyTextField(
                controller: _emailController,
                hintText: 'Email',
                obscureText: false,
              ),
              SizedBox(
                height: 10.h,
              ),
              MyTextField(
                obscureText: true,
                hintText: 'Password',
                controller: _passwordController,
              ),
              SizedBox(
                height: 20.h,
              ),
              ElevatedButton(
                  onPressed: () => login(context), child: Text('Войти'))
            ],
          ),
        ),
      ),
    );
  }
}
