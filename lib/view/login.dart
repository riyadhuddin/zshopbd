import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zshopbd/controllers/display_navigation.dart';
import 'package:zshopbd/controllers/style.dart';
import 'package:zshopbd/providers/auth.dart';
import 'package:zshopbd/view/register.dart';
import 'package:zshopbd/widget/loading.dart';
import 'package:zshopbd/widget/typo.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _key = GlobalKey<ScaffoldState>();

  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AuthProvider>(context);
    return Scaffold(
       key: _key,
      backgroundColor: white,
      body:user.status == Status.Authenticating ? Loading(): Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: Column(
              key: _formKey,
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset("assets/tomato6.png", width: 240,height: 240,),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: grey),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: TextFormField(
                        controller: _email,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Emails",
                          icon: Icon(Icons.alternate_email),
                        ),
                          validator: (value) {
                                  if (value.isEmpty) {
                                    Pattern pattern =
                                        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                                    RegExp regex = new RegExp(pattern);
                                    if (!regex.hasMatch(value))
                                      return 'Please make sure your email address is valid';
                                    else
                                      return null;
                                  }
                                },
                      ),
                    ),
                  ),
                ),
                 Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: grey),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: TextFormField(
                        controller: _password,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Password",
                          icon: Icon(Icons.lock_outline),
                        ),
                           validator: (value) {
                                  if (value.isEmpty) {
                                    return "The password field cannot be empty";
                                  } else if (value.length < 6) {
                                    return "the password has to be at least 6 characters long";
                                  }
                                  return null;
                                },
                      ),
                    ),
                  ),
                ),
                 Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Material(
                   // decoration: BoxDecoration(
                      color: red,
                      elevation: 0.0,
                     // border: Border.all(color: grey),
                      borderRadius: BorderRadius.circular(15),
                      child: MaterialButton(
                         onPressed: () async{
                                  if(_formKey.currentState.validate()){
                                    if(!await user.signIn(_email.text, _password.text))
                                      _key.currentState.showSnackBar(SnackBar(content: Text("Sign in failed")));
                                  }
                                },
                                minWidth: MediaQuery.of(context).size.width,
                                child: Text(
                                  "Login",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0),
                                ),
                              )),
                      ),
                  //  ),
                  /*   child: Padding(
                      padding: const EdgeInsets.only(top:10,bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          CustomText(
                            text: "Login",color: white,size: 22,
                          )
                        ],
                      ),
                    ), */
             // ],
                  //),
               // ),
                GestureDetector(
                  onTap: (){
                    changeScreen(context, RegistrationScreen());
                  },
                    child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CustomText(
                        text: "Register",size: 22,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
              ],
            ),
          );
  }
}