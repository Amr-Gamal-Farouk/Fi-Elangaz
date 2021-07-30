import 'package:fi_angaz/presentation/pages/shop_page.dart';
import 'package:fi_angaz/presentation/widgets/rate_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class VerticalItemList extends StatefulWidget {
  String title, subtitle,contentInfo,imageUrl;
  VerticalItemList(
      {Key? key, this.title ="0", this.subtitle="0", this.contentInfo="0", this.imageUrl="0"}) : super(key: key);


  @override
  _VerticalItemListState createState() => _VerticalItemListState();
}

class _VerticalItemListState extends State<VerticalItemList> {
  String title, subtitle,contentInfo,imageUrl;


  _VerticalItemListState(
      {Key? key, this.title ="0", this.subtitle="0", this.contentInfo="0", this.imageUrl="0"});

  @override
  Widget build(BuildContext context) {
    var mHeight=MediaQuery.of(context).size.height;
    var mWidth=MediaQuery.of(context).size.width;


    return GestureDetector(
      child: Hero(
        tag: 'imageHero',
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 12,vertical: 8),
          width:mWidth-32 ,
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
      ),
      onTap: (){
      //  todo go to shop elements
        Navigator.push(context, MaterialPageRoute(builder: (context) => ShopPage(),));
      },
    );
  }
}
