import 'package:flutter/material.dart';
import 'package:mobile_phone_shop/pages/home_page.dart';
import 'package:mobile_phone_shop/themes/custom_color.dart';
import 'package:mobile_phone_shop/themes/theme.dart';
import 'package:mobile_phone_shop/widgets/bootom_navigation_bar.dart';
import 'package:mobile_phone_shop/widgets/dropdown_widget.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  State<MainPage> createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  bool isShowFilter = false;

  Widget _appBar() {
    return SizedBox(
        width: AppTheme.fullWidth(context),
        height: 50,
        child: const DropdownWidget());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            SingleChildScrollView(
              child: Container(
                height: AppTheme.fullHeight(context),
                color: CustomColors.background,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    _appBar(),
                    const Expanded(
                      child: AnimatedSwitcher(
                        duration: Duration(milliseconds: 3),
                        switchInCurve: Curves.easeInToLinear,
                        switchOutCurve: Curves.easeOutBack,
                        child: HomePage(),
                      ),
                    )
                  ],
                ),
              ),
            ),
            const Positioned(
              bottom: 0,
              right: 0,
              child: CustomBottomNavigationBar(),
            )
          ],
        ),
      ),
    );
  }
}
