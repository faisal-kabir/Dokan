import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:wedevs/Controller/product_controller.dart';
import 'package:wedevs/Dimension/dimension.dart';
import 'package:wedevs/Model/products.dart';
import 'package:wedevs/Route/route.dart';
import 'package:wedevs/Theme/themes.dart';
import 'package:wedevs/URL/url.dart';
import 'package:wedevs/Widgets/application_skeleton.dart';
import 'package:wedevs/Widgets/circular_progress.dart';
import 'package:wedevs/Widgets/default_dialog.dart';
import 'package:wedevs/Widgets/grid_animation.dart';
import 'package:wedevs/Widgets/image_placeholder.dart';
import 'package:wedevs/Widgets/list_animation.dart';
import 'package:wedevs/Widgets/swipe_refresh.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../main.dart';


class ProductPage extends StatefulWidget {
  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> with TickerProviderStateMixin {
  ProductController controller = Get.put(ProductController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductController>(
      init: controller,
      builder: (_) {
        return Scaffold(
          body: SwipeRefresh(
            controller: controller.refreshController,
            onRefresh: controller.onRefresh,
            children: [
              mainView()
            ]
          )
        );
      },
    );
  }

  Widget mainView() {
    return controller.products!=null ? StaggeredGridView.countBuilder(
      primary: false,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: controller.products!.length,
      padding: EdgeInsets.only(left: 10,right: 10,top: 10),
      crossAxisCount: 4,
      mainAxisSpacing: 8.0,
      crossAxisSpacing: 8.0,
      itemBuilder: (context, index) {
        return GridAnimation(
            index: 2,
            child: singleApplication(controller.products![index],index)
        );
      } ,
      staggeredTileBuilder: (index) =>  StaggeredTile.fit(2),
    ) : ApplicationSkeleton();
  }

  singleApplication(Product productData, int position){
    return Card(
      elevation: 5,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Dimension.Padding)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: Color(0xFFDFE1F0),
            child: CachedNetworkImage(
              imageUrl: productData.images![0].src!,
              fit: BoxFit.cover,
              placeholder: (context, url) => ImagePlaceHolder(height: 90),
              errorWidget: (context, url, error) => ImagePlaceHolder(height: 90),
            ),
          ),
          Container(
            padding: EdgeInsets.all(Dimension.Size_10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(productData.name!,style: Get.textTheme.bodyText1!.copyWith(fontSize: Dimension.Text_Size_Big),maxLines: 1,overflow: TextOverflow.ellipsis,),
                SizedBox(height: Dimension.Size_5,),
                Row(
                  children: [
                    Visibility(
                      visible: getVisibility(productData),
                      child: Padding(
                        padding: EdgeInsets.only(right: Dimension.Size_10),
                        child: Text('\$${productData.regularPrice!}',style: Get.textTheme.bodyText1!.copyWith(decoration: TextDecoration.lineThrough),),
                      )
                    ),
                    Text('\$${productData.price!}',style: Get.textTheme.headline1,)
                  ],
                ),
                SizedBox(height: Dimension.Size_5,),
                RatingBar.builder(
                  initialRating: double.parse(productData.averageRating!),
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  ignoreGestures: true,
                  itemCount: 5,
                  itemSize: Dimension.Size_16,
                  itemPadding: EdgeInsets.only(right: Dimension.Size_2),
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    print(rating);
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }


  void logOut(){
    Get.dialog(
        DefaultDialog(
          title: language.LogOut,
          enableCloseButton: true,
          child: Text(language.Are_you_sure_you_want_to_logout,style: Theme.of(context).textTheme.bodyText1,),
          onButtonClick: (state){
            if(!state) {
              Get.back();
            } else{
              prefs!.clear();
              Get.offAllNamed(LOGIN);
            }
          },
        )
    );
  }

  bool getVisibility(Product productData) {
    if(productData.regularPrice!.isNotEmpty) {
      if(double.parse(productData.price!)<double.parse(productData.regularPrice!)) {
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  }

}
