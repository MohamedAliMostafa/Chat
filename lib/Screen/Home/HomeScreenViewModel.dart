import 'package:chat/Base.dart';
import 'package:chat/Screen/Home/HomeConnector.dart';
import 'package:chat/Shared/Remote/FireBase_FireStore.dart';
import 'package:chat/model/Rooms/RoomsModel.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeScreeViewModel extends BaseViewModel<HomeConnector>
{


  Future<void> Sign_out()
  async {
    await FirebaseAuth.instance.signOut();

  }

  List<RooomsModel> Rooms=[];
 void GetRooms() async {
   try {
     Rooms = await DatabaseStore.ReadRoomsToFireStore();
   }
   catch(e)
   {
     connector!.showMassage(e.toString());
   }
  }

}