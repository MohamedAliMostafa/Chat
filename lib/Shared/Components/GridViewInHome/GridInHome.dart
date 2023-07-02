import 'package:chat/Screen/Chat/ChatScreen.dart';
import 'package:chat/model/Rooms/RoomsModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class  GridHome extends StatefulWidget {

  RooomsModel Rooms;

  GridHome(this.Rooms);

  @override
  State<GridHome> createState() => _GridHomeState();
}

class _GridHomeState extends State<GridHome> {
@override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, ChatScreen.ROUTEName,arguments: widget.Rooms);
      },
      child: Container(
        decoration: BoxDecoration(
            boxShadow: const <BoxShadow>[
              BoxShadow(
                  color: Colors.white,
                  blurRadius: 2,
                  offset: Offset(0.0, 0.75)
              )
            ],
          borderRadius: BorderRadius.circular(18.r),
          color: Colors.teal.withOpacity(0.5),
        ),

            child: Padding(
              padding: REdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: 5.h,),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black87),
                        color: Colors.white
                      ),
                        width: 100.w,
                        height: 100.h,
                        child: Padding(
                          padding:  REdgeInsets.all(16.0),
                          child: Image(image: AssetImage(widget.Rooms.Cat_ID=="Sports"?"assets/images/sport.jpeg":widget.Rooms.Cat_ID=="Music"?"assets/images/music.png":"assets/images/movie.png"),fit: BoxFit.cover,width: 50.w,),
                        )),
                    SizedBox(height: 5.h,),
                    Text(widget.Rooms.RoomsName,style: const TextStyle(fontWeight: FontWeight.bold),),
                    SizedBox(height: 5.h,),
                    Card(
                        shape: OutlineInputBorder(borderRadius: BorderRadius.circular(18.r)),
                        child: Padding(
                          padding: REdgeInsets.all(8.0),
                          child: Text(widget.Rooms.RoomsDes),
                        ))
                  ],
                ),
              ),
            ),

        ),
    );

  }
}
