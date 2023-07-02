import 'package:chat/Base.dart';
import 'package:chat/Screen/AddRooms/AddROOMS.dart';
import 'package:chat/Screen/Home/HomeConnector.dart';
import 'package:chat/Screen/Home/HomeScreenViewModel.dart';
import 'package:chat/Screen/Login/Login.dart';
import 'package:chat/Shared/Components/GridViewInHome/GridInHome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
static const String RouteName="home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends BaseView<HomeScreeViewModel,HomeScreen> implements HomeConnector {

@override
void initState() {
    // TODO: implement initState
    super.initState();
    VModel.connector=this;
    VModel.GetRooms();

  }
  @override
  Widget build(BuildContext context) {
    VModel.GetRooms();
    return ChangeNotifierProvider(
      create: (context) => VModel,
      child: Scaffold(
        backgroundColor: Colors.black87.withOpacity(0.5),
        appBar: AppBar(
          backgroundColor: Colors.teal,
          actions: [
            IconButton(onPressed: (){
              setState(() {
                VModel.Sign_out();
                Navigator.pushReplacementNamed(context, Login.Routename);
              });
            }, icon: const Icon(Icons.login_outlined,))
          ],
        ),
        floatingActionButton: Container(
          margin: REdgeInsets.only(left: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FloatingActionButton(
                backgroundColor: Colors.teal,
                onPressed: () {
                  setState(() {

                  });
                },
                child: const Text("Rooms"),),
              FloatingActionButton(
                  backgroundColor: Colors.teal,
                  onPressed: () {
                Navigator.pushReplacementNamed(context, AddRooms.RouteName);
              },
              child: const Icon(Icons.add)),


            ],
          ),
        ),
        body: Padding(
          padding: REdgeInsets.all(8.0),
          child:Consumer<HomeScreeViewModel>(
            builder: (context, vm, child) {
              vm.GetRooms();
            return GridView.builder(
              itemCount: vm.Rooms.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisSpacing: 10,crossAxisSpacing: 10,),
              itemBuilder: (context, index) {
                var v=vm.Rooms[index];
                return GridHome(v);
              },);
          },)
          ),
        ),
    );
  }

  @override
  HomeScreeViewModel InitViewModel() {
    return HomeScreeViewModel();
  }
}
