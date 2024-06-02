import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jimoney_frontend/authentication/Login/bloc/login_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:jimoney_frontend/feature/common/application/boolean_cubit.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  static String path = "/login";

  @override
  Widget build(BuildContext context) {
    final TextEditingController _passwordController = TextEditingController();
    final TextEditingController _usernameController = TextEditingController();
    return BlocProvider<LoginBloc>(
      create: (_) => LoginBloc(),
      child: Scaffold(
        body: BlocListener<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state is LoginSuccess) {
              context.push("/home");
            } else if (state is LoginFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.error)),
              );
            }
          },
          child: Container(
            color: Color(0xFF559BCF),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(20, 50, 0, 0),
                  height: 370,
                  width: 350,
                  child: Scaffold(
                    body: Image(
                      image: AssetImage('lib/assets/logo.png'),
                    ),
                    backgroundColor: Color(0xFF559BCF),
                  ),
                ),
                BlocBuilder<LoginBloc, LoginState>(
                  builder: (context, state) {
                    return _usernameField(context, _usernameController);
                  },
                ),
                SizedBox(height: 20),
                BlocBuilder<LoginBloc, LoginState>(
                  builder: (context, state) {
                    return _passwordField(context, _passwordController);
                  },
                ),
                Container(
                  height: 50,
                  width: 350,
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.only(bottom: 30),
                  child: Text(
                    "Forget password?",
                    style: TextStyle(
                      decoration: TextDecoration.none,
                      fontSize: 13,
                      color: const Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                ),
                BlocBuilder<LoginBloc, LoginState>(
                  builder: (context, state) {
                    return ElevatedButton(
                      onPressed: state is LoginFormState && state.isFormValid
                          ? () {
                              BlocProvider.of<LoginBloc>(context).add(
                                LoginButtonPressed(
                                  username: _usernameController.text,
                                  password: _passwordController.text,
                                ),
                              );
                            }
                          : null,
                      child: Text(
                        "Login",
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(350, 50),
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        shadowColor: Colors.black,
                      ),
                    );
                  },
                ),
                Divider(
                  height: 60,
                  color: Colors.white,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account?",
                      style: TextStyle(
                        decoration: TextDecoration.none,
                        fontSize: 16,
                        color: Colors.grey.shade300,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 4.0),
                      child: TextButton(
                        onPressed: () {
                          context.push("/register");
                        },
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                            decoration: TextDecoration.none,
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _usernameField(
      BuildContext context, TextEditingController usernameController) {
    // final TextEditingController _usernameController = TextEditingController();

    return Container(
      height: 100,
      width: 350,
      alignment: Alignment.bottomCenter,
      child: TextField(
        controller: usernameController,
        autofillHints: const [AutofillHints.username],
        keyboardType: TextInputType.text,
        cursorColor: Colors.blue,
        onChanged: (value) {
          BlocProvider.of<LoginBloc>(context)
              .add(AccountChanged(username: value));
        },
        onEditingComplete: () {
          debugPrint("Username edit completed!");
          TextInput.finishAutofillContext();
        },
        decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none),
          fillColor: Colors.white,
          filled: true,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.blue, width: 4.0),
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          // floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: "Username",
          hintStyle: TextStyle(fontSize: 14),
        ),
      ),
    );
  }

  Widget _passwordField(
      BuildContext context, TextEditingController passwordController) {
    // final TextEditingController _passwordController = TextEditingController();

    return BlocProvider<BooleanCubit>(
      lazy: false,
      create: (_) => BooleanCubit(false),
      child: BlocBuilder<BooleanCubit, bool>(
        builder: (context, state) {
          return Container(
            height: 100,
            width: 350,
            alignment: Alignment.bottomCenter,
            child: Column(children: [
              TextField(
                controller: passwordController,
                autofillHints: const [AutofillHints.password],
                keyboardType: TextInputType.text,
                cursorColor: Colors.blue,
                onChanged: (value) {
                  BlocProvider.of<LoginBloc>(context)
                      .add(PasswordChanged(password: value));
                },
                onEditingComplete: () {
                  debugPrint("Password edit completed!");
                  TextInput.finishAutofillContext();
                },
                obscureText: !state,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none),
                    fillColor: Colors.white,
                    filled: true,
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.blue, width: 4.0)),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    hintText: "Password",
                    hintStyle: TextStyle(fontSize: 14),
                    suffixIcon: Padding(
                      padding: EdgeInsets.only(right: 6),
                      child: IconButton(
                        iconSize: 18,
                        onPressed: () {
                          context.read<BooleanCubit>().set(!state);
                        },
                        icon: Icon(
                          state ? Icons.visibility : Icons.visibility_off,
                          color: const Color(0xFF559BCF),
                        ),
                      ),
                    )),
              ),
            ]),
          );
        },
      ),
    );
  }
}
