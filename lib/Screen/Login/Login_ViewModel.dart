import 'package:chat/Base.dart';
import 'package:chat/Screen/Login/connector.dart';
import 'package:chat/Shared/Remote/FireBase_FireStore.dart';
import 'package:chat/model/Users/Users.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Login_ViewModel extends BaseViewModel<Connector> {
  Future<void> Log(String email, String Password) async {
    try {
      connector!.shows_Loding();
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: Password);
      UsersModel? usersModel=await DatabaseStore.ReadToFireStore(credential.user!.uid) ;
     if(UsersModel !=null)
       {
         connector!.HideDialog();
         connector!.goTohome(usersModel!);
       }

    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        connector!.HideDialog();
        connector!.showMassage("No user found for that email.");
      } else if (e.code == 'wrong-password') {
        connector!.HideDialog();
        connector!.showMassage("Wrong password provided for that user");

      }
    }
  }
}
