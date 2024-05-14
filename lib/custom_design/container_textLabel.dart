
import 'package:flutter/material.dart';

class ContainerText{
  static Text textLabel({required String text, required bool isLabel}){
    if(isLabel){
      return Text( text,
          style: const TextStyle(
              fontSize: 14,
              color: Colors.grey,
              fontFamily: "Metropolis"
          )
      );
    }
    return Text( text,
        style: const TextStyle(
            fontSize: 14,
            color: Colors.black,
            fontFamily: "Metropolis"
        )
    );
  }
}
