import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextSign extends StatelessWidget {
  TextEditingController controller;
  String? Function(String?)? valid;
  String errorMsg;
  String hint;
  bool obs;
  TextInputType type;
  Widget? suffixicon;
  Widget? prfix;

  TextSign({required this.controller, this.valid, required this.errorMsg, required this.hint,
    required this.obs, required this.type,this.suffixicon,this.prfix});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller:controller ,
      validator: valid,
      keyboardType:type ,
      obscureText: obs,
      decoration: InputDecoration(
          errorStyle:  TextStyle(fontSize: 10.sp),
          suffixIcon:suffixicon ,
          prefixIcon: prfix,
          prefixIconColor: Colors.black,
          hintText: hint,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18.r),
            borderSide: const BorderSide(color: Colors.black54),
          )),
    );
  }
}
