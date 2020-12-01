import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chats"),
        backgroundColor: Colors.deepPurpleAccent,
        elevation: 0.8,
        actions: <Widget>[
          IconButton(
              icon:
              Icon(Icons.search),
              onPressed: (){}
          ),
        ],
      ),
      body: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              height: 80,
              width: double.infinity,
              color: Colors.white,
              child: Row(
                children: <Widget>[
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Icon(Icons.add, color: Colors.white),
                  ),
                  SizedBox(width: 16,),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Send a massage..",
                        hintStyle: TextStyle(color: Colors.grey.shade500),
                        border: InputBorder.none
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              padding: EdgeInsets.only(right: 20, bottom: 5),
              child: FloatingActionButton(
                  onPressed: (){},
                child: Icon(Icons.send, color: Colors.white,),
                backgroundColor: Colors.deepPurpleAccent,
                elevation: 10,
                  ),
            ),
          )
        ],
      ),
    );
  }
}