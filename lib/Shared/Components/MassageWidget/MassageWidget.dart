import 'package:chat/StateManagment/Provider.dart';
import 'package:chat/model/Massage/Massage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class MassageWidget extends StatelessWidget {
  Massages massages;

  MassageWidget(this.massages);

  @override
  Widget build(BuildContext context) {
    var pro=Provider.of<Mypro>(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment:  pro.usersModel!.id==massages.Sender_ID?MainAxisAlignment.end:MainAxisAlignment.start,
          children: [
            pro.usersModel!.id==massages.Sender_ID?SenderMassage(massages):RecivMassage(massages),
          ],
        )

      ],
    );
  }
}

class SenderMassage  extends StatelessWidget {
  Massages massages;

  SenderMassage(this.massages);

  @override
  Widget build(BuildContext context) {
    int ts = 1646274840000;
    var dt = DateTime.fromMillisecondsSinceEpoch(ts);

    var date = DateFormat('MM/dd/yyyy, hh:mm a').format(dt);
    return Container(
      margin: REdgeInsets.only(right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            decoration: const BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.only(topLeft:Radius.circular(18),topRight: Radius.circular(18),bottomLeft: Radius.circular(18) )),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(massages.content,style: const TextStyle(fontWeight: FontWeight.bold),),
            ),
          ),
         Container(
             margin:  REdgeInsets.only(left: 10),
             child: Text(date.substring(11),style: const TextStyle(color: Colors.white),))
        ],
      ),
    );
  }
}
class RecivMassage extends StatelessWidget {
Massages massages;


RecivMassage(this.massages);

  @override
  Widget build(BuildContext context) {
    int ts = 1646274840000;
    var dt = DateTime.fromMillisecondsSinceEpoch(ts);

    var date = DateFormat('MM/dd/yyyy, hh:mm a').format(dt);
    return Container(
      margin: REdgeInsets.only(left: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(

            decoration: const BoxDecoration(
                color:Colors.grey,
                borderRadius: BorderRadius.only(topLeft:Radius.circular(18),topRight: Radius.circular(18),bottomRight: Radius.circular(18) )),
            child:  Padding(
              padding:  REdgeInsets.all(16.0),
              child: Text(massages.content,style: const TextStyle(fontWeight: FontWeight.bold),),
            ),
          ),
          Text(date.substring(11),style: const TextStyle(color: Colors.white),)
        ],
      ),
    );
  }
}


