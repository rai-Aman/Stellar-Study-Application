import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'functions.dart';

class MyRegistration extends StatefulWidget {
  const MyRegistration({super.key});

  @override
  State<MyRegistration> createState() => _MyRegistrationState();
}

class _MyRegistrationState extends State<MyRegistration> {
  final formKey = GlobalKey<FormState>(); //key for form
  bool _obscureText = true;
  String? _password;
  String? _confirmPassword;
  // bool passwordMatch = false;
  // bool confirmPasswordMatch = false;

  // void _checkPasswordMatch() {
  //   setState(() {
  //     passwordMatch = _password == _confirmPassword;
  //   });
  // }

  // void _checkConfirmPasswordMatch() {
  //   setState(() {
  //     confirmPasswordMatch = _password == _confirmPassword;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('loginRegisterImages/aurora.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Container(
              width: 350,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color.fromRGBO(
                    255, 255, 255, 0.7), // set alpha to 0.8 for 80% opacity
                borderRadius: BorderRadius.circular(20),
              ),
              child: Form(
                //added child form for needed features
                key: formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Create Account',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'Name',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Enter your name';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'Enter your email',
                      ),
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) => validateEmail(value?.toLowerCase()),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      obscureText: _obscureText,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscureText
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: () {
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                        ),
                      ),
                      validator: (value) =>
                          validatePassword(value, _confirmPassword),
                      onSaved: (value) => _password = value,
                      onChanged: (value) {
                        setState(() {
                          _password = value;
                        });
                      },
                      autovalidateMode: AutovalidateMode
                          .onUserInteraction, // enable live validation
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      obscureText: _obscureText,
                      decoration: InputDecoration(
                        hintText: 'Confirm Password',
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscureText
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: () {
                            setState(() {
                              _obscureText = !_obscureText;
                            });
                          },
                        ),
                      ),
                      validator: (value) => validatePassword(value, _password),
                      onSaved: (value) => _confirmPassword = value,
                      onChanged: (value) {
                        setState(() {
                          _confirmPassword = value;
                        });
                      },
                      autovalidateMode: AutovalidateMode
                          .onUserInteraction, // enable live validation
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          // The form is valid. Do something here, like logging in the user.
                        }
                      },
                      child: const Text('Create'),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, 'login');
                            },
                            child: const Text(
                              'Already have Account?',
                              style: TextStyle(
                                  decoration: null,
                                  fontSize: 18,
                                  color: Color.fromARGB(255, 112, 111, 109)),
                            )),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
