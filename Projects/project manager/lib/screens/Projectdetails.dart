import 'package:flutter/material.dart';

import '../constants/constants.dart';

class ProDetails extends StatefulWidget {
  const ProDetails({Key? key}) : super(key: key);

  @override
  State<ProDetails> createState() => _ProDetailsState();
}

class _ProDetailsState extends State<ProDetails> {
  double appBarHeight = 120;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          // extendBodyBehindAppBar: true,//
          appBar: AppBar(
            backgroundColor: const Color(0xffF35c5b),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(5),
                    bottomLeft: Radius.circular(5))),
            title: const Text(
              "Project",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(60),
              child: Container(
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Colors.redAccent, kLogTColour],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight)),
                child: TabBar(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicatorWeight: 4,
                  labelStyle: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                  splashBorderRadius: BorderRadius.circular(5),
                  tabs: const [
                    Tab(
                      icon: Icon(Icons.description),
                      text: 'Description',
                    ),
                    Tab(
                      icon: Icon(
                        Icons.details,
                      ),
                      text: 'Details',
                    ),
                  ],
                ),
              ),
            ),
          ),
          body: TabBarView(
            children: [
              Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                  kLogTColour.withOpacity(0.3),
                  // Colors.white.withOpacity(0.4),
                  Colors.white.withOpacity(0.4),
                  kLogTColour.withOpacity(0.3),
                ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    elevation: 4,
                    borderOnForeground: true,
                    color: Colors.white54.withOpacity(0.3),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Padding(
                            padding: EdgeInsets.all(20.0),
                            child: Text(
                              "Project Name",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30,
                                  color: Colors.black),
                            ),
                          ),
                          Divider(
                            color: Colors.black,
                            height: 4,
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              textAlign: TextAlign.left,
                              "Description:",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "A project is any undertaking, carried out individually or collaboratively and possibly involving research or design, that is carefully planned to achieve a particular goal ",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w400),
                              textAlign: TextAlign.start,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                  kLogTColour.withOpacity(0.3),
                  // Colors.white.withOpacity(0.4),
                  Colors.white.withOpacity(0.4),
                  kLogTColour.withOpacity(0.3),
                ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    elevation: 4,
                    borderOnForeground: true,
                    color: Colors.white54.withOpacity(0.3),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
