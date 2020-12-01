import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  String chosenImg;
  String chosenTitle;
  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context).settings.arguments as Map;
    chosenImg = arguments['img'];
    chosenTitle = arguments['title'];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              color: Color(0xffe1eaff)
          ),
          child: IconButton(
            onPressed: (){Navigator.pop(context);},
            icon: Icon(Icons.arrow_back_ios, color: Color(0xff2657ce),) ,
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('$chosenTitle', style: TextStyle(color: Color(0xff2657ce), fontSize: 23),
            ),
            Text('Mr. Hermawan', style: TextStyle(color: Colors.black.withOpacity(0.6),fontSize: 18),
            ),
            SizedBox(height: 20,),
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                color: Colors.deepPurpleAccent,
              ),
              child: Hero(
                  tag: '$chosenImg',
                  child: Container(
                    height: 180,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        image: DecorationImage(
                          image: AssetImage('assets/image/$chosenImg.png'),
                        )
                    ),
                  )),
            ),
            SizedBox(height: 15,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("Your Quiz",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 1),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    color: Color(0xffd3defa),
                  ),
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: 35,
                        child: IconButton(
                          icon: Icon(Icons.timer, color: Colors.blue,),
                        ),
                      ),
                      Text("1 hour per Quiz", style: TextStyle(color: Colors.black.withOpacity(0.7)
                      ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(height: 5,),
            Expanded(child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  productListing('Introduction', 'Introduction of the course', 'active'),
                  productListing('Quiz 1', 'Attempt your quiz now..', 'inactive'),
                  productListing('Quiz 2', 'Attempt your quiz now..', 'inactive'),
                  productListing('Quiz 3', 'Attempt your quiz now..', 'inactive'),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
  Column productListing(String title, String info, String activeOrInactive)
  {
    return Column(
      children: <Widget>[
        SizedBox(height: 10,),
        Row(
          children: <Widget>[
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: (activeOrInactive == 'active') ? Color(0xff2657ce) : Color(0xffd3defa),
                borderRadius: BorderRadius.all(Radius.circular(17)),
              ),
              child: IconButton(
                icon: Icon(
                  Icons.event_available, color: (activeOrInactive == 'active') ? Colors.white : Color(0xff2657ce),
                ),
                onPressed: () {},
              ),
            ),
            SizedBox(width: 15,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('$title', style: TextStyle(
                    fontSize: 18, fontWeight: FontWeight.bold
                ),
                ),
                Text('$info', style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey
                ),
                ),
              ],
            )
          ],
        ),
        Center(
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 8),
            width: MediaQuery.of(context).size.width*0.60,
            height: 0.5,
            color: Colors.grey,
          ),
        ),
        SizedBox(height: 10,),
      ],
    );
  }
}
