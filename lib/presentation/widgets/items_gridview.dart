import 'package:fi_angaz/presentation/widgets/product_widget.dart';
import 'package:flutter/cupertino.dart';

class ItemsGridView extends StatefulWidget {
  const ItemsGridView({Key? key}) : super(key: key);

  @override
  _ItemsGridViewState createState() => _ItemsGridViewState();
}

class _ItemsGridViewState extends State<ItemsGridView> {
  @override
  Widget build(BuildContext context) {
    var mHeight=MediaQuery.of(context).size.height;
    var mWidth=MediaQuery.of(context).size.width;
    return GridView.builder(
      shrinkWrap: true,
      physics: ScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 0.75,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          crossAxisCount: (mWidth > 1000)
              ? 6
              : (mWidth > 800)
              ? 5
              : (mWidth > 600)
              ? 4
              : (mWidth > 430)
              ? 3
              : 2),
      itemBuilder: (context, index) {
        return ProductWidget();
      },
      itemCount: 100,
    );
  }
}
