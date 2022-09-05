import 'package:flutter/material.dart';
import 'package:mobile_phone_shop/model/store_list.dart';
import 'package:mobile_phone_shop/pages/product_details_page.dart';
import 'package:mobile_phone_shop/themes/app_color.dart';
import 'package:mobile_phone_shop/widgets/custom_text_widget.dart';
import 'package:provider/provider.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({Key? key}) : super(key: key);

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  Widget _iconIsLike(IconData icon, {Function? onPressed}) {
    return Container(
      height: 25,
      width: 25,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.15),
              offset: Offset(0, 0),
              blurRadius: 20)
        ],
        borderRadius: BorderRadius.all(Radius.elliptical(25, 25)),
        color: Color.fromRGBO(255, 255, 255, 1),
      ),
      child: Icon(icon, color: AppColors.orange, size: 10),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<StoreList>(
      builder: (context, StoreList storeList, _) {
        return Column(
          children: [
            Expanded(
              child: storeList.bestSeller.isEmpty
                  ? const Center(child: CircularProgressIndicator())
                  : GridView.builder(
                      // physics: const BouncingScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 12,
                        crossAxisSpacing: 14,
                        mainAxisExtent: 237,
                      ),
                      itemCount: storeList.bestSeller.length,
                      padding: const EdgeInsets.all(10),
                      scrollDirection: Axis.vertical,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          decoration: const BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: GestureDetector(
                            onTap: () {
                              Route route = MaterialPageRoute(
                                  builder: (context) =>
                                      const ProductDetailsPage());
                              Navigator.push(context, route);
                            },
                            child: Column(
                              children: <Widget>[
                                Stack(
                                  alignment: Alignment.center,
                                  children: <Widget>[
                                    Container(
                                      height: 176,
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            topRight: Radius.circular(10)),
                                        // image: DecorationImage(
                                        //   image: NetworkImage(storeList
                                        //       .bestSeller[index].picture),
                                        //   fit: BoxFit.cover,
                                        // ),
                                      ),
                                      // added as a stub, because one image is not loading
                                      child: Image.network(
                                        storeList.bestSeller[index].picture,
                                        frameBuilder: (context, child, frame,
                                            wasSynchronouslyLoaded) {
                                          return child;
                                        },
                                        loadingBuilder:
                                            (context, child, loadingProgress) {
                                          if (loadingProgress == null) {
                                            return child;
                                          } else {
                                            return const Center(
                                                child:
                                                    CircularProgressIndicator());
                                          }
                                        },
                                        errorBuilder:
                                            (context, error, stackTrace) {
                                          return Container(
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: NetworkImage(storeList
                                                    .bestSeller[0].picture),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                    Positioned(
                                      right: 10,
                                      top: 10,
                                      child: _iconIsLike(
                                        storeList.bestSeller[index]
                                                    .isFavorites ==
                                                true
                                            ? Icons.favorite
                                            : Icons.favorite_border_outlined,
                                      ),
                                    )
                                  ],
                                ),
                                Container(
                                  height: 51,
                                  margin: const EdgeInsets.only(
                                      left: 25, bottom: 10),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Row(
                                        children: [
                                          CustomTextWidget(
                                            text:
                                                '\$${storeList.bestSeller[index].priceWithoutDiscount}',
                                            fontSize: 16,
                                          ),
                                          const Padding(
                                              padding:
                                                  EdgeInsets.only(left: 7)),
                                          CustomTextWidget(
                                            text:
                                                '\$${storeList.bestSeller[index].discountPrice}',
                                            fontSize: 10,
                                            color: AppColors.lightGrey,
                                            decorationColor:
                                                AppColors.lightGrey,
                                            decoration:
                                                TextDecoration.lineThrough,
                                          ),
                                        ],
                                      ),
                                      const Padding(
                                          padding: EdgeInsets.only(top: 7)),
                                      CustomTextWidget(
                                        text: storeList.bestSeller[index].title,
                                        fontSize: 10,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
            )
          ],
        );
      },
    );
  }
}
