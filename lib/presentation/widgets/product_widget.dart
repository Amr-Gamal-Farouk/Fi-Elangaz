import 'dart:async';

import 'package:animator/animator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ProductWidgetState();
}

class ProductWidgetState extends State {
  bool showCart = false;

  addToCartAction() {
    setState(() {
      showCart = true;
    });

    Timer(Duration(milliseconds: 500), () {
      setState(() {
        showCart = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      // margin: EdgeInsets.symmetric(horizontal: 4),
      width: 150,
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    // color: Colors.green,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.network(
                        "https://m.media-amazon.com/images/I/91a0OHUe7HL._AC_SX255_.jpg",
                        // width: double.infinity,
                        // "https://mughlaicuisineny.com/wp-content/uploads/2016/03/Hyderabadi-Chicken-Biryani.jpg",
                        fit: BoxFit.cover,
                      )),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: Text(
                            "Product Name Product Name",
                            style: Theme.of(context).textTheme.headline3,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Text(
                          "225EGY",
                          style: Theme.of(context).textTheme.headline4,
                        ),
                      ],
                    ),
                  ),
                  Icon(
                    Icons.favorite,
                  ),
                ],
              ),
            ],
          ),
          showCart
              ? Animator(
                  duration: Duration(milliseconds: 300),
                  tween: Tween(begin: 0.8, end: 1.4),
                  curve: Curves.easeInOutSine,
                  cycles: 0,
                  builder: (context, animatorState, child) => Transform.scale(
                        scale: 1.0,
                        child: Center(
                            child: Container(
                          width: double.infinity,
                          height: double.infinity,
                          // color: Colors.black54,
                          child: Icon(
                            Icons.shopping_cart,
                            size: 90,
                            color: Theme.of(context).primaryColor,
                          ),
                        )),
                      ))
              : Container(),
          Positioned(
            right: 0,
            top: 0,
            child: GestureDetector(
              child: Container(
                padding: EdgeInsets.all(2),
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor.withOpacity(0.6),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(50),
                        topRight: Radius.circular(16))),
                width: 50,
                child: Icon(Icons.add_shopping_cart_rounded),
                // height: 100,
              ),
              onTap: () {
                //  todo add to cart
                addToCartAction();
              },
            ),
          ),
        ],
      ),
    );
  }
}
