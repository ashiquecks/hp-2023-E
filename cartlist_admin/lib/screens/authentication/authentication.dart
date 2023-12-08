import 'package:cartlist_admin/functions/api_callfunction.dart';
import 'package:cartlist_admin/screens/main/main_screen.dart';
import 'package:flutter/material.dart';

class Authentication extends StatefulWidget {
  const Authentication({super.key});

  @override
  State<Authentication> createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  TextEditingController passwordControl = TextEditingController();
  final password = "8120";
  @override
  Widget build(BuildContext context) {
    final widgetSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Card(
        margin: const EdgeInsets.all(100),
        child: Padding(
          padding: const EdgeInsets.only(left: 60, right: 60),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 240,
                child: Image.asset('assets/images/main_logo.png'),
              ),
              const SizedBox(height: 40),
              TextFormField(
                textAlign: TextAlign.center,
                controller: passwordControl,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    hintText: "Enter Password"),
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 60,
                width: widgetSize.width,
                child: ElevatedButton(
                  child: const Text("LOGIN"),
                  onPressed: () {
                    if (password == passwordControl.text) {
                      getCategoryResponse(context: context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: ((context) => MainScreen()),
                        ),
                      );
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
