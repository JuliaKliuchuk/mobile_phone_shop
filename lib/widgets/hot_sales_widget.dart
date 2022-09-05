import 'package:flutter/material.dart';
import 'package:mobile_phone_shop/model/store_list.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:mobile_phone_shop/themes/app_color.dart';
import 'package:mobile_phone_shop/themes/theme.dart';
import 'package:mobile_phone_shop/widgets/custom_text_widget.dart';
import 'package:provider/provider.dart';

class HotSalesWidget extends StatefulWidget {
  const HotSalesWidget({Key? key}) : super(key: key);

  @override
  State<HotSalesWidget> createState() => _HotSalesWidgetState();
}

class _HotSalesWidgetState extends State<HotSalesWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer<StoreList>(
      builder: (context, StoreList storeList, _) {
        return Row(
          children: [
            Expanded(
              child: storeList.homeStore.isEmpty
                  ? const Center(child: CircularProgressIndicator())
                  : CarouselSlider.builder(
                      itemCount: storeList.homeStore.length,
                      options: CarouselOptions(
                        aspectRatio: 1.2,
                        viewportFraction: 1,
                      ),
                      itemBuilder: (context, index, realIndex) {
                        return Container(
                          width: AppTheme.fullWidth(context),
                          height: 180,
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            image: DecorationImage(
                              image: NetworkImage(
                                  '${storeList.homeStore[index].picture}'),
                              fit: BoxFit.cover,
                            ),
                          ),
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // label 'New'
                                storeList.homeStore[index].isNew == true
                                    ? Container(
                                        margin:
                                            const EdgeInsets.only(bottom: 18),
                                        alignment: Alignment.center,
                                        width: 27,
                                        height: 27,
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: AppColors.orange,
                                        ),
                                        child: const Text(
                                          'New',
                                          style: TextStyle(
                                            color: AppColors.white,
                                            fontSize: 10,
                                          ),
                                        ),
                                      )
                                    : Container(
                                        margin:
                                            const EdgeInsets.only(bottom: 18),
                                        width: 27,
                                        height: 27,
                                      ),
                                CustomTextWidget(
                                  text: storeList.homeStore[index].title,
                                  color: AppColors.white,
                                ),
                                CustomTextWidget(
                                  text:
                                      '${storeList.homeStore[index].subtitle}',
                                  color: AppColors.white,
                                  fontSize: 11,
                                  fontWeight: FontWeight.w400,
                                ),
                                const SizedBox(height: 26),

                                // button 'Buy now!'
                                storeList.homeStore[index].isBuy == true
                                    ? SizedBox(
                                        width: 100.0,
                                        height: 23.0,
                                        child: OutlinedButton(
                                          onPressed: () {},
                                          style: OutlinedButton.styleFrom(
                                            backgroundColor: AppColors.white,
                                          ),
                                          child: const CustomTextWidget(
                                            text: 'Buy now!',
                                            fontSize: 11,
                                          ),
                                        ),
                                      )
                                    : const SizedBox(),
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
