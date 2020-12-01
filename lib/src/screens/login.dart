import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:elearningg/src/providers/auth.dart';
import 'package:elearningg/src/screens/registration.dart';
import 'package:elearningg/src/helpers/screen_navigation.dart';
import 'package:elearningg/src/helpers/style.dart';
import 'package:elearningg/src/screens/home.dart';
import 'package:elearningg/src/widgets/loading.dart';
import 'package:elearningg/src/widgets/tittle.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _key = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
      key: _key,
      backgroundColor: Colors.deepPurpleAccent,
      body: authProvider.status == Status.Authenticating? Loading() : SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 20,
            ),

            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 15,),
                Text(
                  "LOGIN",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
                SizedBox(height: 30,),
                new Image.asset("assets/image/login.png", width: 240,),
              ],
            ),
            SizedBox(height: 30,),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: white),
                    borderRadius: BorderRadius.circular(20)
                ),
                child: Padding(padding: EdgeInsets.only(left: 15),
                  child: TextFormField(
                    controller: authProvider.email,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Email/Username",
                        icon: Icon(Icons.email)
                    ),
                  ),),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: white),
                    borderRadius: BorderRadius.circular(20)
                ),
                child: Padding(padding: EdgeInsets.only(left: 15),
                  child: TextFormField(
                    obscureText: true,
                    controller: authProvider.password,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Password",
                        icon: Icon(Icons.lock)
                    ),
                  ),
                ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(10),
                child: GestureDetector(
                  onTap: ()async{
                    if (!await authProvider.signIn()){
                      _key.currentState.showSnackBar(
                          SnackBar(content: Text("Login failed"))
                      );
                      return;
                    }
                    authProvider.clearController();
                    changeScreenReplacement(context, HomePage());
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: red,
                        border: Border.all(color: red),
                        borderRadius: BorderRadius.circular(20)
                    ),
                    child: Padding(padding: EdgeInsets.only(top: 10, bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          CustomText(text: "Login", color: white, size: 22,)
                        ],
                      ),
                    ),
                  ),
                )
            ),

            GestureDetector(
              onTap: (){
                changeScreen(context, RegistrationScreen());
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CustomText(text: "Do not have account? Register here",  size: 16,),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}