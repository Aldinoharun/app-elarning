import 'package:carousel_pro/carousel_pro.dart';
import 'package:elearningg/src/helpers/style.dart';
import 'package:elearningg/src/providers/auth.dart';
import 'package:elearningg/src/screens/assignments/assignment_screen.dart';
import 'package:elearningg/src/screens/chat/chat_screen.dart';
import 'package:elearningg/src/screens/course/course_screen.dart';
import 'package:elearningg/src/screens/login.dart';
import 'package:elearningg/src/screens/quiz/quiz_screen.dart';
import 'package:elearningg/src/widgets/tittle.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
      backgroundColor: Color(0xfff4f6fd),
      appBar: new AppBar(
        title: Text("Dashboard"),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      drawer: Drawer(
      child:  ListView(
         children: <Widget>[
           UserAccountsDrawerHeader(
             decoration: BoxDecoration(color: Colors.deepPurpleAccent),
             accountName: CustomText(
               text: authProvider.userModel?.name,
               color: white,
               weight: FontWeight.bold,
               size: 18,
             ),
             accountEmail: CustomText(
                 text: authProvider.userModel?.email,
                 color: white,
             ),
            currentAccountPicture: GestureDetector(
             child: new CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.person, color: Colors.black,),
           ),
            ),
           ),
           InkWell(
             onTap: () {
               Navigator.push(context, MaterialPageRoute(builder: (context){
                 return CourseScreen();
               },
               ),
               );
             },
             child: ListTile(
               title: Text(
                 "Course", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
               ),
               leading:  Icon(Icons.book, color: Colors.indigoAccent,),
             ),
           ),
           InkWell(
             onTap: () {
               Navigator.push(context, MaterialPageRoute(builder: (context){
                 return AssignmentScreen();
               },
               ),
               );
             },
             child: ListTile(
               title: Text(
                 "Assignment", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
               ),
               leading:  Icon(Icons.assignment, color: Colors.indigoAccent,),
             ),
           ),
           InkWell(
             onTap: () {
               Navigator.push(context, MaterialPageRoute(builder: (context){
                 return QuizScreen();
               },
               ),
               );
             },
             child: ListTile(
               title: Text(
                 "Quiz", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
               ),
               leading:  Icon(Icons.check_circle,color: Colors.indigoAccent,),
             ),
           ),
           InkWell(
             onTap: () {
               Navigator.push(context, MaterialPageRoute(builder: (context){
                 return ChatScreen();
               },
               ),
               );
             },
             child: ListTile(
               title: Text(
                 "Chat", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
               ),
               leading:  Icon(Icons.chat, color: Colors.indigoAccent,),
             ),
           ),
           Divider(),
           InkWell(
             onTap: () {
               Navigator.push(context, MaterialPageRoute(builder: (context){
                 return LoginScreen();
               },
               ),
               );
             },
             child: ListTile(
               title: Text(
                 "Logout", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
               ),
               leading:  Icon(Icons.reply, color: red,),
             ),
           ),
           InkWell(
             onTap: () => Navigator.of(context).pop(),
             child: ListTile(
               title: Text(
                 "Close", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
               ),
               leading:  Icon(Icons.close),
             ),
           ),
         ],
      ),
      ),
    body: Container(
    padding: EdgeInsets.only(top: 20, left: 30, right: 30),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
    SizedBox(height: 10,),
    Text(
    "Welcome To Elearning",
    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
    ),
      SizedBox(height: 20,),
    Text("What do you want learn to day ?", style: TextStyle(fontSize: 20, color: Colors.grey),
    ),
      SizedBox(height: 50,),
      Container(
        height: 200,
        child: new Carousel(
          boxFit: BoxFit.cover,
          images: [
            Image.asset("assets/images/h1.jpg"),
            Image.asset("assets/images/h2.jpg"),
            Image.asset("assets/images/h3.png"),
            Image.asset("assets/images/h4.jpg"),
            Image.asset("assets/images/h5.jpg"),
            Image.asset("assets/images/h6.jpg"),
            Image.asset("assets/images/h7.jpg"),
            Image.asset("assets/images/h8.png"),
            Image.asset("assets/images/h9.jpg"),
            Image.asset("assets/images/h10.jpg"),
            Image.asset("assets/images/h11.jpg"),
          ],
          autoplay: true,
          animationCurve: Curves.fastOutSlowIn,
          animationDuration: Duration(milliseconds: 1000),
          dotSize: 4.0,
          indicatorBgPadding: 2.0,
        ),
      ),
    ],
    ),
    ),
    );
  }
}

