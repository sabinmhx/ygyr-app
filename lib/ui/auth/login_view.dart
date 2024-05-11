import 'package:flutter/material.dart';
import 'package:ygyr/base/layout/app.dart';
import 'package:ygyr/base/validators/form_validators.dart';
import 'package:ygyr/base/widgets/button/base_material_button_widget.dart';
import 'package:ygyr/base/widgets/text_field/base_password_field_widget.dart';
import 'package:ygyr/base/widgets/text_field/base_text_field_widget.dart';
import 'package:ygyr/base/widgets/toast.dart';
import 'package:ygyr/services/authentication_services.dart';
import 'package:ygyr/ui/auth/register_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginView> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  bool rememberMe = false;
  bool _isLoading = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(height: 200),
              Image.asset(
                'assets/images/logo.png',
                width: 200,
              ),
              Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BaseTextFieldWidget(
                      controller: emailController,
                      labelText: 'Email',
                      validator: TextFieldValidator.validateEmailField,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                    ),
                    const SizedBox(height: 20),
                    BasePasswordFieldWidget(
                      controller: passwordController,
                      validator: TextFieldValidator.validatePasswordField,
                      labelText: 'Password',
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Checkbox(
                              value: rememberMe,
                              onChanged: (value) {
                                setState(() {
                                  rememberMe = value ?? false;
                                });
                              },
                            ),
                            GestureDetector(
                              child: const Text('Remember me'),
                              onTap: () => {
                                setState(() {
                                  rememberMe = !rememberMe;
                                })
                              },
                            )
                          ],
                        ),
                        GestureDetector(
                          child: const Text('Forgot password?'),
                          onTap: () => {},
                        )
                      ],
                    ),
                    const SizedBox(height: 20),
                    BaseMaterialButtonWidget(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          setState(() {
                            _isLoading = true;
                          });
                          login();
                        }
                      },
                      isLoading: _isLoading,
                      text: 'Login',
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Don\'t have an account? '),
                        GestureDetector(
                          child: const Text(
                            'Register',
                            style: TextStyle(
                              color: Colors.blue,
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              PageRouteBuilder(
                                pageBuilder:
                                    (context, animation, secondaryAnimation) =>
                                        const RegisterView(),
                              ),
                            );
                          },
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void login() {
    if (formKey.currentState!.validate()) {
      String email = emailController.text;
      String password = passwordController.text;

      AuthenticationServices authService = AuthenticationServices();
      authService.login(email, password).then((success) {
        setState(() {
          _isLoading = false;
        });
        if (success) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const App(),
            ),
          );
          Toast.show(context, "Login successful");
        } else {
          Toast.show(
            context,
            "You have entered wrong credentials. Please try again.",
          );
        }
      });
    }
  }
}
