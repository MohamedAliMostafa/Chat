import 'package:chat/Shared/Remote/FireBase_FireStore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../model/Users/Users.dart';

class Mypro extends ChangeNotifier
{
  UsersModel? usersModel;
  User? user;

  Mypro()
  {
    try{
      user=FirebaseAuth.instance.currentUser!;
      ReadFromDatabase();
    }
    catch(e)
    {
      Text(e.toString());
    }

  }



  Future<void> ReadFromDatabase()
  async {
    if(user != null)
      {
          usersModel=await DatabaseStore.ReadToFireStore(user!.uid);
      }
  }

}