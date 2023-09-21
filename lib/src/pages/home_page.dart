import 'package:auto_route/annotations.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:ecommerce_application/src/state/app_state.dart';
import 'package:ecommerce_application/src/widgets/header_text.dart';
import 'package:ecommerce_application/src/widgets/link_box.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  ConnectivityResult connectivityResult = ConnectivityResult.none;
  Connectivity connectivity = Connectivity();

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    connectivity.onConnectivityChanged.listen((ConnectivityResult result) {
      setState(() {
        connectivityResult = result;
      });
      //log(result.name);
    });
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

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
            TabBar(
              controller: _tabController,
              indicatorSize: TabBarIndicatorSize.label,
              isScrollable: true,
              tabAlignment: TabAlignment.start,
              labelPadding: const EdgeInsets.only(
                left: 0,
                right: 20,
              ),
              tabs: [
                Text('Restaurants'),
                Text('Favourites'),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            HeaderText(text: 'Open Now:'),
            SizedBox(
              height: 20,
            ),
            Expanded(
                child: TabBarView(
              controller: _tabController,
              children: [
                Container(
                  height: 2000,
                  child: StreamBuilder<ConnectivityResult>(
                      stream: connectivity.onConnectivityChanged,
                      builder: (context, snapshot) {
                        return snapshot.data == ConnectivityResult.none
                            ? Center(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    HeaderText(text: 'We lost you!'),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Text(
                                        'Check your internet connection.\nTry reloading the page.'),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Image.asset(
                                        'assets/images/internet_error.png'),
                                  ],
                                ),
                              )
                            : GridView.builder(
                                physics: AlwaysScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: 20,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2),
                                itemBuilder: (context, index) {
                                  return Center(
                                    child: Column(
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
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        HeaderText(
                                                          text: '513',
                                                        ),
                                                        HeaderText(
                                                          text:
                                                              'Italian restaurant',
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
                                                        BorderRadius.circular(
                                                            10)),
                                                child: TextButton(
                                                    onPressed: () {
                                                      appState.incrementCount();
                                                    },
                                                    child: HeaderText(
                                                      text:
                                                          "Make a rezervation",
                                                      size: 11,
                                                    )),
                                              )
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                      }),
                ),
                Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      HeaderText(text: 'No favorites'),
                      SizedBox(
                        height: 15,
                      ),
                      Text('Favorite a restaurant to see it here.'),
                      SizedBox(
                        height: 20,
                      ),
                      Image.asset('assets/images/not_found.png'),
                    ],
                  ),
                ),
              ],
            )),
          ],
        ),
      ),
    );
  }
}
