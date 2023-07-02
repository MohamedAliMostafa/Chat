import 'package:chat/Base.dart';
import 'package:chat/Screen/Chat/CHatConnector.dart';
import 'package:chat/Screen/Chat/ChatViewModel.dart';
import 'package:chat/StateManagment/Provider.dart';
import 'package:chat/model/Massage/Massage.dart';
import 'package:chat/model/Rooms/RoomsModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../Shared/Components/MassageWidget/MassageWidget.dart';

class ChatScreen extends StatefulWidget {
static const String ROUTEName="CHAT";
var control = TextEditingController();
  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends BaseView<ChatViewModel,ChatScreen> implements ChatConnector{
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    VModel.connector=this;
  }
  @override

  Widget build(BuildContext context) {
    var room= ModalRoute.of(context)?.settings.arguments as RooomsModel;
    var pro=Provider.of<Mypro>(context);
    VModel.rooomsModel=room;
    VModel.usersModel=pro.usersModel!;
    VModel.ReadMassage();
    return ChangeNotifierProvider(
      create: (context) => VModel,
      child: Scaffold(
        backgroundColor:Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.teal,
          foregroundColor: Colors.black,
          centerTitle: true,
          title: Text(room.RoomsName),
        ),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage("assets/images/back.webp")
            )
          ),
          child: Column(
            children: [
              Expanded(child: StreamBuilder<QuerySnapshot<Massages>>(
                stream: VModel.ReadMassage(),
                builder: (context, snapshot) {
                 VModel.rooomsModel=room;
                  if(snapshot.connectionState==ConnectionState.waiting)
                    {
                   return const Center(child: CircularProgressIndicator());
                    }
                  else if(snapshot.hasError)
                    {
                    return  Text(snapshot.error.toString());
                    }
                  else if (!snapshot.hasData)
                    {
                      return Text("Loading............");
                    }
                  var lisMsg=snapshot.data!.docs.map((e)=>e.data()).toList();
                  return ListView.builder(
                    itemCount: lisMsg.length,
                    itemBuilder: (context, index) {
                    return MassageWidget(lisMsg[index]);
                  },);
              },)),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller:widget.control,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(32.r)),
                        hintText: "Type a Massage"
                      ),
                    ),
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32.r))
                      ),
                      onPressed: (){
                    VModel.sendMassage(widget.control.text);
                  }, child:Row(
                    children: const [
                      Text("Send"),
                      Icon(Icons.send)
                    ],
                  ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  ChatViewModel InitViewModel() {
   return ChatViewModel();
  }

  @override
  void ClearMsg() {
    widget.control.clear();
  }
}
