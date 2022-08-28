import 'package:flutter/material.dart';
import 'package:mobile_phone_shop/pages/cart_page.dart';
import 'package:mobile_phone_shop/pages/favorite_page.dart';
import 'package:mobile_phone_shop/pages/profile_page.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({Key? key}) : super(key: key);

  @override
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int selectedIndex = 0;

  final Widget walletIcon = SvgPicture.asset('assets/icons/wallet.svg');
  final Widget favoriteIcon = SvgPicture.asset('assets/icons/favorite.svg');
  final Widget profileIcon = SvgPicture.asset('assets/icons/profile.svg');

  //list of widgets to call ontap
  final widgetOptions = [
    const ChatPage(),
    const FavoritePage(),
    const ProflePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: widgetOptions.elementAt(selectedIndex),
        ),
        bottomNavigationBar: Container(
          height: 72,
          decoration: const BoxDecoration(
            color: Color.fromRGBO(1, 0, 53, 1),
            borderRadius: BorderRadius.all(Radius.circular(30)),
          ),
          child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(30)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: const <Widget>[
                      Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: Icon(
                          Icons.circle,
                          color: Colors.white,
                          size: 8,
                        ),
                      ),
                      Text(
                        'Explorer',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'MarkPro',
                          fontWeight: FontWeight.w700,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    enableFeedback: false,
                    onPressed: () {
                      setState(() {
                        selectedIndex = 1;
                      });
                    },
                    icon: walletIcon,
                  ),
                  IconButton(
                      enableFeedback: false,
                      onPressed: () {
                        setState(() {
                          selectedIndex = 2;
                        });
                      },
                      icon: favoriteIcon),
                  IconButton(
                      enableFeedback: false,
                      onPressed: () {
                        setState(() {
                          selectedIndex = 3;
                        });
                      },
                      icon: profileIcon),
                ],
              )),
        ));
  }
}
