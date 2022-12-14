import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sim_phone_captain/screens/home_screen/home_screen.dart';
import 'package:sim_phone_captain/screens/sign_up.dart';
import 'package:sim_phone_captain/ui_components/loading_screen_animation.dart';

import '../bloc/auth_cubit/sign_in_cubit/sign_in_cubit.dart';
import '../ui_components/show_snack_bar.dart';
import '../utils/navigation_controller/navigator_screen.dart';
import 'bottom_nav_bar_screen.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();

  Future<void> _onSignInButtonPressed(BuildContext context) async {
    if (_emailTextController.text.isEmpty) {
      showSnackBar(context, "Please Enter Email");
    }
    if (_passwordTextController.text.isEmpty) {
      showSnackBar(context, "Please Enter Password");
    } else {
      context.read<SignInCubit>().signInWithEmail(password: _passwordTextController.text, email: _emailTextController.text);
    }
  }
  bool visibility = false;

  void onVisIconPressed() {
    setState(() {
      visibility = !visibility;
    });
  }

  storeToken(String token) {
    GetStorage().write('token', token);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => SignInCubit(),
      child: BlocConsumer<SignInCubit, SignInState>(
        listener: (context, state) {
          if (state is SignInFailed) {
            showSnackBar(context, state.message);
          }
          if (state is SignInSuccessful) {
            showSnackBar(context, "Sign in Successfully", type: SnackBarType.success);

            storeToken(state.response!.data!.token!);
            Nav.pushAndRemoveAllRoute(context, const BottomNavigationBarScreen());
          }
        },
        builder: (context, state) {
          return LoadingScreenAnimation(
            isLoading: state is LoadingState,
            child: SafeArea(
              child: Scaffold(
                resizeToAvoidBottomInset: false,
                backgroundColor: Colors.white.withOpacity(0.8),
                body: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  child: Stack(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          Image(
                            width: size.width * 0.7,
                            height: size.width * 0.4,
                            image: const AssetImage("assets/images/simphonelogo.png"),
                          ),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, size.height * 0.0, 0, size.height * 0.04),
                            child: Text(
                              "Hello Again!",
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.grey.shade800, fontSize: size.height * 0.06, fontWeight: FontWeight.w700),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: size.width * 0.1, vertical: size.height * 0.02),
                            child: Text(
                              "Welcome Back You Have Been Missed!",
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.grey.shade800, fontSize: size.height * 0.03),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: size.width * 0.1, vertical: size.height * 0.01),
                            child: TextField(
                              controller: _emailTextController,
                              style: TextStyle(fontSize: size.height * 0.025),
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(size.height * 0.02),
                                hintText: "John123@mail.com",
                                hintStyle: TextStyle(
                                  fontSize: size.height * 0.025,
                                ),
                                border: const OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(15),
                                  ),
                                ),
                                filled: true,
                                fillColor: Colors.white,
                                label: Text(
                                  "Email",
                                  style: TextStyle(fontSize: size.height * 0.025),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(size.width * 0.1, size.height * 0.001, size.width * 0.1, size.height * 0.01),
                            child: TextField(
                              controller: _passwordTextController,
                              obscureText: visibility ? false : true,
                              style: TextStyle(fontSize: size.height * 0.025),
                              decoration: InputDecoration(
                                suffixIcon: InkWell(
                                  child: Icon(
                                    visibility ? Icons.visibility_off : Icons.visibility,
                                    size: size.height * 0.03,
                                  ),
                                  onTap: () {
                                    onVisIconPressed();
                                  },
                                ),
                                contentPadding: EdgeInsets.all(size.height * 0.02),
                                hintText: "xxxxx",
                                hintStyle: TextStyle(
                                  fontSize: size.height * 0.025,
                                ),
                                border: const OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(15),
                                  ),
                                ),
                                filled: true,
                                fillColor: Colors.white,
                                label: Text(
                                  "Password",
                                  style: TextStyle(fontSize: size.height * 0.025),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: size.width * 0.1, vertical: size.height * 0.025),
                            child: ElevatedButton(
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                backgroundColor: MaterialStateProperty.all(Colors.green.shade400),
                              ),
                              onPressed: () {
                                _onSignInButtonPressed(context);
                              },
                              child: Padding(
                                padding: EdgeInsets.all(size.height * 0.012),
                                child: Text(
                                  "Sign In",
                                  style: TextStyle(fontSize: size.height * 0.025),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: size.width * 0.1, vertical: size.height * 0.025),
                            child: ElevatedButton(
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                backgroundColor: MaterialStateProperty.all(Colors.green.shade400),
                              ),
                              onPressed: () {
                                Nav.push(context, const SignUp());
                              },
                              child: Padding(
                                padding: EdgeInsets.all(size.height * 0.012),
                                child: Text(
                                  "Add A Franchise",
                                  style: TextStyle(fontSize: size.height * 0.025),
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
        },
      ),
    );
  }
}
