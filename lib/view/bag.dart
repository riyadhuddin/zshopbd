import 'package:flutter/material.dart';
import 'package:zshopbd/controllers/style.dart';
import 'package:zshopbd/models/products.dart';
import 'package:zshopbd/widget/typo.dart';

class ShoppingBag extends StatefulWidget {
  @override
  _ShoppingBagState createState() => _ShoppingBagState();
}

class _ShoppingBagState extends State<ShoppingBag> {
   Product product = Product(name: "রুটি",price: 0.78,image: "roti.jpg",rating: 4.7,vendor: "আম্মু", wishList: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: red,
        elevation: 0,
        centerTitle: true,
        title: CustomText(text: "Shopping Bag",),
        actions: <Widget>[
          Stack(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset("assets/images/shopping-bag.png",width: 30,height: 30,),
              ),
            ],
          )
        ],
      ),
      backgroundColor: white,
      body: Container(
        height: 200,
        decoration: BoxDecoration(
          color: white,
          boxShadow: [BoxShadow(
            color: red,
            offset: Offset(0,2),
            blurRadius: 5,
          ),]
        ),
        child: Row(
          children: <Widget>[
             Image.asset(
                            "assets/products_photo/${product.image}",
                            height: 120,
                            width: 120,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              RichText(text: TextSpan(
                                children: [
                                  TextSpan(text:" "+ product.name+ "\n", style: TextStyle(color: black,fontSize: 20)),
                                  TextSpan(text: product.price.toString()+ " টাকা \n", style: TextStyle(color: black,fontSize: 20)),
                                ]
                              ),
                              ),
                              SizedBox(
                                width: 50,
                              ),
                              IconButton(icon: Icon(Icons.delete), onPressed: null,),
                            ],
                          ),
        ],
        ),
      ),
    );
  }
}