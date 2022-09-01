import 'package:flutter/material.dart';
import 'package:mobile_phone_shop/model/store_list.dart';
import 'package:mobile_phone_shop/services/http_service.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:mobile_phone_shop/themes/custom_color.dart';
import 'package:mobile_phone_shop/themes/theme.dart';
import 'package:mobile_phone_shop/widgets/custom_text_widget.dart';

class HotSalesWidget extends StatefulWidget {
  const HotSalesWidget({Key? key}) : super(key: key);

  @override
  State<HotSalesWidget> createState() => _HotSalesWidgetState();
}

class _HotSalesWidgetState extends State<HotSalesWidget> {
  late Future<StoreList> futureStorelist;

  @override
  void initState() {
    super.initState();
    futureStorelist = fetchStoreList();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<StoreList>(
      future: futureStorelist,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return CarouselSlider.builder(
              itemCount: snapshot.data?.homeStore.length,
              options: CarouselOptions(
                aspectRatio: 1.2,
                viewportFraction: 1,
              ),
              itemBuilder: (context, index, realIndex) {
                return Container(
                  width: AppTheme.fullWidth(context),
                  height: 180,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(5)),
                    image: DecorationImage(
                      image: NetworkImage(
                          '${snapshot.data?.homeStore[index].picture}'),
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
                        snapshot.data?.homeStore[index].isNew == true
                            ? Container(
                                margin: const EdgeInsets.only(bottom: 18),
                                alignment: Alignment.center,
                                width: 27,
                                height: 27,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: CustomColors.orange,
                                ),
                                child: const Text(
                                  'New',
                                  style: TextStyle(
                                    color: CustomColors.white,
                                    fontSize: 10,
                                  ),
                                ),
                              )
                            : Container(
                                margin: const EdgeInsets.only(bottom: 18),
                                width: 27,
                                height: 27,
                              ),
                        CustomTextWidget(
                          text: '${snapshot.data?.homeStore[index].title}',
                          color: CustomColors.white,
                        ),
                        CustomTextWidget(
                          text: '${snapshot.data?.homeStore[index].subtitle}',
                          color: CustomColors.white,
                          fontSize: 11,
                          fontWeight: FontWeight.w400,
                        ),
                        const SizedBox(height: 26),

                        // button 'Buy now!'
                        snapshot.data?.homeStore[index].isBuy == true
                            ? SizedBox(
                                width: 100.0,
                                height: 23.0,
                                child: OutlinedButton(
                                  onPressed: () {},
                                  style: OutlinedButton.styleFrom(
                                    backgroundColor: CustomColors.white,
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
              });
        } else if (snapshot.hasError) {
          return const Text('Error');
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
