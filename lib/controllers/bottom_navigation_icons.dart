import 'package:flutter/cupertino.dart';
import 'package:zshopbd/widget/typo.dart';

class BottomNavIcon extends StatelessWidget {
  final String name;
  final String image;
  final Function onTap;

  const BottomNavIcon({Key key, this.name, this.image, this.onTap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: onTap ?? null,
              child: Column(
          children: <Widget>[
            Image.asset("assets/images/$image", width:20, height:20,),
            SizedBox(height: 2,),
            CustomText(text: name,),
          ],
        ),
      ),
    );
  }
}