
import 'package:flutter/material.dart';
import 'package:shopping_cart_ui/custom_design/elevated_button.dart';

class HomePageBottom extends StatelessWidget {
  final Orientation orientation;
  final double screenHeight, screenWidth;
  final Function onPressed;
  final int totalPrice;

  const HomePageBottom({
    super.key,
    required this.orientation,
    required this.screenHeight,
    required this.screenWidth,
    required this.totalPrice,
    required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: (orientation == Orientation.portrait)
            ? screenHeight * 0.14
            : screenHeight * 0.22
        ,
        child:  Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // The total Amount part
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // 1st total Amount text part
                    const Text("Total amount:", style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                        fontFamily: "Metropolis"
                    )
                    ),

                    // 2nd total Amount part
                    Text( "${totalPrice.toString()}\$",
                        style: const TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Metropolis"
                        )
                    )
                  ]
              ),
              SizedBox(
                  height: (orientation == Orientation.portrait) ? 20 : 10
              ),
              elevatedButton(
                  orientation: orientation,
                  text: "CHECK OUT",
                  onPressed: onPressed
              )
            ]
        )
    );
  }
}
