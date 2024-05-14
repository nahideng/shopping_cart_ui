
import 'package:flutter/material.dart';

class elevatedButton extends StatelessWidget {

  final Orientation orientation;
  final String text;
  final Function onPressed;

  const elevatedButton({
    super.key,
    required this.text,
    required this.orientation,
    required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width,
        height: (orientation==Orientation.portrait)
            ? MediaQuery.of(context).size.height * 0.06
            : MediaQuery.of(context).size.height * 0.12
        ,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFDB3022),
                elevation: 5,
                shadowColor: Colors.red,
                foregroundColor: Colors.white,
                textStyle: const TextStyle( fontSize: 16, fontWeight: FontWeight.w400, fontFamily: "Metropolis" )
            ),
            onPressed :(){
              onPressed();
            },
            child:  Text(text)
        )
    );
  }
}
