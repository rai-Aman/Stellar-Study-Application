import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:production_project_application/main.dart';
import 'databaseHelper/connectionDB.dart';
import 'functions.dart';

class MyRegistration extends StatefulWidget {
  const MyRegistration({super.key});

  @override
  State<MyRegistration> createState() => _MyRegistrationState();
}

class _MyRegistrationState extends State<MyRegistration> {
  final formKey = GlobalKey<FormState>(); //key for form
  //Create a TextEditingController object:
  final List<TextEditingController> _userData =
      List.generate(5, (_) => TextEditingController());

  bool _obscureText = true;
  String? _password;
  String? _confirmPassword;
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
                    255, 255, 255, 0.7), // set alpha to 0.7 for 70% opacity
                borderRadius: BorderRadius.circular(20),
              ),
              child: Form(
                //added child form for needed features
                key: formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AnimatedTextKit(
                      animatedTexts: [
                        TyperAnimatedText(
                          'Create Account',
                          textStyle: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 46, 45, 45),
                          ),
                          speed: const Duration(milliseconds: 100),
                        ),
                      ],
                      totalRepeatCount: 1, // set to 1 to play animation once
                      pause: const Duration(seconds: 1),
                    ),
                    AnimatedTextKit(
                      animatedTexts: [
                        TyperAnimatedText(
                          'For Stellar Study.',
                          textStyle: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[700],
                          ),
                          speed: const Duration(milliseconds: 100),
                        ),
                      ],
                      repeatForever:
                          true, // set to true to repeat animation indefinitely
                      pause: const Duration(seconds: 1),
                    ),
                    const SizedBox(height: 30),
                    TextFormField(
                      controller: _userData[0],
                      decoration: const InputDecoration(
                        hintText: 'Name',
                      ),
                      keyboardType: TextInputType.name,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Enter your name';
                        }

                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: _userData[1],
                      decoration: const InputDecoration(
                        hintText: 'Enter your email',
                      ),
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) => validateEmail(value?.toLowerCase()),
                      autovalidateMode: AutovalidateMode
                          .onUserInteraction, // enable live validation
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: _userData[2],
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
                          connectionDB().main(_userData);
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
