import 'package:flutter/material.dart';
import 'package:zshopbd/controllers/bottom_navigation_icons.dart';
import 'package:zshopbd/controllers/display_navigation.dart';
import 'package:zshopbd/view/bag.dart';
import 'package:zshopbd/widget/categories.dart';
import 'package:zshopbd/controllers/style.dart';
import 'package:zshopbd/widget/favourite_product.dart';
import 'package:zshopbd/widget/typo.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: white,

      body: SafeArea(
        child: ListView(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomText(
                    text: "আপনি কোন খাবারটি চান?",
                    size: 18,
                  ),
                ),
                Stack(
                  children: <Widget>[
                    IconButton(
                        icon: Icon(Icons.notifications_none), onPressed: () {}),
                    Positioned(
                      top: 12,
                      right: 12,
                      child: Container(
                        height: 10,
                        width: 10,
                        decoration: BoxDecoration(
                            color: red, borderRadius: BorderRadius.circular(20)),
                      ),
                    )
                  ],
                )
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(color: white, boxShadow: [
                  BoxShadow(color: grey[300], offset: Offset(1, 1), blurRadius: 4)
                ]),
                child: ListTile(
                  leading: Icon(
                    Icons.search,
                    color: red,
                  ),
                  title: TextField(
                    decoration: InputDecoration(
                        hintText: "প্রিয় খাবার ও রেস্তোরা অনুসন্ধান করুন?",
                        border: InputBorder.none),
                  ),
                  trailing: Icon(
                    Icons.filter_list,
                    color: red,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Categories(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomText(
                text: "সুনামওয়ালা",
                size: 20,
                color: grey,
              ),
            ),
            Favourite(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomText(
                text: "জনপ্রিয়",
                size: 20,
                color: grey,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Stack(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Image.asset("assets/pizza.jpg")
                      ),),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(Icons.favorite, color: red,),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: 50,
                                decoration: BoxDecoration(
                                  color: white,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Row(children: <Widget>[
                                  Padding(
                                     padding: const EdgeInsets.all(2.0),
                                     child: Icon(Icons.star, color: Colors.yellow[900],size: 20,),
                                  ),
                                  Text("৪.৫"),
                                ],),
                              ),
                            ),
                            
                          ],
                        ),
                      ),
                      Positioned.fill(
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            height: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20)
                              ),
                              gradient: LinearGradient(
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                                colors: [
                                  Colors.black.withOpacity(0.8),
                                  Colors.black.withOpacity(0.7),
                                  Colors.black.withOpacity(0.6),
                                  Colors.black.withOpacity(0.4),
                                  Colors.black.withOpacity(0.1),
                                  Colors.black.withOpacity(0.05),
                                  Colors.black.withOpacity(0.025),
                                ],
                              )
                            ),
                          ),
                        ),
                      ),
                      Positioned.fill(
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                           Padding(
                             padding: const EdgeInsets.fromLTRB(12,8,8,8),
                                child:RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(text: "পিজ্জা\n", style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
                                    TextSpan(text: "বাই: ",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w300)),
                                    TextSpan(text: "আন্টির পিজ্জা \n",style: TextStyle(fontSize: 16)),
                                  ],
                                  style: TextStyle(color: white),
                                ),
                              ),
                           ),
                           Padding(
                             padding: const EdgeInsets.all(8.0),
                             child: RichText(
                               text: TextSpan(
                                 children: [
                                   TextSpan(text: "৯৫ টাকা \n",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold)),
                                 ],
                                 style: TextStyle(color: white),
                               ),
                             ),
                           )
                            ],
                          ),
                        ), 
                      )
                ],
              ),
            ),
            //container is copied from here
          ],
        ),
      ),

      bottomNavigationBar: Container(
        height: 73,
        color: white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            BottomNavIcon(
              image: "home.png",
              name: "Home",
            ),
            BottomNavIcon(
              onTap: (){
                changeScreen(context, ShoppingBag());
              },
              image: "shopping-bag.png",
              name: "Card",
            ),
            BottomNavIcon(
              image: "avatar.png",
              name: "Account",
            ),

            /* Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.restaurant),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.home),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.account_circle),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(icon: Icon(Icons.shopping_basket), onPressed: () { print("Pressed"); },),
            ) */
          ],
        ),
      ),
    );

  }
}
