import 'package:chat/Base.dart';
import 'package:chat/Screen/AddRooms/AddRooms_Connector.dart';
import 'package:chat/model/Rooms/RoomsModel.dart';

import '../../Shared/Remote/FireBase_FireStore.dart';

class AddRooms_ViewModel extends BaseViewModel<AddRooms_Connector>
{
void Create_Rooms(String Rname ,String Rdes,String? CatID)
{
  RooomsModel rooomsModel=RooomsModel(RoomsName: Rname, RoomsDes: Rdes, Cat_ID: CatID);
  DatabaseStore.addRoomsToFireStore(rooomsModel).then((value) {
connector!.CreateRooms();
  }).catchError((e){
    connector!.showMassage(e.toString());
  });
}
}