import 'package:flutter/material.dart';
import 'package:grocery/pages/Pay.dart';

class Cart extends StatefulWidget {
  static List<List<dynamic>> items = [];

  @override
  _CartState createState() => _CartState();

  static void addItem(String item, String product, double price) {
    items.add([item, product, price]);
  }
}

class _CartState extends State<Cart> {
  double getTotalPrice() {
    double totalPrice = 0;
    for (List<dynamic> item in Cart.items) {
      double price = item[2].toDouble(); // Convert the string to double
      totalPrice += price; // Assuming price is stored at index 1
    }
    return totalPrice;
  }

  void navigateToPaymentSuccessPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Pay(getTotalPrice()),
      ),
    );
  }

  void deleteItem(int index) {
    setState(() {
      Cart.items.removeAt(index);
    });
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
              onPressed: () {},
              icon: Icon(Icons.shopping_cart),
            ),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              'Your Items',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(5),
              height: 50,
              decoration: BoxDecoration(
                // color: Colors.amber[100],
                borderRadius: BorderRadius.circular(15),
              ),
              child: ListView.builder(
                itemCount: Cart.items.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                      padding: EdgeInsets.all(5),
                      child: ListTile(
                        tileColor: Colors.grey[200],
                        leading: Image.asset(
                          Cart.items[index][0],
                          width: 30,
                        ),
                        title: Text(Cart.items[index][1]),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(Cart.items[index][2].toString()),
                            SizedBox(width: 10),
                            Material(
                              shape: CircleBorder(),
                              shadowColor: Colors.grey,
                              color: Colors.transparent,
                              child: IconButton(
                                onPressed: () => deleteItem(index),
                                icon: Icon(
                                  Icons.delete,
                                  color: Colors.black,
                                ),
                                autofocus: false,
                                highlightColor: Colors.white,
                                splashColor: Colors.white,
                              ),
                            )
                          ],
                        ),
                      ));
                },
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'Total Price: ',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text: getTotalPrice().toStringAsFixed(2),
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(16),
            width: double.infinity,
            height: 80,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Color(0xff824df4)),
              ),
              onPressed: () {
                navigateToPaymentSuccessPage(); // Navigate to PaymentSuccessPage
              },
              child: Text(
                'PAY',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
