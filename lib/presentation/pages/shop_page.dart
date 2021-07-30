import 'package:fi_angaz/presentation/widgets/background_list.dart';
import 'package:fi_angaz/presentation/widgets/drawer.dart';
import 'package:fi_angaz/presentation/widgets/items_gridview.dart';
import 'package:fi_angaz/presentation/widgets/rate_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({Key? key}) : super(key: key);

  @override
  _ShopPageState createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
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
        child: Center(
          child: Hero(
            tag: 'imageHero',
            child: Container(
              width: mWidth-20,
              height: mHeight-120,


              child: Column(
                children: [
                  Container(
                    width:mWidth-23 ,
                    height: 150,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child:Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Restaurant Name",style: Theme.of(context).textTheme.headline1,),
                                SizedBox(height: 8,),
                                StarRating(onRatingChanged: (rating) {
                                  print(rating.toString());
                                },),
                                SizedBox(height: 8,),
                                Text("Restaurant Name",style: Theme.of(context).textTheme.headline2,),
                              ],
                            ),

                          ),
                        ),
                        Container(
                          height: 120,
                          width: mWidth*0.35,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.horizontal(left: Radius.circular(50)),

                              image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: NetworkImage("https://istanbulonfood.com/wp-content/uploads/2021/06/ajia-restaurant2.jpeg")
                              )
                          ),
                        ),

                      ],

                    ),

                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Expanded(child: Padding(

                    padding: const EdgeInsets.symmetric(horizontal: 2),
                    child: ItemsGridView(),
                  ))
                ],
              ),


            ),
          ),
        ) ,
      ),

      drawer: MyDrawer(),

    );
  }
}
