import 'package:ecommerce_application/src/state/app_state.dart';
import 'package:ecommerce_application/src/widgets/header_text.dart';
import 'package:ecommerce_application/src/widgets/icon_text.dart';
import 'package:ecommerce_application/src/widgets/link_box.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<ApplicationState>();

    if (appState.rezervationCount == 0) {
      return Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 15,
                ),
                HeaderText(text: 'Rezervations:'),
                SizedBox(
                  height: 150,
                ),
                Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      HeaderText(text: 'Empty history'),
                      SizedBox(
                        height: 15,
                      ),
                      Text('Rezerve a table to see your history here.'),
                      SizedBox(
                        height: 20,
                      ),
                      Image.asset('assets/images/not_found.png'),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      );
    } else {
      return Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 15,
                ),
                HeaderText(text: 'Rezervations:'),
                Expanded(
                  child: Container(
                    height: 2000,
                    child: ListView.builder(
                        physics: AlwaysScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: appState.rezervationCount,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: LinkBox(
                              height: 175,
                              route: '/history/details',
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 12),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      'assets/images/513.png',
                                      height: 65,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        HeaderText(text: '513'),
                                        Icon(Icons.favorite_outline),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    IconText(
                                      icon: Icons.check_circle_outline,
                                      text: 'Rezervation confirmed',
                                      iconColor: Colors.green,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        IconText(
                                          icon: Icons.person_outline,
                                          text: '1-2',
                                        ),
                                        SizedBox(
                                          width: 20,
                                        ),
                                        IconText(
                                          icon: Icons.calendar_today_outlined,
                                          text: 'DATE GOES HERE',
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
  }
}
