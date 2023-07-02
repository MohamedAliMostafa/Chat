import 'package:flutter/material.dart';

abstract class BaseNaigator
{
   void shows_Loding();
   void HideDialog();
   void showMassage(String msg);
}
class BaseViewModel<nav extends BaseNaigator> extends ChangeNotifier
{
  nav? connector=null;
}
abstract class BaseView <vm extends BaseViewModel ,T extends StatefulWidget> extends State<T> implements BaseNaigator
{
  late vm VModel;
  vm InitViewModel();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    VModel=InitViewModel();
  }



  @override
  void HideDialog() {
    Navigator.pop(context);
  }


  @override
  void showMassage(String msg) {
    showDialog<void>(
      context: context,
      builder: (BuildContext dialogContext) {
        return Center(
          child: AlertDialog(
            content:  Text(msg.toString(),overflow: TextOverflow.ellipsis,),
          ),
        );
      },
    );
  }

  @override
  void shows_Loding() {
    showDialog<void>(
      context: context,
      builder: (BuildContext dialogContext) {
        return const Center(child: CircularProgressIndicator());
      },
    );
  }

}