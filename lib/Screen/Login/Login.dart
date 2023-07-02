import 'package:chat/Base.dart';
import 'package:chat/Screen/Home/HomeScreen.dart';
import 'package:chat/Screen/Login/Login_ViewModel.dart';
import 'package:chat/Screen/Login/connector.dart';
import 'package:chat/Screen/Sign_Up/Sign_UP.dart';
import 'package:chat/Shared/Components/Sign/Sign.dart';
import 'package:chat/StateManagment/Provider.dart';
import 'package:chat/model/Users/Users.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';



class Login extends StatefulWidget {
  static const String Routename = "lOGIN";

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState  extends BaseView<Login_ViewModel,Login >  implements Connector {
  var Textemail = TextEditingController();

  var Textpass = TextEditingController();

  var ke = GlobalKey<FormState>();


  bool obs = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    VModel.connector=this;
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => VModel,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          height: double.infinity.h,
          width: double.infinity.w,
          decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  "assets/images/OIP.jpeg",
                )),
          ),
          child: Form(
            
            key: ke,
              child: Card(
                shadowColor: Colors.white,
                color: Colors.white.withOpacity(0.50),
                shape: OutlineInputBorder( borderRadius: BorderRadius.all(Radius.circular(20.r))),
                margin: REdgeInsets.symmetric(vertical: 150,horizontal: 20),
                child: Container(
                  padding: REdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Login",
                        style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      SizedBox(height: 20.h),
                      TextSign(
                        controller: Textemail,
                        valid: (val) {
                          final bool emailValid = RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(val!);
                          if (val == null || val.isEmpty) {
                            return "Rquried field ";
                          } else if (!emailValid) {
                            return "email vaild";
                          }
                          return null;
                        },
                        errorMsg: "Rquired field",
                        hint: "Email",
                        type: TextInputType.emailAddress,
                        obs: false,
                        prfix: const Icon(Icons.email_outlined),
                      ),
                      SizedBox(height: 20.h),
                      TextSign(
                        type: TextInputType.visiblePassword,
                        obs: obs,
                        controller: Textpass,
                        valid: (val) {
                          if (val == null || val.isEmpty) {
                            return "Rquried field ";
                          } else if (val.length < 6) {
                            return "low Password";
                          }
                          return null;
                        },
                        errorMsg: "Rquired field",
                        hint: "Password",
                        prfix: Icon(obs == true ? Icons.lock : Icons.lock_open),
                        suffixicon: IconButton(
                            icon: obs == false
                                ? const Icon(Icons.visibility_off)
                                : const Icon(Icons.visibility),
                            onPressed: () {
                              setState(() {
                                obs = !obs;
                              });
                            }),
                      ),
                      SizedBox(height: 20.h),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black87,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.r))),
                          onPressed: () async {
                            if (ke.currentState!.validate()) {
                              await VModel.Log(Textemail.text, Textpass.text);


                            }
                          },
                          child: const Text("Login")),
                      SizedBox(height: 40.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an account?",
                            style: TextStyle(
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w600,
                                color: Colors.black),
                          ),
                          TextButton(
                            style: ButtonStyle(foregroundColor:MaterialStateProperty.all(Colors.white) ),
                              onPressed: () {
                                Navigator.pushReplacementNamed(
                                    context, SignUp.RouteName);
                              },
                              child: Text(
                                "Create account",
                                style: TextStyle(
                                    fontSize: 15.sp, fontWeight: FontWeight.bold),
                              )),
                        ],
                      )
                    ],
                  ),
                ),
              ),

          ),
        ),
      ),
    );
  }

  @override
  Login_ViewModel InitViewModel() {
    return Login_ViewModel();
  }

  @override
  void goTohome(UsersModel usersModel) {
    var pro=Provider.of<Mypro>(context,listen: false);
    pro.usersModel=usersModel;
    Navigator.pushReplacementNamed(context, HomeScreen.RouteName);
  }
}
