import 'package:ecommerce_application/src/state/app_state.dart';
import 'package:ecommerce_application/src/widgets/header_text.dart';
import 'package:ecommerce_application/src/widgets/icon_text.dart';
import 'package:ecommerce_application/src/widgets/star_display.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<ApplicationState>();
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Image.asset('assets/images/photo1.png'),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Container(
                height: 500,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        HeaderText(text: '513'),
                        StarDisplay(
                          value: 4,
                        ),
                      ],
                    ),
                    Text('Italian restaurant'),
                    SizedBox(
                      height: 10,
                    ),
                    IconText(
                      icon: Icons.location_pin,
                      text: 'LOCATION GOES HERE',
                      iconColor: Colors.green,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    IconText(
                      icon: Icons.access_time_outlined,
                      text: 'Open today untill 11:00 PM',
                      iconColor: Colors.green,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    IconText(
                      icon: Icons.phone_outlined,
                      text: 'PHONE NUMBER GOES HERE',
                      iconColor: Colors.green,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Center(
                      child: Container(
                        height: 35,
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(10)),
                        child: TextButton(
                            onPressed: () {},
                            child: HeaderText(
                              text: "Show menu",
                              size: 15,
                            )),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: Container(
                        height: 35,
                        decoration: BoxDecoration(
                            color: Colors.greenAccent,
                            borderRadius: BorderRadius.circular(10)),
                        child: TextButton(
                            onPressed: () {
                              appState.incrementCount();
                            },
                            child: HeaderText(
                              text: "Make a rezervation",
                              size: 15,
                            )),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
