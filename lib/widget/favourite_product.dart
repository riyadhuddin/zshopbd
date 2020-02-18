import 'package:flutter/material.dart';
import 'package:zshopbd/controllers/display_navigation.dart';
import 'package:zshopbd/models/products.dart';
import 'package:zshopbd/controllers/style.dart';
import 'package:zshopbd/view/details.dart';
import 'package:zshopbd/widget/typo.dart';

List<Product> productsList = [
  Product(
      name: "বিরিয়ানী",
      price: 0.99,
      image: "biriyani.jpg",
      rating: 4.7,
      vendor: "আম্মু",
      wishList: true),
  Product(
      name: "সামুচা",
      price: 0.50,
      image: "samosa.jpg",
      rating: 4.0,
      vendor: "টিয়া",
      wishList: false),
  Product(name: "রুটি",price: 0.78,image: "roti.jpg",rating: 4.7,vendor: "আম্মু", wishList: true),
  Product(name: "কেক",price: 0.50,image: "coconutcake.jpg",rating: 4.0,vendor: "আম্মু", wishList: false),
  Product(name: "জিলাপি",price: 0.99,image: "jilapi.jpg",rating: 4.7,vendor: "টিয়া", wishList: true),
  Product(name: "পুরি",price: 0.50,image: "hawapuri.jpg",rating: 3.0,vendor: "টিয়া", wishList: false),
   Product(name: "মিষ্টি",price: 0.50,image: "s.png",rating: 4.5,vendor: "টিয়া", wishList: false),
];

class Favourite extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: productsList.length,
          itemBuilder: (_, index) {
            return Padding(
              padding: EdgeInsets.all(8),
              child: GestureDetector(
                onTap: (){
                  changeScreen(_, Details(product: productsList[index],));// _ is context
                },
                  child: Container(
                  height: 240,
                  width: 200,
                  decoration: BoxDecoration(color: white, boxShadow: [
                    BoxShadow(
                        color: red[50], offset: Offset(4, 6), blurRadius: 20)
                  ]),
                  child: Column(
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Image.asset(
                            "assets/products_photo/${productsList[index].image}",
                            height: 150,
                            width: 150,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CustomText(
                                  text: productsList[index].name,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(4),
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: white,
                                      boxShadow: [
                                        BoxShadow(
                                            color: red[50],
                                            offset: Offset(15, 5),
                                            blurRadius: 30)
                                      ]),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: productsList[index].wishList
                                        ? Icon(
                                            Icons.favorite,
                                            color: red,
                                            size: 18,
                                          )
                                        : Icon(
                                            Icons.favorite_border,
                                            color: red,
                                            size: 18,
                                          ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: CustomText(
                                      text: productsList[index].rating.toString(),
                                      color: grey,
                                      size: 14,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 2,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: red,
                                    size: 16,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: red,
                                    size: 16,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: red,
                                    size: 16,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: red,
                                    size: 16,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: grey,
                                    size: 16,
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: CustomText(
                                  text:
                                      "টাকা ${productsList[index].price.toString()}",
                                  weight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
