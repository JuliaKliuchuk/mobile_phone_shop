import 'package:flutter/material.dart';
import 'package:mobile_phone_shop/model/data.dart';
import 'package:mobile_phone_shop/themes/app_color.dart';

class SelectLocation extends StatefulWidget {
  const SelectLocation({Key? key}) : super(key: key);

  @override
  State<SelectLocation> createState() => _SelectLocationState();
}

class _SelectLocationState extends State<SelectLocation> {
  String selectedValue = 'Zihuatanejo, Gro';

  final locationItems = [
    'Zihuatanejo, Gro',
    'Zihuatanejo, Gro2',
    'Zihuatanejo, Gro3',
  ];

  Widget _location() {
    return DropdownButtonHideUnderline(
      child: DropdownButton(
        value: selectedValue,
        style: const TextStyle(
          fontFamily: 'MarkPro',
          fontSize: 15,
          color: AppColors.darkBlue,
          fontWeight: FontWeight.w700,
        ),
        icon: const Icon(
          Icons.keyboard_arrow_down,
          color: AppColors.iconColor,
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
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
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
              _location(),
            ],
          ),
        ],
      ),
    );
  }
}
