import 'package:auto_route/annotations.dart';
import 'package:ecommerce_application/src/state/app_state.dart';
import 'package:ecommerce_application/src/widgets/header_text.dart';
import 'package:ecommerce_application/src/widgets/icon_text.dart';
import 'package:ecommerce_application/src/widgets/link_box.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

@RoutePage()
class RezervationDetailPage extends StatelessWidget {
  const RezervationDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<ApplicationState>();
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            HeaderText(text: '513'),
            IconText(
              icon: Icons.check_circle_outline,
              text: 'Rezervation confirmed',
              iconColor: Colors.green,
              textSize: 10,
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              children: [
                IconText(
                  icon: Icons.person_outline,
                  text: '1-2',
                ),
                SizedBox(
                  width: 5,
                ),
                IconText(
                  icon: Icons.calendar_today_outlined,
                  text: 'DATE GOES HERE',
                ),
              ],
            ),
            Row(
              children: [
                Text('Hall 2'),
                SizedBox(
                  width: 10,
                ),
                Text('Table 10'),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 35,
              decoration: BoxDecoration(
                  color: Colors.grey, borderRadius: BorderRadius.circular(10)),
              child: TextButton(
                onPressed: () {},
                child: HeaderText(
                  text: "Modify rezervation",
                  size: 15,
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Center(
              child: Row(
                children: [
                  LinkBox(
                    height: 130,
                    width: 150,
                    route: '/placeholder',
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Center(
                        child: Column(
                          children: [
                            Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                color: Colors.cyan,
                                borderRadius: BorderRadius.circular(60),
                              ),
                              child: Icon(
                                Icons.book,
                                size: 40,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text('Make a pre-order'),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  LinkBox(
                    height: 130,
                    width: 150,
                    route: '/placeholder',
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Center(
                        child: Column(
                          children: [
                            Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                color: Colors.cyan,
                                borderRadius: BorderRadius.circular(60),
                              ),
                              child: Icon(
                                Icons.explore,
                                size: 40,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text('Trace a route'),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            HeaderText(text: 'Phone number:'),
            Text('PHONE NUMBER GOES HERE'),
            SizedBox(
              height: 10,
            ),
            HeaderText(text: 'Pre-order details:'),
            Text('No information available'),
            SizedBox(
              height: 10,
            ),
            HeaderText(text: 'Important information:'),
            Text(
              'We will give you up to 15 minutes to claim your rezervation. We suggest you call us in the event you will be late.\nWe can contact you in regards to this rezervation, thus, make sure you have your e-mail and phone number up to date.\nThe table will be rezerved for 1 hour and 30 minutes.',
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: TextButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('Cancel rezervation'),
                          content: Text(
                              'Are you sure you want to cancel the current rezervation?'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                context.pop();
                              },
                              child: Text('NO'),
                            ),
                            TextButton(
                              onPressed: () {
                                context.pop();
                                context.pop();
                                appState.decrementCount();
                              },
                              child: Text('YES'),
                            ),
                          ],
                        );
                      });
                },
                child: HeaderText(
                  text: "Cancel rezervation",
                  size: 15,
                  color: Colors.red,
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
