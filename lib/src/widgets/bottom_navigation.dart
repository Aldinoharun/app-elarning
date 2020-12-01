import 'package:flutter/material.dart';
import 'package:elearningg/src/widgets/tittle.dart';

class ButtonNavIcon extends StatelessWidget {
  final String image;
  final String name;
  final Function onTap;

  ButtonNavIcon({@required this.image, this.name, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.all(8),
      child: GestureDetector(
        onTap: onTap ?? null,
        child: Column(
          children: <Widget>[
            Image.asset("images/$image", width: 30, height: 30,),
            SizedBox(height: 2,),
            CustomText(text: name, size: 15,)
          ],
        ),
      ),
    );
  }
}
