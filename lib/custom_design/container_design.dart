
import 'package:flutter/material.dart';
import 'package:shopping_cart_ui/custom_design/container_button.dart';
import 'package:shopping_cart_ui/custom_design/container_textLabel.dart';
import 'package:shopping_cart_ui/models/Data_item.dart';

class ContainerDesign extends StatelessWidget {
  final double screenHeight, screenWidth;
  final Orientation orientation;
  final int index;
  final Function increaseQuantity;
  final Function decreaseQuantity;

  const ContainerDesign({
    super.key,
    required this.screenHeight,
    required this.screenWidth,
    required this.index,
    required this.orientation,
    required this.increaseQuantity,
    required this.decreaseQuantity
  });


  @override
  Widget build(BuildContext context) {
    return Container(
        margin:const EdgeInsets.only(bottom: 20),
        width: screenWidth,
        height: (orientation == Orientation.portrait) ? screenHeight * 0.16 : screenHeight * 0.4,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
                color: Colors.black12.withOpacity(0.05),
                spreadRadius: 2,
                blurRadius: 14,
                blurStyle: BlurStyle.normal,
                offset: const Offset(0, 2)
            )
          ],
        ),
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1st Row Image part
              Container(
                height:MediaQuery.sizeOf(context).height,
                width: MediaQuery.sizeOf(context).width*0.34,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(8.0),
                      bottomLeft: Radius.circular(8.0)
                  ),
                  color: const Color(0xFFE3E3E3),
                  image: DecorationImage(
                      image: AssetImage(items[index].dressImage),
                      fit: BoxFit.fill
                  ),
                ),
              ),

              // 2nd Row others part
              Expanded(
                  child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // 1st The dressName / More icon part
                            Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                      items[index].dressName,
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: "Metropolis"
                                      )
                                  ),
                                  const Icon( Icons.more_vert, color: Colors.grey )
                                ]
                            ),

                            // 2nd The dressColor / dressSize part
                            Expanded(
                                child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      // The dress Color part
                                      ContainerText.textLabel(text:" Color:", isLabel: true),
                                      const SizedBox(width: 5),
                                      ContainerText.textLabel(text: items[index].dressColor, isLabel: false),

                                      //// The dress Size part
                                      const SizedBox(width: 15),
                                      ContainerText.textLabel(text:" Size:", isLabel: true),
                                      const SizedBox(width: 5),
                                      ContainerText.textLabel(text: items[index].dressSize, isLabel: false),

                                    ]
                                )
                            ),

                            // 3rd The increase button/decrease button/ price part
                            Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                      children: [
                                        ContainerButton( icon: Icons.remove, onPressed: decreaseQuantity ),
                                        const SizedBox(width: 12),
                                        Text(items[index].quantity.toString(),style: const TextStyle(fontSize: 16,fontWeight: FontWeight.bold,fontFamily: "Metropolis")),
                                        const SizedBox(width: 12),
                                        ContainerButton( icon: Icons.add, onPressed: increaseQuantity ),
                                      ]
                                  ),
                                  Padding(
                                      padding: const EdgeInsets.only(right: 9.0),
                                      child: Text(
                                          "${items[index].dressPrice * items[index].quantity}\$",
                                          style: const TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w600,
                                              fontFamily: "Metropolis"
                                          )
                                      )
                                  )
                                ]
                            )
                          ]
                      )
                  )
              )
            ]
        )
    );
  }
}
