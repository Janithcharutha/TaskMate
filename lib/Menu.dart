import 'package:flutter/material.dart';

class Menu extends StatelessWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('menu'),
        // leading: IconButton(
        //   icon: Icon(Icons.home_outlined),
        //   onPressed: () {
        //     Navigator.of(context).pushNamed('/home');
        //   },
        // ),
        actions: [
          IconButton(
            icon: Icon(Icons.help_outline),
            onPressed: () {},
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: IconButton(
                  icon: Icon(
                    Icons.currency_bitcoin,
                  ),
                  color: Colors.black54,
                  onPressed: () {}),
              height: 70.0,
              color: Colors.black12,
              width: double.infinity,
            ),
            Container(
              child: IconButton(
                  icon: Icon(Icons.currency_yen),
                  color: Colors.black54,
                  onPressed: () {}),
              height: 70.0,
              color: Colors.black12,
              width: double.infinity,
            ),
            Container(
              child: IconButton(
                  icon: Icon(Icons.currency_lira),
                  color: Colors.black54,
                  onPressed: () {}),
              height: 70.0,
              color: Colors.black12,
              width: double.infinity,
            ),
            Container(
              child: IconButton(
                  icon: Icon(Icons.currency_pound),
                  color: Colors.black54,
                  onPressed: () {}),
              height: 70.0,
              color: Colors.black12,
              width: double.infinity,
            ),
          ],
        ),
      ),
    );
  }
}
