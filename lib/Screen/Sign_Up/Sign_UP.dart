import 'package:chat/Base.dart';
import 'package:chat/Screen/Home/HomeScreen.dart';
import 'package:chat/Screen/Login/Login.dart';
import 'package:chat/Screen/Sign_Up/Sign_up_ViewModel.dart';
import 'package:chat/Screen/Sign_Up/Sign_up_connector.dart';
import 'package:chat/Shared/Components/Sign/Sign.dart';
import 'package:chat/model/Users/Users.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../StateManagment/Provider.dart';

class SignUp extends StatefulWidget {
  static const String RouteName = "signup";

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends BaseView<Sign_up_ViewModel,SignUp> implements UpConnector {
  var namecont = TextEditingController();
  var agecont = TextEditingController();
  var Emailcont = TextEditingController();
  var passcont = TextEditingController();
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
                  color: Colors.white.withOpacity(0.7),
                  margin: REdgeInsets.symmetric(vertical: 90,horizontal: 30),
                  shape: OutlineInputBorder(borderRadius: BorderRadius.circular(18.r)),
                  child: Container(
                    padding: REdgeInsets.symmetric(vertical: 30,horizontal: 20),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "SignUp",
                          style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        TextSign(
                          valid: (val) {
                            if (val == null || val.isEmpty) {
                              return "requried Field";
                            } else if (val.length < 7) {
                              return "low Name";
                            }
                            return null;
                          },
                          controller: namecont,
                          errorMsg: "Requried Field",
                          hint: "Name",
                          obs: false,
                          type: TextInputType.name,
                          prfix: const Icon(Icons.person),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        TextSign(
                          valid: (val) {
                            if (val == null || val.isEmpty) {
                              return "requried Field";
                            }
                            return null;
                          },
                          controller: agecont,
                          errorMsg: "Requried Field",
                          hint: "Age",
                          obs: false,
                          type: TextInputType.number,
                          prfix: const Icon(Icons.drive_file_rename_outline_sharp),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        TextSign(
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
                          controller: Emailcont,
                          errorMsg: "Requried Field",
                          hint: "Email",
                          obs: false,
                          type: TextInputType.emailAddress,
                          prfix: const Icon(Icons.email),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        TextSign(
                          valid: (val) {
                            if (val == null || val.isEmpty) {
                              return "requried Field";
                            } else if (val.length < 6) {
                              return "low Password";
                            }
                            return null;
                          },
                          controller: passcont,
                          errorMsg: "Requried Field",
                          hint: "Password",
                          obs: obs,
                          type: TextInputType.visiblePassword,
                          prfix: Icon(obs == true ? Icons.lock : Icons.lock_open),
                          suffixicon: IconButton(
                              icon: obs == false
                                  ? const Icon(Icons.visibility_off)
                                  : Icon(Icons.visibility),
                              onPressed: () {
                                setState(() {
                                  obs = !obs;
                                });
                              }),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black87,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.r))),
                            onPressed: () {
                              if (ke.currentState!.validate()) {
                                VModel.CreateAccount(namecont.text,agecont.text,
                                    Emailcont.text, passcont.text);
                              }
                            },
                            child: const Text("SignUp")),
                        SizedBox(height: 20.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              " have an account?",
                              style: TextStyle(
                                  fontSize: 17.sp,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black),
                            ),
                            TextButton(
                              style: ButtonStyle(foregroundColor: MaterialStateProperty.all(Colors.white)),
                                onPressed: () {
                                  Navigator.pushReplacementNamed(
                                      context, Login.Routename);
                                },
                                child: Text(
                                  "Login",
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
          )),
    );
  }

  @override
  Sign_up_ViewModel InitViewModel() {
   return Sign_up_ViewModel();
  }

  @override
  void goToHome(UsersModel usersModel) {
    var pro=Provider.of<Mypro>(context,listen: false);
    pro.usersModel=usersModel;
    Navigator.pushReplacementNamed(context, HomeScreen.RouteName);
  }
}
