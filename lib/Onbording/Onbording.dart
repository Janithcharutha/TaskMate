import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../HomePage.dart';

// import 'HomePage.dart';

class Onbording extends StatefulWidget {
  const Onbording({Key? key}) : super(key: key);

  @override
  State<Onbording> createState() => _OnbordingState();
}

class _OnbordingState extends State<Onbording> {
  final controller = PageController();
  bool isLastPage = false;
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.only(
            bottom: 10.0,
          ),
          child: PageView(
            controller: controller,
            onPageChanged: (index) {
              setState(() {
                isLastPage = index == 2;
              });
            },
            children: [
              Container(
                // color: Colors.cyan[800],
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'images/onloading1.jpg',
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    Text(
                      'Welcome to TaskMate',
                      style:
                          TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 25.0,
                    ),
                    // Container(
                    //   padding: EdgeInsets.symmetric(),
                    //   child: Text(
                    //     'first sub',
                    //   ),
                    // )
                  ],
                ),
              ),
              SingleChildScrollView(
                // color: Colors.cyan[500],
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'images/onloading2.jpg',
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      'Manage Your Workday',
                      style:
                          TextStyle(fontSize: 28,
                            fontWeight: FontWeight.bold,),
                    ),
                    SizedBox(
                      height: 25.0,
                    ),
                    Container(
                        padding: EdgeInsets.symmetric(),
                        child: Column(
                          children: [
                            Center(
                              child: Text(
                                'The TaskMate application will be',
                                style: TextStyle(
                                    fontSize: 21,
                                    fontWeight: FontWeight.normal),
                              ),
                            ),
                            Center(
                              child: Text(
                                'your best friend and reminding',
                                style: TextStyle(
                                    fontSize: 21,
                                    fontWeight: FontWeight.normal),
                              ),
                            ),
                            Center(
                              child: Text(
                                'you of your daily tasks and ',
                                style: TextStyle(
                                    fontSize: 21,
                                    fontWeight: FontWeight.normal),
                              ),
                            ),
                            Center(
                              child: Text(
                                'ensuring that you never neglect',
                                style: TextStyle(
                                    fontSize: 21,
                                    fontWeight: FontWeight.normal),
                              ),
                            ),
                            Center(
                              child: Text(
                                'any important things in your life.',
                                style: TextStyle(
                                    fontSize: 21,
                                    fontWeight: FontWeight.normal),
                              ),
                            ),
                            SizedBox(height: 70,)
                          ],
                        ))
                  ],
                ),
              ),
              Container(
                // color: Colors.cyan[100],
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'images/onloading3.jpg',
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                    SizedBox(
                      height: 60.0,
                    ),
                    SizedBox(
                      height: 25.0,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomSheet: isLastPage
            ? TextButton(
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  primary: Colors.white,
                  backgroundColor: Colors.cyan[300],
                  minimumSize: Size.fromHeight(70.0),
                ),
                child: Text(
                  'Get Started',
                  style: TextStyle(fontSize: 23.0),
                ),
                onPressed: () async {
                  // Navigator.of(context).pushNamed('/Homepage');
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                  final prefs = await SharedPreferences.getInstance();
                  prefs.setBool('showHome', true);
                },
              )
            : Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                height: 60.0,
                color: Colors.cyan[100],
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {
                        controller.jumpToPage(2);
                      },
                      child: Text(
                        'SKIP',
                        style: TextStyle(color: Colors.black, fontSize: 23),
                      ),
                    ),
                    Center(
                      child: SmoothPageIndicator(
                        controller: controller,
                        count: 3,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        controller.nextPage(
                          duration: Duration(microseconds: 500),
                          curve: Curves.easeInOut,
                        );
                      },
                      child: Text(
                        'NEXT',
                        style: TextStyle(color: Colors.black, fontSize: 23),
                      ),
                    )
                  ],
                ),
              ),
      ),
    );
  }
}
