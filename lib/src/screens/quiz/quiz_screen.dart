import 'package:flutter/material.dart';

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff4f6fd),
      appBar: new AppBar(
        title: Text("Quiz Page"),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Container(
        padding: EdgeInsets.only(top: 20, left: 30, right: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 4,),
            Text(
              "Find your quiz here",
              style: TextStyle(fontSize: 17),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical:30),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              height: 60,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Color(0xFFF5F5F7),
                  borderRadius: BorderRadius.circular(35)
              ),
              child: Row(
                children: <Widget>[
                  Icon(Icons.search,),
                  SizedBox(width: 16),
                  Text(
                    "Search",
                    style: TextStyle(
                      fontSize: 18,
                      color: Color(0xFFA0A5BD),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 0,),
            Expanded(child: SingleChildScrollView(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width*0.4,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        courseWidget('Quiz', 'Matematika Course', 'img1', Color(0xFFB388FF), Colors.deepPurpleAccent),
                        SizedBox(height: 20,),
                        courseWidget('Quiz', 'Indonesia Language Course', 'img2', Color(0xffe9eefa), Colors.white),
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width*0.4,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        SizedBox(height: 50,),
                        courseWidget('Quiz', 'English Language Course', 'img3', Color(0xffe9eefa), Colors.white),
                        SizedBox(height: 20,),
                        courseWidget('Quiz', 'IPA Course', 'img4', Color(0xffbdcddfa), Color(0xffcedaff)),
                      ],
                    ),
                  )
                ],
              ),
            ),
            ),
          ],
        ),
      ),
    );
  }
  Container courseWidget(String category, String title, String img, Color categoryColor, Color bgColor)
  {
    return Container(
      padding: EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 10),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.all(Radius.circular(30),
        ),
      ),
      child: InkWell(
        onTap: (){openQuizPage('$img', '$title');},
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: categoryColor,
                  borderRadius: BorderRadius.all(Radius.circular(20))
              ),
              child: Text('$category', style: TextStyle(
                  color: (categoryColor == Color(0xffe9eefa) ? Color(0xff2657ce) : Colors.white)
              ),
              ),
            ),
            SizedBox(height: 10,),
            Text('$title', style: TextStyle(
              color: (bgColor == Colors.deepPurpleAccent ? Colors.white : Colors.black),
              fontSize: 20,
              height: 1,
            ),
            ),
            SizedBox(height: 10,),
            Hero(
              tag: '$img',
              child: Container(
                height: 85,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/image/$img.png',),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  void openQuizPage(String img, String title)
  {
    Navigator.pushNamed(context, '/quizPage', arguments: {'img':'$img', 'title':'$title'});
  }
}
