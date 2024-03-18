// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottery/features/login/business_logic/login_bloc.dart';
import 'package:lottery/features/market/presentation/marketscreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();

  void _handleLogin(BuildContext context) {
    context.read<LoginBloc>().add(
          LoginEvent.login(
            userName: userNameController.text,
            password: passwordController.text,
          ),
        );
    final state = context.read<LoginBloc>().state;

    bool isSuccess = state.maybeWhen(
      success: (
        userName,
        password,
        error,
        isSuccess,
      ) =>
          isSuccess,
      orElse: () => false,
    );

    if (isSuccess) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const MarketScreen(),
        ),
      );
    }
  }

  void _clear(BuildContext context) {
    context.read<LoginBloc>().add(
          const LoginEvent.clear(),
        );
    userNameController.clear();
    passwordController.clear();
  }

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

    return BlocProvider(
      create: (context) => LoginBloc(),
      child: Scaffold(
        body: BlocBuilder<LoginBloc, LoginState>(
          builder: (context, state) {
            return state.map(
              success: (value) {
                return Container(
                  width: screenWidth,
                  color: Colors.white,
                  padding: const EdgeInsets.only(
                    top: 130,
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
                      SizedBox(
                        width: 250,
                        child: TextField(
                          controller: userNameController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'admin',
                            hintText: 'admin',
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: 250,
                        child: TextField(
                          controller: passwordController,
                          keyboardType: TextInputType.text,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'password',
                            hintText: 'admin',
                          ),
                        ),
                      ),
                      SizedBox(
                        height: state.error!.isNotEmpty ? 20 : 0,
                      ),
                      Text(
                        state.error!,
                        style: const TextStyle(color: Colors.red),
                      ),
                      const SizedBox(
                        height: 100,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          TextButton(
                            onPressed: () => _handleLogin(context),
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
                            onPressed: () => _clear(context),
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
                      ),
                    ]),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
