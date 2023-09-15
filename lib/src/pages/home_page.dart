import 'package:ecommerce_application/src/state/app_state.dart';
import 'package:ecommerce_application/src/widgets/header_text.dart';
import 'package:ecommerce_application/src/widgets/link_box.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<ApplicationState>();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SafeArea(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Center(
                    child: Text(
                      'NP',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 25,
                      ),
                    ),
                  ),
                )
              ],
            )),
            SizedBox(
              height: 20,
            ),
            HeaderText(text: 'Hello, [NAME]'),
            SizedBox(
              height: 20,
            ),
            HeaderText(text: 'Open Now:'),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: Container(
                height: 2000,
                child: ListView.builder(
                    physics: AlwaysScrollableScrollPhysics(),
                    shrinkWrap: false,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Center(
                        child: Column(
                          children: [
                            Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  LinkBox(
                                    width: 150,
                                    height: 160,
                                    route: '/details',
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Image.asset(
                                          'assets/images/513.png',
                                          height: 65,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  HeaderText(
                                                    text: '513',
                                                  ),
                                                  HeaderText(
                                                    text: 'Italian restaurant',
                                                    size: 8,
                                                  ),
                                                ],
                                              ),
                                              Icon(Icons.favorite_border),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          height: 30,
                                          decoration: BoxDecoration(
                                              color: Colors.greenAccent,
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: TextButton(
                                              onPressed: () {
                                                appState.incrementCount();
                                              },
                                              child: HeaderText(
                                                text: "Make a rezervation",
                                                size: 11,
                                              )),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 30,
                                  ),
                                  LinkBox(
                                    width: 150,
                                    height: 160,
                                    route: '/details',
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Image.asset(
                                          'assets/images/Andys.png',
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  HeaderText(
                                                    text: "Andy's",
                                                  ),
                                                  HeaderText(
                                                    text: 'Italian restaurant',
                                                    size: 8,
                                                  ),
                                                ],
                                              ),
                                              Icon(Icons.favorite_border),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          height: 30,
                                          decoration: BoxDecoration(
                                              color: Colors.greenAccent,
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: TextButton(
                                              onPressed: () {},
                                              child: HeaderText(
                                                text: "Make a rezervation",
                                                size: 11,
                                              )),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                          ],
                        ),
                      );
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
