import 'package:fi_angaz/presentation/widgets/background_list.dart';
import 'package:fi_angaz/presentation/widgets/drawer.dart';
import 'package:fi_angaz/presentation/widgets/vertical_item_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShopsPage extends StatefulWidget {
  const ShopsPage({Key? key}) : super(key: key);

  @override
  _ShopsPageState createState() => _ShopsPageState();
}

class _ShopsPageState extends State<ShopsPage> {
  @override
  Widget build(BuildContext context) {
    var mHeight=MediaQuery.of(context).size.height;
    var mWidth=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0,

      ),
      body: BackgroundList(
        child: ListView.builder(
          physics: ScrollPhysics(),
          shrinkWrap: true,
          itemCount:10 ,
          itemBuilder:(context, index) {
            return VerticalItemList() ;
          } ,

        )
      ),
      drawer: MyDrawer(),
    );
  }
}
