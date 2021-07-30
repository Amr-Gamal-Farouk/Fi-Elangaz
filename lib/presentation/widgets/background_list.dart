import 'package:flutter/cupertino.dart';

class BackgroundList extends StatefulWidget {
  Widget child;
   BackgroundList({Key? key,required this.child,}) : super(key: key);

  @override
  BackgroundListState createState() => BackgroundListState();
}

class BackgroundListState extends State<BackgroundList> {
  @override
  Widget build(BuildContext context) {
    var mHeight=MediaQuery.of(context).size.height;
    var mWidth=MediaQuery.of(context).size.width;
    return Container(
      width: mWidth,
      height: mHeight,
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                  "assets/images/background.jpg"
              )
          )
      ),
      child: widget.child,
    );
  }
}
