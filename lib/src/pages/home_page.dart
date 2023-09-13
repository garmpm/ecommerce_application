import 'package:ecommerce_application/src/widgets/header_text.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              height: 300,
              color: Colors.red,
              child: Container(
                  height: 300,
                  width: 300,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/testimage.jpg'),
                    ),
                    borderRadius: BorderRadius.circular(50),
                  )),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          HeaderText(text: 'Featured Products'),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: Container(
              height: 900,
              child: ListView.builder(
                  physics: AlwaysScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(
                        left: 5,
                        right: 5,
                        bottom: 10,
                        top: 5,
                      ),
                      color: Colors.green,
                      height: 100,
                      child: Row(
                        children: [
                          Container(
                            width: 100,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/testimage.jpg')),
                                borderRadius: BorderRadius.circular(20)),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  HeaderText(
                                    text: 'PRODUCT NAME',
                                    size: 20,
                                  ),
                                  Text('Category Name'),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      HeaderText(
                                        text: 'PRICE',
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
            ),
          )
        ],
      ),
    );
  }
}
