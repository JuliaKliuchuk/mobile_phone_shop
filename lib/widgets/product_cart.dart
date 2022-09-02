import 'package:flutter/material.dart';
import 'package:mobile_phone_shop/model/store_list.dart';
import 'package:mobile_phone_shop/services/http_service.dart';
import 'package:mobile_phone_shop/themes/custom_color.dart';
import 'package:mobile_phone_shop/widgets/custom_text_widget.dart';
import 'package:mobile_phone_shop/widgets/extentions.dart';

class ProductCardWidget extends StatefulWidget {
  const ProductCardWidget({Key? key}) : super(key: key);

  @override
  State<ProductCardWidget> createState() => _ProductCardWidgetState();
}

class _ProductCardWidgetState extends State<ProductCardWidget> {
  late Future<StoreList> futureStorelist;

  @override
  void initState() {
    super.initState();
    futureStorelist = fetchStoreList();
  }

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
      child: Icon(icon, color: CustomColors.orange, size: 10),
    ).ripple(
      () {
        if (onPressed != null) {
          onPressed();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<StoreList>(
      future: futureStorelist,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          int count = snapshot.data?.bestSeller.length ?? 0;
          return GridView.builder(
              physics: const BouncingScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 12,
                crossAxisSpacing: 14,
                mainAxisExtent: 237,
              ),
              itemCount: count,
              padding: const EdgeInsets.all(10),
              scrollDirection: Axis.vertical,
              itemBuilder: (BuildContext context, int index) {
                bool? isLiked = snapshot.data?.bestSeller[index].isFavorites;

                return Container(
                  decoration: const BoxDecoration(
                    color: CustomColors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Column(
                    children: <Widget>[
                      Stack(
                        alignment: Alignment.center,
                        children: <Widget>[
                          Container(
                            height: 176,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10)),
                              image: DecorationImage(
                                image: NetworkImage(
                                    '${snapshot.data?.bestSeller[index].picture}'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Positioned(
                            right: 10,
                            top: 10,
                            child: _iconIsLike(
                              isLiked == true
                                  ? Icons.favorite
                                  : Icons.favorite_border_outlined,
                            ),
                          )
                        ],
                      ),
                      Container(
                        height: 51,
                        margin: const EdgeInsets.only(left: 25, bottom: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              children: [
                                CustomTextWidget(
                                  text:
                                      '\$${snapshot.data?.bestSeller[index].priceWithoutDiscount}',
                                  fontSize: 16,
                                ),
                                const Padding(
                                    padding: EdgeInsets.only(left: 7)),
                                CustomTextWidget(
                                  text:
                                      '\$${snapshot.data?.bestSeller[index].discountPrice}',
                                  fontSize: 10,
                                  color: CustomColors.lightGrey,
                                  decorationColor: CustomColors.lightGrey,
                                  decoration: TextDecoration.lineThrough,
                                ),
                              ],
                            ),
                            const Padding(padding: EdgeInsets.only(top: 7)),
                            CustomTextWidget(
                              text: '${snapshot.data?.bestSeller[index].title}',
                              fontSize: 10,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              });
        } else if (snapshot.hasError) {
          return const Text('Error');
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
