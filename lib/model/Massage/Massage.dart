
class Massages
{
  static const String Collection="Massages";
  String id;
  String content;
  String RoomID;
  int DateTime;
 String SenderName;
 String? Sender_ID;


  Massages({ this.id="", required this.content, required this.RoomID, required this.DateTime, required this.SenderName, this.Sender_ID});

  static Massages FromJson(Map<String , dynamic >jos) {

    Massages userModel=Massages(id:jos["id"],content: jos["content"], RoomID: jos["RoomID"], DateTime: jos["DateTime"],SenderName: jos["SenderName"],Sender_ID: jos["Sender_ID"],);
    return userModel;
  }
  Map<String, dynamic>toJosn()
  {
    return
      {
        "id":id,
        "content": content,
        "RoomID": RoomID,
        "DateTime": DateTime,
        "SenderName": SenderName,
        "Sender_ID":Sender_ID
      };
  }

}