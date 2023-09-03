import 'package:flutter/material.dart';

class menuoage extends StatefulWidget {
  const menuoage({Key? key}) : super(key: key);

  @override
  State<menuoage> createState() => _menuoageState();
}

class _menuoageState extends State<menuoage> {
  @override
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(),
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("images/14.png"), fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          // title: Center(
          //   child: Text(
          //     'TaskMate',
          //     style: TextStyle(fontSize: 35, color: Colors.white),
          //   ),
          // ),
          toolbarHeight: 50,
          backgroundColor: Colors.transparent,
          leading: IconButton(
            icon: Icon(Icons.menu),
            color: Colors.white70,
            onPressed: () {
              Navigator.of(context).pushNamed('/home');
            },
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.help_outline),
              color: Colors.white70,
              onPressed: () {},
            )
          ],
        ),
        body:
            SingleChildScrollView(
              child:
            Column(
          children: [SizedBox(height: 15,),
            Center(
              child: Text(
                'TaskMate',
                style: TextStyle(fontSize: 38, color: Colors.white),
              ),
            ),
            // SizedBox(height: 3),
            Container(
              child: Center(
                child: Text(
                  'Premium Plus',
                  style: TextStyle(fontSize: 33, color: Colors.white60),
                ),
              ),
            ),
            SizedBox(
              height: 27,
            ),
            Container(
              child: Center(
                child: Text(
                  'Activition of this premium account',
                  style: TextStyle(fontSize: 20, color: Colors.white70),
                ),
              ),
            ),
            Container(
              child: Center(
                child: Text(
                  'will grant access to all locked',
                  style: TextStyle(fontSize: 20, color: Colors.white70),
                ),
              ),
            ),
            Container(
              child: Center(
                child: Text(
                  'content on our app',
                  style: TextStyle(fontSize: 20, color: Colors.white70),
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              child: Center(
                child: Text(
                  'Choose a Plan',
                  style: TextStyle(fontSize: 29, color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              // height: 200,
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 20, right: 20),
                    width: double.infinity,
                    // padding: EdgeInsets.all(32),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blueAccent, width: 3),
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(32),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: EdgeInsets.only(top: 10, left: 20),
                              child: Text(
                                '1 Month',
                                style: TextStyle(
                                    fontSize: 22, color: Colors.white),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 10, right: 20),
                              child: Center(
                                child: Text(
                                  "\$10.00",
                                  style: TextStyle(
                                      fontSize: 22, color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: EdgeInsets.only(bottom: 10, left: 20),
                              child: Text(
                                'Total price \$10.00',
                                style: TextStyle(
                                    fontSize: 17, color: Colors.white),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(bottom: 10, right: 20),
                              child: Center(
                                child: Text(
                                  "Monthly",
                                  style: TextStyle(
                                      fontSize: 17, color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 8),
                  Container(
                    margin: EdgeInsets.only(left: 20, right: 20),
                    width: double.infinity,
                    // padding: EdgeInsets.all(32),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blueAccent, width: 3),
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(32),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: EdgeInsets.only(top: 10, left: 20),
                              child: Text(
                                '6 Month',
                                style: TextStyle(
                                    fontSize: 22, color: Colors.white),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 10, right: 20),
                              child: Center(
                                child: Text(
                                  "\$9.00",
                                  style: TextStyle(
                                      fontSize: 22, color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: EdgeInsets.only(bottom: 10, left: 20),
                              child: Text(
                                'Total price \$54.00',
                                style: TextStyle(
                                    fontSize: 17, color: Colors.white),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(bottom: 10, right: 20),
                              child: Center(
                                child: Text(
                                  "Monthly",
                                  style: TextStyle(
                                      fontSize: 17, color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 8),
                  Container(
                    margin: EdgeInsets.only(left: 20, right: 20),
                    width: double.infinity,
                    // padding: EdgeInsets.all(32),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blueAccent, width: 3),
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(32),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: EdgeInsets.only(top: 10, left: 20),
                              child: Text(
                                '12 Month',
                                style: TextStyle(
                                    fontSize: 22, color: Colors.white),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 10, right: 20),
                              child: Center(
                                child: Text(
                                  "\$8.00",
                                  style: TextStyle(
                                      fontSize: 22, color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: EdgeInsets.only(bottom: 10, left: 20),
                              child: Text(
                                'Total price \$96.00',
                                style: TextStyle(
                                    fontSize: 17, color: Colors.white),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(bottom: 10, right: 20),
                              child: Center(
                                child: Text(
                                  "Monthly",
                                  style: TextStyle(
                                      fontSize: 17, color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(margin: EdgeInsets.only(bottom: 10),
              child: Center(
                child: Text(
                  'You can choose a plan at any time through TaskMate',
                  style: TextStyle(fontSize: 15, color: Colors.white70),
                ),
              ),
            ),
          ],
        ),
      ),
      ),
      // ),
    );
  }
}
