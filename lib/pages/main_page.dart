import 'package:flutter/material.dart';
import 'package:mobile_phone_shop/pages/home_page.dart';
import 'package:mobile_phone_shop/themes/theme.dart';
import 'package:mobile_phone_shop/widgets/bootom_navigation_bar.dart';
import 'package:mobile_phone_shop/widgets/dropdown_widget.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool isHomePageSelected = true;

  Widget _appBar() {
    return Container(
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
                height: AppTheme.fullHeight(context) - 50,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xfffbfbfb),
                      Color(0xfff7f7f7),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
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
