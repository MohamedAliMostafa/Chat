import 'package:chat/model/Massage/Massage.dart';
import 'package:chat/model/Rooms/RoomsModel.dart';
import 'package:chat/model/Users/Users.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class DatabaseStore
{
 static CollectionReference<UsersModel> getCollection()
  {
    CollectionReference<UsersModel> coll= FirebaseFirestore.instance.collection(UsersModel.Collection).withConverter(fromFirestore: (snapshot, options) =>
        UsersModel.FromJson(snapshot.data()??{}), toFirestore: (value, options) => value.toJosn(),);
  return coll;
  }

 static void addToFireStore(UsersModel usersModel)
{
  var collec = getCollection();
  var doch = collec.doc(usersModel.id);
  doch.set(usersModel);
}
  static Future<UsersModel?> ReadToFireStore(String id)
  async {
    DocumentSnapshot<UsersModel> getData= await getCollection().doc(id).get();
    return getData.data();
  }



 static CollectionReference<RooomsModel> getRoomsCollection()
 {
   CollectionReference<RooomsModel> coll= FirebaseFirestore.instance.collection(RooomsModel.Collection).withConverter(fromFirestore: (snapshot, options) =>
       RooomsModel.FromJson(snapshot.data()??{}), toFirestore: (value, options) => value.toJosn(),);
   return coll;
 }

 static Future<void> addRoomsToFireStore(RooomsModel RooomsModel)
 {
   var collec =getRoomsCollection();
   var doch = collec.doc();
   RooomsModel.id=doch.id;
  return doch.set(RooomsModel);
 }

 static Future<List<RooomsModel>> ReadRoomsToFireStore()
 async {
   var  getData= await getRoomsCollection().get();
  List<RooomsModel>Rooms= getData.docs.map((e) => e.data()).toList();
   return Rooms;
 }



 static CollectionReference<Massages> getMassageCollection(String roomID)
 {
   return getRoomsCollection().doc(roomID).collection(Massages.Collection).withConverter(fromFirestore: (snapshot, options) =>
       Massages.FromJson(snapshot.data()??{}), toFirestore: (value, options) => value.toJosn(),);

 }

 static Future<void> addMassageToFireStore(Massages massages)
 {
   var collec =getMassageCollection(massages.RoomID);
   var doch = collec.doc();
   massages.id=doch.id;
   return doch.set(massages);
 }

 static Stream<QuerySnapshot<Massages>> ReadMassageToFireStore(String RoomID){
   return getMassageCollection(RoomID).orderBy("DateTime").snapshots();
 }




}