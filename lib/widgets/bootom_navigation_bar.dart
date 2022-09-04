import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile_phone_shop/themes/custom_color.dart';
import 'package:mobile_phone_shop/themes/theme.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({Key? key}) : super(key: key);

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int selectedIndex = 0;

  final Widget walletIcon = SvgPicture.asset('assets/icons/wallet.svg');
  final Widget favoriteIcon = SvgPicture.asset('assets/icons/favorite.svg');
  final Widget profileIcon = SvgPicture.asset('assets/icons/profile.svg');

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppTheme.fullWidth(context),
      height: 72,
      decoration: const BoxDecoration(
        color: CustomColors.darkBlue,
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
                onPressed: () {},
                icon: walletIcon,
              ),
              IconButton(
                  enableFeedback: false,
                  onPressed: () {},
                  icon: favoriteIcon),
              IconButton(
                  enableFeedback: false,
                  onPressed: () { },
                  icon: profileIcon),
            ],
          )),
    );
  }
}
