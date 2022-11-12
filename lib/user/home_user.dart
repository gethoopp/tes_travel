import 'package:animations/animations.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_app/search.dart';
import 'detailPage_user.dart';



class HomeUser extends StatefulWidget {
  const HomeUser({super.key});

  @override
  State<HomeUser> createState() => _HomeuserState();
}

class _HomeuserState extends State<HomeUser>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white70,
            body: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 50, horizontal: 20),
                      child: RichText(
                          text: TextSpan(
                              text: "Hello,user",
                              style: GoogleFonts.poppins(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black))),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 100),
                      child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.notification_important_rounded,
                            color: Colors.black,
                            size: 30,
                          )),
                    ),
                    Builder(builder: (context) {
                      return IconButton(
                          onPressed: () {
                            showSearch(
                                context: context, delegate: customSearch());
                          },
                          icon: const Icon(
                            Icons.search,
                            color: Colors.black,
                            size: 30,
                          ));
                    }),
                  ],
                ),
                TabBar(
                  tabs: const [
                    Tab(
                      text: "Popular",
                    ),
                    Tab(
                      text: "Recommended",
                    ),
                    Tab(
                      text: "New",
                    ),
                  ],
                  indicatorColor: Colors.black,
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey,
                  controller: _tabController,
                ),
                Expanded(
                    child: TabBarView(
                  controller: _tabController,
                  children: [
                    Column(
                      children: [
                        Expanded(
                            child: ListView(
                          scrollDirection: Axis.vertical,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: Column(
                                children: [
                                  OpenContainer(
                                    closedElevation: 0,
                                    transitionType: ContainerTransitionType.fadeThrough,
                                    closedColor: Colors.transparent,
                                    openBuilder: (context, action) {
                                      return pageHotel1();
                                    },
                                    closedBuilder: (context, action) => Card(
                                      elevation: 0,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(25),
                                      ),
                                      child: Container(
                                        height: 300,
                                        decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(25)),
                                          image: DecorationImage(
                                              alignment: Alignment(-2, -1),
                                              image: AssetImage(
                                                  "assets/images/hotelio1.png"),
                                              fit: BoxFit.fitWidth),
                                        ),
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(top: 210),
                                          child: ListTile(
                                            title: Text("Surabaya HOTEL",
                                                style: GoogleFonts.poppins(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.black)),
                                            subtitle: Text.rich(TextSpan(
                                                text: "Start From ",
                                                style: GoogleFonts.poppins(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w100,
                                                    color: Colors.black),
                                                children: <TextSpan>[
                                                  TextSpan(
                                                      text: "Rp. 500.000/night",
                                                      style:
                                                          GoogleFonts.poppins(
                                                              fontSize: 10,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              color: const Color
                                                                      .fromARGB(
                                                                  255,
                                                                  7,
                                                                  50,
                                                                  170)))
                                                ])),
                                            trailing: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                IconButton(
                                                    onPressed: () {},
                                                    icon: const Icon(
                                                      Icons.favorite_border,
                                                      color: Colors.black,
                                                      size: 30,
                                                    )),
                                                IconButton(
                                                    onPressed: () {},
                                                    icon: const Icon(
                                                      Icons.bookmark_border,
                                                      color: Colors.black,
                                                      size: 30,
                                                    )),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: Column(
                                children: [
                                  Card(
                                    elevation: 20,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    child: Container(
                                      height: 300,
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(25)),
                                        image: DecorationImage(
                                            alignment: Alignment(-2, -1),
                                            image: AssetImage(
                                                "assets/images/hotelio2.png"),
                                            fit: BoxFit.fitWidth),
                                      ),
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(top: 210),
                                        child: ListTile(
                                          title: Text("IBIS HOTEL",
                                              style: GoogleFonts.poppins(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.black)),
                                          subtitle: Text.rich(TextSpan(
                                              text: "Start From ",
                                              style: GoogleFonts.poppins(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w100,
                                                  color: Colors.black),
                                              children: <TextSpan>[
                                                TextSpan(
                                                    text: "Rp. 800.000/night",
                                                    style: GoogleFonts.poppins(
                                                        fontSize: 10,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: Color.fromARGB(
                                                            255, 7, 50, 170)))
                                              ])),
                                          trailing: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              IconButton(
                                                  onPressed: () {},
                                                  icon: const Icon(
                                                    Icons.favorite_border,
                                                    color: Colors.black,
                                                    size: 30,
                                                  )),
                                              IconButton(
                                                  onPressed: () {},
                                                  icon: const Icon(
                                                    Icons.bookmark_border,
                                                    color: Colors.black,
                                                    size: 30,
                                                  )),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: Column(
                                children: [
                                  Card(
                                    elevation: 20,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    child: Container(
                                      height: 300,
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(25)),
                                        image: DecorationImage(
                                            alignment: Alignment(-2, -1),
                                            image: AssetImage(
                                                "assets/images/hotelio3.png"),
                                            fit: BoxFit.fitWidth),
                                      ),
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(top: 210),
                                        child: ListTile(
                                          title: Text("ASTON HOTEL",
                                              style: GoogleFonts.poppins(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.black)),
                                          subtitle: Text.rich(TextSpan(
                                              text: "Start From ",
                                              style: GoogleFonts.poppins(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w100,
                                                  color: Colors.black),
                                              children: <TextSpan>[
                                                TextSpan(
                                                    text: "Rp. 1.500.000/night",
                                                    style: GoogleFonts.poppins(
                                                        fontSize: 10,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: Color.fromARGB(
                                                            255, 7, 50, 170)))
                                              ])),
                                          trailing: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              IconButton(
                                                  onPressed: () {},
                                                  icon: const Icon(
                                                    Icons.favorite_border,
                                                    color: Colors.black,
                                                    size: 30,
                                                  )),
                                              IconButton(
                                                  onPressed: () {},
                                                  icon: const Icon(
                                                    Icons.bookmark_border,
                                                    color: Colors.black,
                                                    size: 30,
                                                  )),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: Column(
                                children: [
                                  Card(
                                    elevation: 20,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    child: Container(
                                      height: 300,
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(25)),
                                        image: DecorationImage(
                                            alignment: Alignment(-2, -1),
                                            image: AssetImage(
                                                "assets/images/hotelio4.png"),
                                            fit: BoxFit.fitWidth),
                                      ),
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(top: 210),
                                        child: ListTile(
                                          title: Text("INA GARUDA HOTEL",
                                              style: GoogleFonts.poppins(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.black)),
                                          subtitle: Text.rich(TextSpan(
                                              text: "Start From ",
                                              style: GoogleFonts.poppins(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w100,
                                                  color: Colors.black),
                                              children: <TextSpan>[
                                                TextSpan(
                                                    text: "Rp. 2.500.000/night",
                                                    style: GoogleFonts.poppins(
                                                        fontSize: 10,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: Color.fromARGB(
                                                            255, 7, 50, 170)))
                                              ])),
                                          trailing: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              IconButton(
                                                  onPressed: () {},
                                                  icon: const Icon(
                                                    Icons.favorite_border,
                                                    color: Colors.black,
                                                    size: 30,
                                                  )),
                                              IconButton(
                                                  onPressed: () {},
                                                  icon: const Icon(
                                                    Icons.bookmark_border,
                                                    color: Colors.black,
                                                    size: 30,
                                                  )),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        )),
                      ],
                    ),
                    const Text("Recommended"),
                    const Text("New"),
                  ],
                )),
                 
              ],
            ),

            bottomNavigationBar: ConvexAppBar(
              backgroundColor: Colors.white,
              color: Colors.black,
              style: TabStyle.react,
              activeColor: Color.fromARGB(255, 7, 50, 170),
              items: const [
                TabItem(icon: Icons.home, title: 'Home'),
                TabItem(icon: Icons.search, title: 'Settings'),
                TabItem(icon: Icons.favorite, title: 'Bookings'),
                TabItem(icon: Icons.person, title: 'Profile'),
              ],
              initialActiveIndex: 0, //optional, default as 0
              
            ),
            ),
          ),
        );
  }
}
