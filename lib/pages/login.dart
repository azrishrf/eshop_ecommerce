import 'package:eshop_ecommerce/pages/widgets/text_field_login.dart';
import 'package:eshop_ecommerce/palette.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      // backgroundColor: Colors.blue[900],
      body: SafeArea(
          child: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF1C2B3E), Color(0xFF0B111A) // Light blue at the bottom
          ],
        )),
        child: Form(
          // key: _formKey,

          child: Container(
            alignment: Alignment.center,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Title
                      Text("TODAK eShop",
                          style: Theme.of(context).textTheme.displayLarge),
                      const SizedBox(height: 20),
                      Text("Welcome to Todak eShop. Let’s shop!",
                          style: Theme.of(context).textTheme.bodyMedium),
                      // Logo
                      Image.asset('assets/images/todak_logo.png'),
                      // Email
                      const TextFieldLogin(
                        labelText: "Email",
                        icon: Icons.person,
                      ),
                      const SizedBox(height: 20),
                      // Password
                      const TextFieldLogin(
                        labelText: "Password",
                        icon: Icons.key,
                      ),
                      SizedBox(height: 40),
                      TextButton(
                        style: const ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Palette.white),
                          padding: MaterialStatePropertyAll(
                              EdgeInsets.symmetric(
                                  horizontal: 120, vertical: 15)),
                          shape:
                              MaterialStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          )),
                        ),
                        onPressed: () {
                          print('Button pressed!');
                        },
                        child: Text("LOGIN",
                            style: Theme.of(context).textTheme.displayMedium),
                      ),
                    ]),
              ),
            ),
          ),
        ),
      )),
    );
  }
}
