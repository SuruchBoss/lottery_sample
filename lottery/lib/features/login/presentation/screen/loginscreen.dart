// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    Widget _logo() {
      return Image.asset(
        "assets/logo.png",
        fit: BoxFit.cover,
        width: screenWidth,
      );
    }

    Widget _userTextField() {
      return const SizedBox(
        width: 250,
        child: TextField(
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'admin',
            hintText: 'admin',
          ),
        ),
      );
    }

    Widget _passwordTextField() {
      return const SizedBox(
        width: 250,
        child: TextField(
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'password',
            hintText: 'admin',
          ),
        ),
      );
    }

    Widget _actionButton() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
                minimumSize: const Size(50, 30),
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                alignment: Alignment.centerLeft),
            child: const Text(
              "Login",
              style: TextStyle(
                fontSize: 27,
                color: Colors.blueAccent,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context),
            style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
                minimumSize: const Size(50, 30),
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                alignment: Alignment.centerLeft),
            child: const Text(
              "Clear",
              style: TextStyle(
                fontSize: 27,
                color: Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      );
    }

    return Scaffold(
      body: Container(
        width: screenWidth,
        color: Colors.white,
        padding: const EdgeInsets.only(
          top: 150,
          left: 20,
          right: 20,
          bottom: 30,
        ),
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Column(children: [
            _logo(),
            const SizedBox(
              height: 55,
            ),
            _userTextField(),
            const SizedBox(
              height: 20,
            ),
            _passwordTextField(),
            const SizedBox(
              height: 60,
            ),
            _actionButton(),
          ]),
        ),
      ),
    );
  }
}
