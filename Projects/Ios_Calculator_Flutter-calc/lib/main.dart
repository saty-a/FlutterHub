import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double firstnum = 0;
  double secondnum = 0;
  String operation = "";
  bool firstnumcompleted = false;
  int decimalcount1 = 0;
  int decimalcount2 = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  firstnumcompleted
                      ? ((secondnum - secondnum.ceil() == 0)
                          ? (decimalcount2 == 1
                              ? "${secondnum.ceil()}."
                              : "${secondnum.ceil()}")
                          : "$secondnum")
                      : ((firstnum - firstnum.ceil() == 0)
                          ? (decimalcount1 == 1
                              ? "${firstnum.ceil()}."
                              : "${firstnum.ceil()}")
                          : "$firstnum"),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 60.0,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(
                  width: 40.0,
                ),
              ],
            ),
            const SizedBox(
              height: 10.0,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  flex: 1,
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        if (firstnumcompleted) {
                          secondnum = 0;
                          decimalcount2 = 0;
                        } else {
                          firstnum = 0;
                          decimalcount1 = 0;
                        }
                      });
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: 90,
                      height: 90,
                      decoration: BoxDecoration(
                        color: Colors.grey[600],
                        shape: BoxShape.circle,
                      ),
                      child: const Text(
                        "AC",
                        style: TextStyle(
                          fontSize: 24.0,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    alignment: Alignment.center,
                    width: 90,
                    height: 90,
                    decoration: BoxDecoration(
                      color: Colors.grey[600],
                      shape: BoxShape.circle,
                    ),
                    child: const Text(
                      "+/-",
                      style: TextStyle(
                        fontSize: 24.0,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    alignment: Alignment.center,
                    width: 90,
                    height: 90,
                    decoration: BoxDecoration(
                      color: Colors.grey[600],
                      shape: BoxShape.circle,
                    ),
                    child: const Text(
                      "%",
                      style: TextStyle(
                        fontSize: 24.0,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  flex: 1,
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        operation = "/";
                        firstnumcompleted = true;
                      });
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: 90,
                      height: 90,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 255, 156, 36),
                        shape: BoxShape.circle,
                      ),
                      child: const Text(
                        "/",
                        style: TextStyle(
                          fontSize: 24.0,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
              ],
            ),
            Row(
              children: [
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  flex: 1,
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        if (firstnumcompleted) {
                          if (decimalcount2 >= 1) {
                            secondnum =
                                secondnum + pow(10, -1 * decimalcount2) * 7;
                            decimalcount2++;
                          } else {
                            secondnum = secondnum * 10 + 7;
                          }
                        } else {
                          if (decimalcount1 >= 1) {
                            firstnum =
                                firstnum + pow(10, -1 * decimalcount1) * 7;
                            decimalcount1++;
                          } else {
                            firstnum = firstnum * 10 + 7;
                          }
                        }
                      });
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: 90,
                      height: 90,
                      decoration: BoxDecoration(
                        color: Colors.grey[600],
                        shape: BoxShape.circle,
                      ),
                      child: const Text(
                        "7",
                        style: TextStyle(
                          fontSize: 24.0,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  flex: 1,
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        if (firstnumcompleted) {
                          if (decimalcount2 >= 1) {
                            secondnum =
                                secondnum + pow(10, -1 * decimalcount2) * 8;
                            decimalcount2++;
                          } else {
                            secondnum = secondnum * 10 + 8;
                          }
                        } else {
                          if (decimalcount1 >= 1) {
                            firstnum =
                                firstnum + pow(10, -1 * decimalcount1) * 8;
                            decimalcount1++;
                          } else {
                            firstnum = firstnum * 10 + 8;
                          }
                        }
                      });
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: 90,
                      height: 90,
                      decoration: BoxDecoration(
                        color: Colors.grey[600],
                        shape: BoxShape.circle,
                      ),
                      child: const Text(
                        "8",
                        style: TextStyle(
                          fontSize: 24.0,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  flex: 1,
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        if (firstnumcompleted) {
                          if (decimalcount2 >= 1) {
                            secondnum =
                                secondnum + pow(10, -1 * decimalcount2) * 9;
                            decimalcount2++;
                          } else {
                            secondnum = secondnum * 10 + 9;
                          }
                        } else {
                          if (decimalcount1 >= 1) {
                            firstnum =
                                firstnum + pow(10, -1 * decimalcount1) * 9;
                            decimalcount1++;
                          } else {
                            firstnum = firstnum * 10 + 9;
                          }
                        }
                      });
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: 90,
                      height: 90,
                      decoration: BoxDecoration(
                        color: Colors.grey[600],
                        shape: BoxShape.circle,
                      ),
                      child: const Text(
                        "9",
                        style: TextStyle(
                          fontSize: 24.0,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  flex: 1,
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        operation = "x";
                        firstnumcompleted = true;
                      });
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: 90,
                      height: 90,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 255, 156, 36),
                        shape: BoxShape.circle,
                      ),
                      child: const Text(
                        "X",
                        style: TextStyle(
                          fontSize: 24.0,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
              ],
            ),
            Row(
              children: [
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  flex: 1,
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        if (firstnumcompleted) {
                          if (decimalcount2 >= 1) {
                            secondnum =
                                secondnum + pow(10, -1 * decimalcount2) * 4;
                            decimalcount2++;
                          } else {
                            secondnum = secondnum * 10 + 4;
                          }
                        } else {
                          if (decimalcount1 >= 1) {
                            firstnum =
                                firstnum + pow(10, -1 * decimalcount1) * 4;
                            decimalcount1++;
                          } else {
                            firstnum = firstnum * 10 + 4;
                          }
                        }
                      });
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: 90,
                      height: 90,
                      decoration: BoxDecoration(
                        color: Colors.grey[600],
                        shape: BoxShape.circle,
                      ),
                      child: const Text(
                        "4",
                        style: TextStyle(
                          fontSize: 24.0,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  flex: 1,
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        if (firstnumcompleted) {
                          if (decimalcount2 >= 1) {
                            secondnum =
                                secondnum + pow(10, -1 * decimalcount2) * 5;
                            decimalcount2++;
                          } else {
                            secondnum = secondnum * 10 + 5;
                          }
                        } else {
                          if (decimalcount1 >= 1) {
                            firstnum =
                                firstnum + pow(10, -1 * decimalcount1) * 5;
                            decimalcount1++;
                          } else {
                            firstnum = firstnum * 10 + 5;
                          }
                        }
                      });
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: 90,
                      height: 90,
                      decoration: BoxDecoration(
                        color: Colors.grey[600],
                        shape: BoxShape.circle,
                      ),
                      child: const Text(
                        "5",
                        style: TextStyle(
                          fontSize: 24.0,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  flex: 1,
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        if (firstnumcompleted) {
                          if (decimalcount2 >= 1) {
                            secondnum =
                                secondnum + pow(10, -1 * decimalcount2) * 6;
                            decimalcount2++;
                          } else {
                            secondnum = secondnum * 10 + 6;
                          }
                        } else {
                          if (decimalcount1 >= 1) {
                            firstnum =
                                firstnum + pow(10, -1 * decimalcount1) * 6;
                            decimalcount1++;
                          } else {
                            firstnum = firstnum * 10 + 6;
                          }
                        }
                      });
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: 90,
                      height: 90,
                      decoration: BoxDecoration(
                        color: Colors.grey[600],
                        shape: BoxShape.circle,
                      ),
                      child: const Text(
                        "6",
                        style: TextStyle(
                          fontSize: 24.0,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  flex: 1,
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        operation = '-';
                        firstnumcompleted = true;
                      });
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: 90,
                      height: 90,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 255, 156, 36),
                        shape: BoxShape.circle,
                      ),
                      child: const Text(
                        "-",
                        style: TextStyle(
                          fontSize: 24.0,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
              ],
            ),
            Row(
              children: [
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  flex: 1,
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        if (firstnumcompleted) {
                          if (decimalcount2 >= 1) {
                            secondnum =
                                secondnum + pow(10, -1 * decimalcount2) * 1;
                            decimalcount2++;
                          } else {
                            secondnum = secondnum * 10 + 1;
                          }
                        } else {
                          if (decimalcount1 >= 1) {
                            firstnum =
                                firstnum + pow(10, -1 * decimalcount1) * 1;
                            decimalcount1++;
                          } else {
                            firstnum = firstnum * 10 + 1;
                          }
                        }
                      });
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: 90,
                      height: 90,
                      decoration: BoxDecoration(
                        color: Colors.grey[600],
                        shape: BoxShape.circle,
                      ),
                      child: const Text(
                        "1",
                        style: TextStyle(
                          fontSize: 24.0,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  flex: 1,
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        if (firstnumcompleted) {
                          if (decimalcount2 >= 1) {
                            secondnum =
                                secondnum + pow(10, -1 * decimalcount2) * 2;
                            decimalcount2++;
                          } else {
                            secondnum = secondnum * 10 + 2;
                          }
                        } else {
                          if (decimalcount1 >= 1) {
                            firstnum =
                                firstnum + pow(10, -1 * decimalcount1) * 2;
                            decimalcount1++;
                          } else {
                            firstnum = firstnum * 10 + 2;
                          }
                        }
                      });
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: 90,
                      height: 90,
                      decoration: BoxDecoration(
                        color: Colors.grey[600],
                        shape: BoxShape.circle,
                      ),
                      child: const Text(
                        "2",
                        style: TextStyle(
                          fontSize: 24.0,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  flex: 1,
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        if (firstnumcompleted) {
                          if (decimalcount2 >= 1) {
                            secondnum =
                                secondnum + pow(10, -1 * decimalcount2) * 3;
                            decimalcount2++;
                          } else {
                            secondnum = secondnum * 10 + 3;
                          }
                        } else {
                          if (decimalcount1 >= 1) {
                            firstnum =
                                firstnum + pow(10, -1 * decimalcount1) * 3;
                            decimalcount1++;
                          } else {
                            firstnum = firstnum * 10 + 3;
                          }
                        }
                      });
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: 90,
                      height: 90,
                      decoration: BoxDecoration(
                        color: Colors.grey[600],
                        shape: BoxShape.circle,
                      ),
                      child: const Text(
                        "3",
                        style: TextStyle(
                          fontSize: 24.0,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  flex: 1,
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        operation = "+";
                        firstnumcompleted = true;
                      });
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: 90,
                      height: 90,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 255, 156, 36),
                        shape: BoxShape.circle,
                      ),
                      child: const Text(
                        "+",
                        style: TextStyle(
                          fontSize: 24.0,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
              ],
            ),
            Row(
              children: [
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  flex: 2,
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        if (firstnumcompleted) {
                          if (decimalcount2 >= 1) {
                            secondnum =
                                secondnum + pow(10, -1 * decimalcount2) * 0;
                            decimalcount2++;
                          } else {
                            secondnum = secondnum * 10 + 0;
                          }
                        } else {
                          if (decimalcount1 >= 1) {
                            firstnum =
                                firstnum + pow(10, -1 * decimalcount1) * 0;
                            decimalcount1++;
                          } else {
                            firstnum = firstnum * 10 + 0;
                          }
                        }
                      });
                    },
                    child: Container(
                      // alignment: Alignment.center,
                      padding: const EdgeInsets.fromLTRB(30, 20, 0, 0),
                      width: 90,
                      height: 70,
                      decoration: BoxDecoration(
                          color: Colors.grey[600],
                          // shape: BoxShape.circle,
                          borderRadius: const BorderRadius.horizontal(
                            left: Radius.circular(60),
                            right: Radius.circular(60),
                          )),
                      child: const Text(
                        "0",
                        style: TextStyle(
                          fontSize: 24.0,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  flex: 1,
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        if (firstnumcompleted) {
                          decimalcount2 = 1;
                        } else {
                          decimalcount1 = 1;
                        }
                      });
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: 90,
                      height: 90,
                      decoration: BoxDecoration(
                        color: Colors.grey[600],
                        shape: BoxShape.circle,
                      ),
                      child: const Text(
                        ".",
                        style: TextStyle(
                          fontSize: 24.0,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  flex: 1,
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        switch (operation) {
                          case "x":
                            firstnum = firstnum * secondnum;
                            break;
                          case "-":
                            firstnum = firstnum - secondnum;
                            break;
                          case "+":
                            firstnum = firstnum + secondnum;
                            break;
                          case "/":
                            firstnum = (firstnum / secondnum);
                            break;
                          default:
                        }
                        firstnum = double.parse(firstnum.toStringAsFixed(8));
                        firstnumcompleted = false;
                        secondnum = 0;
                        decimalcount2 = 0;
                      });
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: 90,
                      height: 90,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 255, 156, 36),
                        shape: BoxShape.circle,
                      ),
                      child: const Text(
                        "=",
                        style: TextStyle(
                          fontSize: 24.0,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
              ],
            ),
            const SizedBox(
              height: 20.0,
            ),
          ],
        ));
  }
}
