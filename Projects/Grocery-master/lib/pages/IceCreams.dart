import 'package:flutter/material.dart';
import 'package:grocery/pages/Cart.dart';
import 'package:grocery/pages/Home.dart';

class IceCreams extends StatelessWidget {
  const IceCreams({Key? key});

  String getButtonText(int index) {
    switch (index) {
      case 0:
        return 'Fruits';
      case 1:
        return 'Vegetables';
      case 2:
        return 'Drinks';
      case 3:
        return 'Cocktails';
      case 4:
        return 'Ice Creams';
      default:
        return 'Unknown';
    }
  }

  @override
  Widget build(BuildContext context) {
    List<List<dynamic>> items = [
      ["assets/images/ice4.png", "Vanilla", 29.9],
      ["assets/images/ice4.png", "StrawBerry", 19.9],
      ["assets/images/ice4.png", "Mango", 19.9],
      ["assets/images/ice4.png", "Apple", 19.9],
      ["assets/images/ice4.png", "Custard", 19.9],
      ["assets/images/ice4.png", "Rosey", 19.9],
    ];
    void showAddedToCartDialog(BuildContext context) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Item Added to Cart'),
            content: Text('The item has been successfully added to your cart.'),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }

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
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(17),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Ice Creams',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  Text(
                    'Savor the cool delight of ice creams',
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: items.length, // Number of rows you want to display
                itemBuilder: (BuildContext context, int rowIndex) {
                  List<dynamic> item = items[rowIndex];
                  String image = item[0];
                  String product = item[1];
                  double price = item[2];

                  return InkWell(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(4),
                        child: ListTile(
                          tileColor: Colors.grey[200],
                          leading: Image.asset(
                            image,
                            width: 30,
                          ),
                          title: Text(product),
                          subtitle: Text(price.toString()),
                          trailing: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Color(0xff824df4)),
                            ),
                            onPressed: () {
                              Cart.addItem(image, product, price);
                              showAddedToCartDialog(context);
                            },
                            child: Text('Add to Cart'),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
