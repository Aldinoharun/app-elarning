import 'package:flutter/material.dart';
import 'package:elearningg/src/helpers/screen_navigation.dart';
import 'package:elearningg/src/providers/auth.dart';
import 'package:elearningg/src/screens/home.dart';
import 'package:elearningg/src/screens/login.dart';
import 'package:elearningg/src/widgets/loading.dart';
import 'package:elearningg/src/widgets/tittle.dart';
import 'package:provider/provider.dart';

import 'package:elearningg/src/helpers/style.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
      key: _key,
      backgroundColor: Colors.deepPurpleAccent,
      body: authProvider.status == Status.Authenticating? Loading() : SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 50,
            ),
            Text(
              "REGISTER",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30 ),
            ),
            SizedBox(height: 20,),
            new Image.asset("assets/image/signup.png", width: 220,),
            SizedBox(height: 30,),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: white),
                    borderRadius: BorderRadius.circular(20)
                ),
                child: Padding(padding: EdgeInsets.only(left: 10),
                  child: TextFormField(
                    controller: authProvider.name,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Username",
                        icon: Icon(Icons.person)
                    ),
                  ),),
              ),
            ),
            SizedBox(height: 6,),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: white),
                    borderRadius: BorderRadius.circular(20)
                ),
                child: Padding(padding: EdgeInsets.only(left: 10),
                  child: TextFormField(
                    controller: authProvider.email,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Emails",
                        icon: Icon(Icons.email)
                    ),
                  ),),
              ),
            ),
            SizedBox(height: 6,),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: white),
                    borderRadius: BorderRadius.circular(20)
                ),
                child: Padding(padding: EdgeInsets.only(left: 10),
                  child: TextFormField(
                    obscureText: true,
                    controller: authProvider.password,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Password",
                        icon: Icon(Icons.lock),
                    ),
                  ),),
              ),
            ),
            SizedBox(height: 10,),
            Padding(
                padding: const EdgeInsets.all(10),
                child:  GestureDetector(
                  onTap: ()async{
                    if(!await authProvider.signUp()){
                      _key.currentState.showSnackBar(
                          SnackBar(content: Text("Resgistration failed!"))
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
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(padding: EdgeInsets.only(top: 10, bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          CustomText(text: "Register", color: white, size: 22,)
                        ],
                      ),
                    ),
                  ),
                )
            ),

            GestureDetector(
              onTap: (){
                changeScreen(context, LoginScreen());
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CustomText(text: "Already have an Account? login here", size: 15,),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
