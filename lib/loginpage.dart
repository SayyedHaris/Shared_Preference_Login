import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences_example/homepage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  late SharedPreferences logindata;
  late bool newuser;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    check_if_already_login();
  }
   void check_if_already_login() async {
   logindata = await SharedPreferences.getInstance() ;
    newuser = (logindata.getBool("login") ?? true);

  if(newuser == false){
  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage(),));
  }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Shared Preferences")),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
                controller: emailController,
                decoration: InputDecoration(
                  hintText: "Email",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(15))
              ),
            ),
            SizedBox(height: 20,),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                  hintText: "Password",
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(15))
              ),
            ),
            SizedBox(height: 20,),
            TextButton(onPressed: () async {
              String username = emailController.text;
              String password = passwordController.text;

              if(username != '' && password !='') {
                logindata.setBool("login", false);

                logindata.setString("username", username);

                Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(),));
              }else{
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(

                    content: Text("Something went wrong!")));
              }

            }, child: Container(
              height: 20,
              width: MediaQuery.of(context).size.width * .8,
            child: Center(child: Text("Login Button")),))
          ],
        ),
      ),
    );
  }
}