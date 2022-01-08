import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
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
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
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
      child: Padding(
        padding: EdgeInsets.all(Dimension.Size_10),
        child: CachedNetworkImage(
          imageUrl: productData.images![0].src!,
          height: 90,
          width: 90,
          fit: BoxFit.cover,
          placeholder: (context, url) => ImagePlaceHolder(height: 90),
          errorWidget: (context, url, error) => ImagePlaceHolder(height: 90),
        ),
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

}
