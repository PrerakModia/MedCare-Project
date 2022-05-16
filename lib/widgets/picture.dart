import 'package:flutter/material.dart';

class Picture extends StatelessWidget {
  const Picture({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      const SizedBox(
          height: 175,
          child: CircleAvatar(
            radius: 70,
            backgroundImage: AssetImage('images/nami.jpg'),
          )),
      const SizedBox(
        height: 5,
      ),
      Container(
        padding: const EdgeInsets.only(left: 10),
        alignment: Alignment.bottomLeft,
        child: const Text(
          'Personal Details',
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
      )
    ]);
  }
}
