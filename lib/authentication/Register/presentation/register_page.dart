import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:jimoney_frontend/authentication/Register/bloc/register_bloc.dart';
import 'package:jimoney_frontend/feature/common/application/boolean_cubit.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  static String path = "/register";

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nicknameController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  // @override
  // Future<void> _register() async {
  //   final String baseUrl = 'http://54.179.125.22:5000/user/insert_acc_password';
  //   final String username = _usernameController.text;
  //   final String password = _passwordController.text;
  //   final String nickname = _nicknameController.text;
  //   final String confirmPassword = _confirmPasswordController.text;
  //   final String apiUrl =
  //       '$baseUrl?user_acc=$username&user_name=$nickname&user_password=$password';

  //   if (password != confirmPassword) {
  //     print('Password and ConfirmPassword is not the same');
  //     return;
  //   }

  //   print(_usernameController.text);
  //   print(_passwordController.text);
  //   print(_nicknameController.text);
  //   print(_confirmPasswordController.text);

  //   final response = await http.post(
  //     Uri.parse(apiUrl),
  //     headers: <String, String>{
  //       'Content-Type': 'application/json; charset=UTF-8',
  //     },
  //     body: jsonEncode(<String, String>{
  //       'UName': _usernameController.text,
  //       'UPassword': _passwordController.text,
  //       'UNickname': _nicknameController.text,
  //       'UConfirmPassword': _confirmPasswordController.text,
  //     }),
  //   );

  //   print(response);
  //   if (response.statusCode == 200) {
  //     print("123456");
  //     if (response.body == 'success!') {
  //       print('Register success');
  //       context.push("/login");
  //     }
  //     // 在这里可以处理登录成功后的逻辑，例如导航到另一个页面
  //     else {
  //       print('Register failed: ${response.body}');
  //       // 显示错误信息
  //     }
  //   } else {
  //     print('Server error: ${response.statusCode}');
  //     // 处理服务器错误
  //   }
  //   print(response.statusCode);
  // }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterBloc(),
      child: Scaffold(
        body: BlocListener<RegisterBloc, RegisterState>(
          listener: (context, state) {
            if (state is RegisterSuccess) {
              context.push("/login");
            } else if (state is RegisterFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.error)),
              );
            }
          },
          child: Container(
            height: double.maxFinite,
            color: Color(0xFF559BCF),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(70, 30, 0, 0),
                  height: 240,
                  width: 350,
                  child: Scaffold(
                    body: Image(
                      image: AssetImage('lib/assets/logo.png'),
                    ),
                    backgroundColor: Color(0xFF559BCF),
                  ),
                ),
                BlocBuilder<RegisterBloc, RegisterState>(
                  builder: (context, state) {
                    return Column(
                      children: [
                        _usernameField(_usernameController, context),
                        _nicknameField(_nicknameController, context),
                        Container(
                            height: 30,
                            width: 350,
                            alignment: Alignment.topLeft,
                            padding: EdgeInsets.fromLTRB(3, 12, 0, 0),
                            child: Text(
                              "顯示於Personal Page 日後可做更改",
                              style: TextStyle(
                                  decoration: TextDecoration.none,
                                  fontSize: 13,
                                  color: Colors.black),
                            )),
                        // Password
                        _passwordField(_passwordController, context),
                        _confirmPasswordField(
                            _confirmPasswordController, context),
                      ],
                    );
                  },
                ),
                // Register Button
                BlocBuilder<RegisterBloc, RegisterState>(
                  builder: (context, state) {
                    return ElevatedButton(
                      onPressed:
                          state is RegisterFormState && state.isRFormValid
                              ? () {
                                  BlocProvider.of<RegisterBloc>(context).add(
                                    RegisterButtonPressed(
                                      username: _usernameController.text,
                                      nickname: _nicknameController.text,
                                      password: _passwordController.text,
                                      confirmPassword:
                                          _confirmPasswordController.text,
                                    ),
                                  );
                                }
                              : null,
                      child: Text(
                        "Register",
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
                  height: 50,
                  color: Colors.white,
                ),
                // bottom text
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Already have an account?",
                      style: TextStyle(
                        decoration: TextDecoration.none,
                        fontSize: 13,
                        color: Colors.black,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        context.pop();
                      },
                      child: Text(
                        "Sign In",
                        style: TextStyle(
                          decoration: TextDecoration.none,
                          fontSize: 13,
                          color: Colors.black,
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
}

Widget _usernameField(
    final TextEditingController _usernameController, BuildContext context) {
  return Container(
    height: 100,
    width: 350,
    alignment: Alignment.bottomCenter,
    child: TextField(
      controller: _usernameController,
      autofillHints: const [AutofillHints.username],
      keyboardType: TextInputType.text,
      cursorColor: Colors.blue,
      onChanged: (value) {
        BlocProvider.of<RegisterBloc>(context)
            .add(UsernameChanged(username: value));
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

Widget _nicknameField(
    final TextEditingController _nicknameController, BuildContext context) {
  return Container(
    height: 100,
    width: 350,
    alignment: Alignment.bottomCenter,
    child: TextField(
      controller: _nicknameController,
      autofillHints: const [AutofillHints.nickname],
      keyboardType: TextInputType.text,
      cursorColor: Colors.blue,
      onChanged: (value) {
        BlocProvider.of<RegisterBloc>(context)
            .add(NicknameChanged(nickname: value));
      },
      onEditingComplete: () {
        debugPrint("Nickname edit completed!");
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
        hintText: "Nickname",
        hintStyle: TextStyle(fontSize: 14),
      ),
    ),
  );
}

Widget _passwordField(
    final TextEditingController _passwordController, BuildContext context) {
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
              controller: _passwordController,
              autofillHints: const [AutofillHints.password],
              keyboardType: TextInputType.text,
              cursorColor: Colors.blue,
              onChanged: (value) {
                BlocProvider.of<RegisterBloc>(context)
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

Widget _confirmPasswordField(
    final TextEditingController _confirmpasswordController,
    BuildContext context) {
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
              controller: _confirmpasswordController,
              autofillHints: const [AutofillHints.password],
              keyboardType: TextInputType.text,
              cursorColor: Colors.blue,
              onChanged: (value) {
                BlocProvider.of<RegisterBloc>(context)
                    .add(ConfirmPasswordChanged(confirmPassword: value));
              },
              onEditingComplete: () {
                debugPrint("ConfirmPassword edit completed!");
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
                  hintText: "ConfirmPassword",
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
