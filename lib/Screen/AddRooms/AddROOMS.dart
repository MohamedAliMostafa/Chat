import 'package:chat/Base.dart';
import 'package:chat/Screen/AddRooms/AddRooms_Connector.dart';
import 'package:chat/Screen/AddRooms/AddRooms_ViewModel.dart';
import 'package:chat/Screen/Home/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../Shared/Components/DropDown/DropDown.dart';
import '../../Shared/Components/Sign/Sign.dart';

class AddRooms extends StatefulWidget {
static const String RouteName="ADDrooms";

var RoomNameCont=TextEditingController();
var RoomDesCont=TextEditingController();
String? Catid;
var k=GlobalKey<FormState>();

  @override
  State<AddRooms> createState() => _AddRoomsState();
}

class _AddRoomsState extends BaseView<AddRooms_ViewModel,AddRooms> implements AddRooms_Connector{
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    VModel.connector=this;
  }
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => VModel,
      child:  Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          height: double.infinity.h,
          width: double.infinity.w,
          decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  "assets/images/OIP.jpeg",
                )),
          ),
          child: ListView(
            children: [
              Form(
                key:widget.k,
                child: Card(
                  shadowColor: Colors.white,
                  color: Colors.white.withOpacity(0.50),
                  shape: OutlineInputBorder( borderRadius: BorderRadius.all(Radius.circular(20.r))),
                  margin: REdgeInsets.symmetric(vertical: 80,horizontal: 20),
                  child: Container(
                    padding: REdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Create New Room",
                          style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        SizedBox(height: 20.h),
                         Container(
                           decoration: BoxDecoration(
                             border: Border.all(color: Colors.black87)
                           ),
                             width: 150.w,
                             height: 150.h,
                             child: const Image(image: AssetImage("assets/images/2.jpeg"),fit: BoxFit.cover,)),
                        SizedBox(height: 20.h),
                        TextSign(
                          controller: widget.RoomNameCont,
                          valid: (val) {
                            if (val == null || val.isEmpty) {
                              return "Rquried field ";
                            }
                            return null;
                          },
                          errorMsg: "Rquired field",
                          hint: "Rooms Name",
                          type: TextInputType.name,
                          obs: false,
                          suffixicon: const Icon(Icons.drive_file_rename_outline_sharp),
                        ),
                        SizedBox(height: 20.h),
                        DropDowm(
                          item1: "Sports",
                          item2: "Music",
                          item3:"Movies",
                          select: "Sports",
                          onchange: (val) {
                           widget.Catid=val;
                          },
                        ),
                        SizedBox(height: 20.h),
                        TextSign(
                          obs: false,
                          type: TextInputType.text,
                          controller: widget.RoomDesCont,
                          valid: (val) {
                            if (val == null || val.isEmpty) {
                              return "Rquried field ";
                            }
                            return null;
                          },
                          errorMsg: "Rquired field",
                          hint: "Room Description",
                          suffixicon: const Icon(Icons.description),
                        ),
                        SizedBox(height: 20.h),
                        Container(
                          width: 200.w,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.black87,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15.r))),
                              onPressed: () async {
                                if (widget.k.currentState!.validate()) {
                                VModel.Create_Rooms(widget.RoomNameCont.text, widget.RoomDesCont.text, widget.Catid);


                                }
                              },
                              child: const Text("Create Room")),
                        ),

                      ],
                    ),
                  ),
                ),

              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  AddRooms_ViewModel InitViewModel() {
  return AddRooms_ViewModel();
  }

  @override
  void CreateRooms() {
    Navigator.pushReplacementNamed(context, HomeScreen.RouteName);
  }
}
