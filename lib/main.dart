import 'package:flutter/material.dart';
import 'package:zshopbd/view/home.dart';
import 'package:zshopbd/view/login.dart';
import 'package:zshopbd/providers/auth.dart';
import 'package:provider/provider.dart';
import 'package:zshopbd/view/register.dart';
void main() {
  runApp(ChangeNotifierProvider(create: (_) => AuthProvider.initialize(),
 
  child: MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
        primaryColor: Colors.deepOrange
    ),
    home: ScreenController(),
  )));
}
class ScreenController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //final user = Provider.of<AuthProvider>(context);
   // switch(user.status){
    //  case Status.Uninitialized:
  //      return RegistrationScreen();
  //    case Status.Unauthenticated:
  //    case Status.Authenticating:
    //    return Home();
    //  case Status.Authenticated:
    //    return Home();
    //  default: return LoginScreen();
   // }
   return Home();
  }
}