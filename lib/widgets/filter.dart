import 'package:flutter/material.dart';
import 'package:mobile_phone_shop/model/data.dart';
import 'package:mobile_phone_shop/themes/custom_color.dart';
import 'package:mobile_phone_shop/widgets/custom_text_widget.dart';
import 'package:mobile_phone_shop/widgets/extentions.dart';

class FilterWidget extends StatefulWidget {
  const FilterWidget({Key? key}) : super(key: key);

  @override
  State<FilterWidget> createState() => _HotSalesWidgetState();
}

class _HotSalesWidgetState extends State<FilterWidget> {
  Widget _header() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _icon(Icons.close),
        const CustomTextWidget(
          text: 'Filter options',
          fontWeight: FontWeight.w500,
          fontSize: 18,
        ),
        TextButton(
          style: TextButton.styleFrom(
            backgroundColor: CustomColors.orange,
            textStyle: const TextStyle(
              fontSize: 18,
            ),
          ),
          onPressed: () {},
          child: const CustomTextWidget(
            text: 'Done',
            fontWeight: FontWeight.w500,
            fontSize: 18,
            color: CustomColors.white,
          ),
        ),
      ],
    );
  }

  Widget _icon(IconData icon, {Function? onPressed}) {
    return Container(
      height: 37,
      width: 37,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        color: CustomColors.darkBlue,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Icon(icon, color: CustomColors.white, size: 15),
    ).ripple(
      () {
        if (onPressed != null) {
          onPressed();
        }
      },
    );
  }

  _form() {
    return SizedBox(
      child: Column(
        children: AppData.filterOptionsList
            .map((item) => _input(item.title, item.value))
            .toList(),
      ),
    );
  }

  Widget _input(
    String title,
    String value,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 10,
        ),
        CustomTextWidget(
          text: title,
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 40,
          child: TextField(
            decoration: InputDecoration(
              suffixIcon: const Icon(
                Icons.expand_more,
                color: CustomColors.lightGrey,
                size: 16,
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: CustomColors.lightGrey, width: 1),
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: CustomColors.lightGrey, width: 1),
              ),
              hintText: value,
              hintStyle: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
                color: CustomColors.darkBlue,
                fontFamily: 'MarkPro',
              ),
              isDense: true, // Added this
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            ),
            readOnly: true,
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      decoration: const BoxDecoration(
        color: CustomColors.white,
        borderRadius: BorderRadius.all(Radius.circular(30)),
        boxShadow: [
          BoxShadow(
              color: Color.fromRGBO(76, 95, 143, 0.2),
              offset: Offset(0, 0),
              blurRadius: 20)
        ],
      ),
      child: Column(
        children: [
          _header(),
          const SizedBox(
            height: 20,
          ),
          _form(),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
