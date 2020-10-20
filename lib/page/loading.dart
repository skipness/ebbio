import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Container(
        color: const Color.fromRGBO(31, 32, 35, 1),
        child: Center(
            child: Container(
          width: 80,
          height: 80,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Image.asset('assets/icon.png'),
              ClipRRect(
                borderRadius: BorderRadius.circular(5.0),
                child: LinearProgressIndicator(
                  backgroundColor: const Color.fromRGBO(161, 175, 187, 1),
                  valueColor: AlwaysStoppedAnimation(
                      const Color.fromRGBO(112, 127, 136, 1)),
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
