
class RooomsModel
{
  static const String Collection="Rooms";
  String id;
  String RoomsName;
  String RoomsDes;
  String? Cat_ID ;

  RooomsModel({this.id="", required this.RoomsName, required this.RoomsDes,  this.Cat_ID});

  static RooomsModel FromJson(Map<String , dynamic >jos) {

    RooomsModel userModel=RooomsModel(id:jos["id"],RoomsName: jos["RoomsName"], RoomsDes: jos["RoomsDes"], Cat_ID: jos["Cat_ID"]);
    return userModel;
  }
  Map<String, dynamic>toJosn()
  {
    return
      {
        "id":id,"RoomsName":RoomsName, "RoomsDes":RoomsDes,"Cat_ID":Cat_ID
      };
  }

}