
import 'package:flutter/material.dart';
import 'package:shopping_cart_ui/custom_design/elevated_button.dart';

class MyAlertDialog extends StatelessWidget {

  final String title,content;
  final Orientation orientation;


  const MyAlertDialog({
    super.key,
    required this.title,
    required this.content,
    required this.orientation
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        backgroundColor: Colors.white,
        title: Center(
            child: Text( title, style: const TextStyle(fontWeight: FontWeight.bold, fontFamily: "Metropolis" ))
        ),
        content: Text( content, textAlign: TextAlign.center, style: const TextStyle(fontSize: 18, fontFamily: "Metropolis" )
        ),

        // action return multiple widget
        actions: [
          elevatedButton(
              onPressed: (){
                Navigator.pop(context);
              },
              text: "OKAY",
              orientation: orientation
          )
        ]
    );
  }
}
