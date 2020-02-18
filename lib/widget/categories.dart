import 'package:flutter/material.dart';
import 'package:zshopbd/models/category.dart';
import 'package:zshopbd/controllers/style.dart';
import 'package:zshopbd/widget/typo.dart';

List<Category> categoriesList = [
  Category(name: "বার্গার", image: "beef_burger.jpg"),
  Category(name: "বিরিয়ানী", image: "biriyani.jpg"),
  Category(name: "চিকেন কাবাব", image: "chicken_leg.jpg"),
  Category(name: "পিজ্জা", image: "pizza.jpg"),
  Category(name: "সামুচা", image: "samosa.jpg"),
  Category(name: "স্যান্ডুইচ", image: "sandwich.jpg")
];

class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 95,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categoriesList.length,
        itemBuilder: (_, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                Container(
                    decoration: BoxDecoration(
                      color: white,
                      boxShadow: [
                        BoxShadow(
                            color: red[50],
                            offset: Offset(4, 6),
                            blurRadius: 20)
                      ],
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(4),
                      child: Image.asset(
                        "assets/${categoriesList[index].image}",
                        width: 50,
                      ),
                    )),
                SizedBox(
                  height: 10,
                ),
                CustomText(
                  text: categoriesList[index].name,
                  size: 16,
                  color: black,
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
