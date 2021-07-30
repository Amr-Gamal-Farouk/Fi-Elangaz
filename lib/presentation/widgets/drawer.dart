import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {

  List drawerItems=[
    {"name":"Home","image":"assets/images/home.png"},
    {"name":"Profile","image":"assets/images/profile.png"},
    {"name":"Favorites","image":"assets/images/favorites.png"},
    {"name":"My Orders","image":"assets/images/myOrders.png"}];



  @override
  Widget build(BuildContext context) {
    var mHeight=MediaQuery.of(context).size.height;
    var mWidth=MediaQuery.of(context).size.width;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          width: mWidth,
          height: mHeight*0.75,
          // color: Colors.white,
          child: Drawer(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(onPressed: (){
                        Navigator.pop(context);
                      },
                          icon: Icon(Icons.close,color: Colors.black,),),

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                            child: Text("Logout",style: Theme.of(context).textTheme.headline1,),
                        onTap: (){
                        //      todo login or out
                        },
                        ),

                      )
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Expanded(child: GridView.builder(
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 1.3,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20,
                        crossAxisCount: 2),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                height: 80,
                                  width: 80,
                                  child: Image(image: AssetImage(drawerItems[index]["image"]),)),
                              SizedBox(height: 4,),
                              Text(drawerItems[index]["name"],style: Theme.of(context).textTheme.headline1,)

                            ],
                          ),
                        ),
                      );
                    },
                    itemCount: drawerItems.length,
                  ),)
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
