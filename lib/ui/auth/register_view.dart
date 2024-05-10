import 'package:flutter/material.dart';
import 'package:ygyr/base/validators/form_validators.dart';
import 'package:ygyr/base/widgets/button/base_material_button_widget.dart';
import 'package:ygyr/base/widgets/text_field/base_password_field_widget.dart';
import 'package:ygyr/base/widgets/text_field/base_text_field_widget.dart';
import 'package:ygyr/base/widgets/toast.dart';
import 'package:ygyr/services/authentication_services.dart';
import 'package:ygyr/ui/auth/login_view.dart';
import 'package:ygyr/ui/home_view.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(height: 150),
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
                      controller: nameController,
                      labelText: 'Name',
                      validator: TextFieldValidator.validateNameField,
                    ),
                    BaseTextFieldWidget(
                      controller: emailController,
                      labelText: 'Email',
                      validator: TextFieldValidator.validateEmailField,
                    ),
                    BasePasswordFieldWidget(
                      controller: passwordController,
                      labelText: 'Password',
                      validator: (value) {
                        return validatePassword(value);
                      },
                    ),
                    BasePasswordFieldWidget(
                      controller: confirmPasswordController,
                      labelText: 'Confirm Password',
                      validator: (value) {
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    BaseMaterialButtonWidget(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            register();
                          }
                        },
                        text: 'Register'),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Already have an account? '),
                        GestureDetector(
                          child: const Text(
                            'Login',
                            style: TextStyle(
                              color: Colors.blue,
                            ),
                          ),
                          onTap: () {
                            FocusScopeNode currentFocus =
                                FocusScope.of(context);
                            if (!currentFocus.hasPrimaryFocus &&
                                currentFocus.focusedChild != null) {
                              currentFocus.focusedChild?.unfocus();
                            }
                            Navigator.push(
                              context,
                              PageRouteBuilder(
                                pageBuilder:
                                    (context, animation, secondaryAnimation) =>
                                        const LoginView(),
                              ),
                            );
                          },
                        )
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

  void register() {
    String email = emailController.text;
    String password = passwordController.text;

    AuthenticationServices().register(email, password).then((success) {
      if (success) {
        Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const HomeView(),
          ),
        );
      } else {
        Toast.show(
            context, "You have entered wrong credentials. Please try again.");
      }
    });
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  String? validateName(value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email.';
    }
    return null;
  }

  String? validateEmail(value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email.';
    }
    if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value)) {
      return 'Please enter a valid email.';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password.';
    }
    if (value.length < 8) {
      return 'Password should be greater than 8 characters.';
    }

    if (value != confirmPasswordController.text) {
      return 'Password and confirm password should match.';
    }
    return null;
  }
}
