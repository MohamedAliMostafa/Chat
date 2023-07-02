import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class DropDowm extends StatefulWidget {
  String item1;
  String item2;
  String item3;
  String select;
  ValueChanged<String?>? onchange;


  DropDowm({required this.item1, required this.item2, this.onchange,required this.select,required this.item3});

  @override
  State<DropDowm> createState() => _DropDowmState();
}

class _DropDowmState extends State<DropDowm> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: REdgeInsets.all(30),
      padding: REdgeInsets.symmetric(horizontal: 10),
      child: DropdownSearch<String>(
          popupProps: const PopupProps.menu(
              fit: FlexFit.loose
          ),
          items: [widget.item1, widget.item2,widget.item3],
          dropdownDecoratorProps: DropDownDecoratorProps(
            dropdownSearchDecoration: const InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black87)
              ),
              border:OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white)
              ),
            ),
            baseStyle: Theme.of(context).textTheme.labelLarge!.copyWith(
              fontSize: 14.sp,
              fontWeight: FontWeight.bold
            ),
          ),
          onChanged:widget.onchange,
          selectedItem:widget.select
      ),
    );
  }
}