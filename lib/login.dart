import 'package:flutter/material.dart';
import 'functions.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class MyLogin extends StatefulWidget {
  const MyLogin({Key? key}) : super(key: key);

  @override
  State<MyLogin> createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> with SingleTickerProviderStateMixin {
  final formKey = GlobalKey<FormState>(); //key for form
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.grey[800],
      //   elevation: 0,
      //   title: const Text(
      //     'Stellar Study',
      //     style: TextStyle(
      //       color: Color.fromRGBO(252, 250, 250, 1),
      //       fontSize: 24,
      //       fontWeight: FontWeight.bold,
      //     ),
      //   ),
      // ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('loginRegisterImages/rocket_login.jpg'),
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
                          'Login',
                          textStyle: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 46, 45, 45),
                          ),
                          speed: const Duration(milliseconds: 120),
                        ),
                      ],
                      totalRepeatCount: 1, // set to 0 to play animation once
                      pause: const Duration(seconds: 1),
                    ),
                    AnimatedTextKit(
                      animatedTexts: [
                        TyperAnimatedText(
                          'Please sign in to Stellar Study.',
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
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          // The form is valid. Do something here, like logging in the user.
                        }
                      },
                      child: const Text('Login'),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, 'register');
                          },
                          child: const Text(
                            'Sign Up',
                            style: TextStyle(
                                decoration: null,
                                fontSize: 18,
                                color: Color.fromARGB(255, 112, 111, 109)),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, 'try');
                          },
                          child: const Text(
                            'Forgot Password',
                            style: TextStyle(
                                decoration: null,
                                fontSize: 18,
                                color: Color.fromARGB(255, 112, 111, 109)),
                          ),
                        ),
                      ],
                    ),
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
