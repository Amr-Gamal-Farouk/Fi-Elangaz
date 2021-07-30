import 'package:fi_angaz/presentation/pages/shops_page.dart';
import 'package:fi_angaz/presentation/widgets/background_list.dart';
import 'package:fi_angaz/presentation/widgets/drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
   String city="0";
  List offersItems=[
    {
      "url":"https://i.pinimg.com/originals/ef/b6/d8/efb6d8c329ab39b0114054810449da98.jpg",
      "text":"kfc"
    },
    {
      "url":"https://i1.wp.com/7asreeat.com/wp-content/uploads/2021/06/%D9%85%D8%A7%D9%83%D8%AF%D9%88%D9%86%D8%A7%D9%84%D8%AF%D8%B2.jpg?fit=750%2C375&ssl=1",
      "text":"macdonald"
    },
    {
      "url":"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQNRFx-aX-fUPmfZofy0Xa4892xN7riRYSWK0cVS0ZnmulepachQo8lgHyLBaOiFc6o3ys&usqp=CAU",
      "text":"BUFFALO"
    },
  ];

  List category=[Icons.local_pharmacy_outlined,Icons.shopping_basket_outlined,Icons.local_restaurant_outlined];

  search(){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 4),
      child: TextFormField(

        decoration: InputDecoration(
          suffixIcon: GestureDetector(
            child: Icon(Icons.search_outlined,color: Theme.of(context).scaffoldBackgroundColor,size: 35,)
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 0,horizontal: 8),
          fillColor: Colors.white,
          focusColor:  Colors.white,
          filled: true,
          hintText: "Search",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),

          )
        ),
      ),
    );

  }

  categoryItems(){

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30,vertical: 6),
      color: Colors.white.withOpacity(0.1),
      height: 60,
      child: Center(
        child: ListView.builder(
          shrinkWrap: true,
          // padding: EdgeInsets.symmetric(vertical: 20,horizontal: 30),
          scrollDirection: Axis.horizontal,
          itemCount: category.length,

          itemBuilder: (context, index) {
            return GestureDetector(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Center(
                  child: Icon(
                    category[index],color: Theme.of(context).iconTheme.color,
                    size: 40,
                  ),
                ),
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ShopsPage(),));
              },
            );
          } ,

        ),
      ),
    );

  }

  customText(){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 12),
      child: Text("Daily Offers",
        style: Theme.of(context).textTheme.headline3,),
    );
  }

  dailyOffersList({required double mWidth}){
    return ListView.builder(
      physics: ScrollPhysics(),
      shrinkWrap: true,
      itemCount: offersItems.length,
        itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 4,horizontal: 16),
          child: Container(
            width: mWidth-32,
            height: 85,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(
                  offersItems[index]["url"]
                )
              )
            ),
          ),
        );

        },);
  }



  @override
  Widget build(BuildContext context) {
    var mHeight=MediaQuery.of(context).size.height;
    var mWidth=MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          backgroundColor: Theme.of(context).primaryColor,
          elevation: 0,
          actions: [
            GestureDetector(
              child: Container(
                child: Row(children: [
                   Text( (city!="0")?"Cairo":"Location",
                    style:  Theme.of(context).textTheme.headline3,),
                  SizedBox(width: 8,),
                  Icon(Icons.location_on_outlined,
                    color: Theme.of(context).iconTheme.color ,
                  size: Theme.of(context).iconTheme.size ,),
                  SizedBox(width: 8,),
                ],),
              ),
              onTap: (){
              //  todo select location
              },
            )
          ],

        ),
        body: BackgroundList(
    child:ListView(
      physics: ScrollPhysics(),
    shrinkWrap: true,
      children:[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: CarouselSlider.builder(
              itemCount: offersItems.length,
              itemBuilder: (context, index, realIndex) {
                return Container(
                  width: mWidth,
                  height: mHeight*0.35,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(offersItems[index]["url"]),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18,vertical: 20),
                        child: Text(offersItems[index]["text"].toString().toUpperCase(),style: TextStyle(
                            fontWeight: FontWeight.bold,fontSize: mWidth*0.06,
                            color: Colors.white
                        )),
                      )
                    ],
                  ),
                );
              },
              options: CarouselOptions(
                autoPlay: true,
                aspectRatio: 2.0,
                enlargeCenterPage: true,
                enlargeStrategy: CenterPageEnlargeStrategy.height,

              ),),
          ),
          search(),
          categoryItems(),
          customText(),
          dailyOffersList(mWidth: mWidth),
        ],),
        ),
        drawer: MyDrawer(),
      ),
    );
  }
}
