import 'package:chat/Base.dart';
import 'package:chat/Screen/Chat/CHatConnector.dart';
import 'package:chat/Shared/Remote/FireBase_FireStore.dart';
import 'package:chat/model/Massage/Massage.dart';
import 'package:chat/model/Rooms/RoomsModel.dart';
import 'package:chat/model/Users/Users.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatViewModel extends BaseViewModel<ChatConnector>
{
late RooomsModel rooomsModel;
late UsersModel usersModel;

void sendMassage(String cont) {

      Massages massages = Massages(
          content: cont, RoomID: rooomsModel.id, DateTime: DateTime
          .now()
          .microsecondsSinceEpoch, SenderName:usersModel.fName,Sender_ID: usersModel.id);
      DatabaseStore.addMassageToFireStore(massages).then((value){
        connector!.ClearMsg();
      }).catchError((e){
        connector?.showMassage(e.toString());
      });

  }


Stream<QuerySnapshot<Massages>> ReadMassage()
  {
   return DatabaseStore.ReadMassageToFireStore(rooomsModel.id);
  }
}