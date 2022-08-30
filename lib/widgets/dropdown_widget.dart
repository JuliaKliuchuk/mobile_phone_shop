import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile_phone_shop/themes/custom_color.dart';
import 'package:mobile_phone_shop/themes/theme.dart';

class DropdownWidget extends StatefulWidget {
  const DropdownWidget({Key? key}) : super(key: key);

  @override
  State<DropdownWidget> createState() => _DropdownWidgetState();
}

class _DropdownWidgetState extends State<DropdownWidget> {
  String selectedValue = 'Zihuatanejo, Gro';

  final locationItems = [
    'Zihuatanejo, Gro',
    'Zihuatanejo, Gro2',
    'Zihuatanejo, Gro3',
  ];

  final Widget placeIcon = SvgPicture.asset('assets/icons/place.svg');
  final Widget filterIcon = SvgPicture.asset('assets/icons/filter.svg');

  Widget _categoryWidget() {
    return DropdownButtonHideUnderline(
      child: DropdownButton(
        value: selectedValue,
        style: const TextStyle(
          fontFamily: 'MarkPro',
          fontSize: 15,
          color: CustomColors.darkBlue,
          fontWeight: FontWeight.w700,
        ),
        icon: const Icon(
          Icons.keyboard_arrow_down,
          color: CustomColors.iconColor,
        ),
        items: locationItems.map((String items) {
          return DropdownMenuItem(
            value: items,
            child: Text(items),
          );
        }).toList(),
        onChanged: (String? newValue) {
          setState(() {
            selectedValue = newValue!;
          });
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Spacer(),
          Row(
            children: [
              Container(
                alignment: Alignment.topCenter,
                child: IconButton(
                  enableFeedback: false,
                  onPressed: () {},
                  icon: placeIcon,
                ),
              ),
              _categoryWidget(),
            ],
          ),
          const Spacer(),
          IconButton(
            enableFeedback: false,
            onPressed: () {},
            icon: filterIcon,
            color: CustomColors.iconColor,
          ),
        ],
      ),
    );
  }
}
