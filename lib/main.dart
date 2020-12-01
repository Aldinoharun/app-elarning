import 'package:elearningg/src/screens/assignments/AssignmentPage.dart';
import 'package:elearningg/src/screens/course/CoursePage.dart';
import 'package:elearningg/src/screens/quiz/QuizPage.dart';
import 'package:flutter/material.dart';
import 'package:elearningg/src/providers/auth.dart';
import 'package:elearningg/src/screens/home.dart';
import 'package:elearningg/src/screens/login.dart';
import 'package:provider/provider.dart';
import 'package:elearningg/src/widgets/loading.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider.value(value: AuthProvider.initialize())
  ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Elearning App',
          theme: ThemeData(
            primarySwatch: Colors.red,
          ),
          home: ScreensController(),
          routes: {
            '/coursePage' : (context)=>CoursePage(),
            '/assigmentPage' : (context)=>AssigmentPage(),
            '/quizPage' : (context)=>QuizPage(),
          } ,
      )));
}
class ScreensController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthProvider>(context);
    switch(auth.status){
      case Status.Uninitialized:
        return Loading();
      case Status.Unauthenticated:
      case Status.Authenticating:
        return LoginScreen();
      case Status.Authenticated:
        return HomePage();
      default:
        return LoginScreen();
    }
  }
}
