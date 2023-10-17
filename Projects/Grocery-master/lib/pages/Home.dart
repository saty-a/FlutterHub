import 'package:flutter/material.dart';
import 'package:grocery/pages/Cart.dart';
import 'package:grocery/pages/CockTails.dart';
import 'package:grocery/pages/Fruits.dart';
import 'package:grocery/pages/Veggies.dart';
import 'package:grocery/pages/Drinks.dart';
import 'package:grocery/pages/CockTails.dart';
import 'package:grocery/pages/IceCreams.dart';

class Home extends StatelessWidget {
  const Home({Key? key});

  Color getBoxColor(int index) {
    switch (index) {
      case 0:
        return Color(0xfff1e255);
      case 1:
        return Color(0xff5fb8ff);
      case 2:
        return Colors.orange;
      case 3:
        return Color(0xff71e475);
      case 4:
        return Color(0xfff87066);
      default:
        return Colors.grey;
    }
  }

  String getButtonImage(int index) {
    switch (index) {
      case 0:
        return 'assets/images/ice4.png';
      case 1:
        return 'assets/images/avocado.png';
      case 2:
        return 'assets/images/water.png';
      case 3:
        return 'assets/images/ckt3.png';
      case 4:
        return 'assets/images/banana.png';
      default:
        return 'Unknown';
    }
  }

  String getButtonText(int index) {
    switch (index) {
      case 0:
        return 'Ice Creams';
      case 1:
        return 'Vegetables';
      case 2:
        return 'Drinks';
      case 3:
        return 'Cocktails';
      case 4:
        return 'Fruits';
      default:
        return 'Unknown';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff824df4),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Cart()),
                );
              },
              icon: Icon(Icons.shopping_cart),
            )
          ],
        ),
        elevation: 0,
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: ListView.builder(
          itemCount: 5, // Number of buttons you want to display
          itemBuilder: (BuildContext context, int index) {
            return Center(
              child: Container(
                margin: EdgeInsets.only(bottom: 10),
                width: double.infinity,
                height: 250,
                decoration: BoxDecoration(
                  color: getBoxColor(index),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(
                      getButtonImage(index),
                      height: 80,
                    ),
                    Text(
                      getButtonText(index),
                      style: TextStyle(fontSize: 35),
                    ),
                    Container(
                      width: 150,
                      height: 40,
                      child: ElevatedButton(
                        onPressed: () {
                          // Navigate to the respective page based on the button
                          switch (index) {
                            case 0:
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => IceCreams()),
                              );
                              break;
                            case 1:
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Veggies()),
                              );
                              break;
                            case 2:
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Drinks()),
                              );
                              break;
                            case 3:
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CockTails()),
                              );
                              break;
                            case 4:
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Fruits()),
                              );
                              break;
                            default:
                              break;
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.black,
                        ),
                        child: Text(
                          getButtonText(index),
                          style: TextStyle(fontSize: 17),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
