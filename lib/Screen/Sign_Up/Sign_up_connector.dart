import 'package:chat/Base.dart';
import 'package:chat/model/Users/Users.dart';

abstract class UpConnector extends BaseNaigator
{
void goToHome(UsersModel usersModel);
}