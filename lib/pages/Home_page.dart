
import 'package:flutter/material.dart';
import 'package:shopping_cart_ui/custom_design/alert_dialog.dart';
import 'package:shopping_cart_ui/custom_design/container_design.dart';
import 'package:shopping_cart_ui/custom_design/home_page_bottom.dart';
import 'package:shopping_cart_ui/models/Data_item.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}




class _HomePageState extends State<HomePage> {

  late int totalPrice;

  @override
  void initState() {
    totalPrice = calculateTotalPrice();
    super.initState();
  }

  //  calculateTotalPrice function
  int calculateTotalPrice() {
    totalPrice = 0;
    for (DataItem data in items) {
      totalPrice += data.dressPrice;
    }
    return totalPrice;
  }

  // Snack Bar function
  mySnackBar(message,context){
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message,style: const TextStyle(color: Colors.white,fontSize: 14,fontFamily: "Metropolis")),
          backgroundColor: Colors.teal,
          elevation: 5,
          padding: const EdgeInsets.symmetric( horizontal: 10, vertical: 15 ),
          duration:const Duration(seconds: 3),
          dismissDirection: DismissDirection.horizontal,
        )
    );
  }

  // AlertDialog function
  void alertDialogFunction(int index, Orientation orientation) {
    showDialog(
        context: context,
        builder: (context) {
          return MyAlertDialog(
              title: "Congratulations!",
              content: "You have added 5 ${items[index].dressName.toString()} in your bag!",
              orientation: orientation
          );
        }
    );
  }

  // increaseQuantity function
  void increaseQuantity(int index, Orientation orientation){
    if(items[index].quantity < 5){
      items[index].quantity = items[index].quantity + 1;
      totalPrice += items[index].dressPrice;
    }
    if(items[index].quantity ==5){
      alertDialogFunction(index,orientation);
    }
    setState(() {});
  }

  // decreaseQuantity function
  void decreaseQuantity(int index, Orientation orientation) {
    if (items[index].quantity > 1) {
      items[index].quantity = items[index].quantity - 1;
      totalPrice -= items[index].dressPrice;
    }
    setState(() {});
  }





  @override
  Widget build(BuildContext context) {

    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return  Scaffold(
        appBar: AppBar(
            actions: [
              IconButton(onPressed: (){}, icon: const Icon(Icons.search))
            ]
        ),

        body: OrientationBuilder(
          builder: (BuildContext context ,Orientation orientation){
            return (orientation == Orientation.portrait)
            // The Portrait Method
                ? Container(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // 1st app title part
                      const Text("My Bag",style: TextStyle(color: Colors.black,fontSize: 30,fontFamily: "Metropolis",fontWeight: FontWeight.w900)),
                      SizedBox(
                          height: (orientation == Orientation.portrait)? 20:10
                      ),

                      // 2nd item container part
                      Expanded(
                          child: ListView.builder(
                              itemCount: items.length,
                              itemBuilder: (context, index){
                                return ContainerDesign(
                                    screenHeight: screenHeight,
                                    screenWidth: screenWidth,
                                    index: index,
                                    orientation: orientation,
                                    increaseQuantity:()=>increaseQuantity(index,orientation),
                                    decreaseQuantity: ()=>decreaseQuantity(index,orientation)
                                );
                              }
                          )
                      ),
                      HomePageBottom(
                        orientation: orientation,
                        onPressed: (){
                          mySnackBar("Congratulations! Your purchase was a success!",context);
                        },
                        screenWidth: screenWidth,
                        screenHeight: screenHeight,
                        totalPrice: totalPrice,
                      )
                    ]
                )
            )





            // The LandScape Mood
                : Container(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // 1st app title part
                      const Text("My Bag",style: TextStyle(color: Colors.black,fontSize: 30,fontFamily: "Metropolis",fontWeight: FontWeight.w900)),
                      SizedBox(
                          height: (orientation == Orientation.portrait)? 20:10
                      ),

                      // 2nd item container part
                      Expanded(
                          child: ListView.builder(
                              itemCount: items.length,
                              itemBuilder: (context, index){
                                return ContainerDesign(
                                    screenHeight: screenHeight,
                                    screenWidth: screenWidth,
                                    index: index,
                                    orientation: orientation,
                                    increaseQuantity:()=>increaseQuantity(index,orientation),
                                    decreaseQuantity: ()=>decreaseQuantity(index,orientation)
                                );
                              }
                          )
                      ),
                      HomePageBottom(
                        orientation: orientation,
                        onPressed: (){
                          mySnackBar("Congratulations! Your purchase was a success!",context);
                        },
                        screenWidth: screenWidth,
                        screenHeight: screenHeight,
                        totalPrice: totalPrice,
                      )
                    ]
                )
            );
          },
        )
    );
  }
}
