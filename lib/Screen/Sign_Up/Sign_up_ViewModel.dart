import 'package:chat/Base.dart';
import 'package:chat/Screen/Sign_Up/Sign_up_connector.dart';
import 'package:chat/model/Users/Users.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../Shared/Remote/FireBase_FireStore.dart';


class Sign_up_ViewModel extends BaseViewModel<UpConnector>
{
 Future<void> CreateAccount(String fname,String age,String emailAddress ,String password)
async {
  try {
    connector!.shows_Loding();
    final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: emailAddress,
      password: password,
    );
    UsersModel usersModel =UsersModel(id: credential.user?.uid??"", fName: fname, age: age, email: emailAddress);
    DatabaseStore.addToFireStore(usersModel);
    connector!.HideDialog();
    connector?.goToHome(usersModel);


  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      connector!.HideDialog();
      connector!.showMassage("The password provided is too weak.");
    } else if (e.code == 'email-already-in-use') {
      connector!.HideDialog();
      connector!.showMassage("The account already exists for that email.");

    }
  } catch (e) {
    print(e);
  }
}
}