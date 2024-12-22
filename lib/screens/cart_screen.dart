import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CartScreen extends StatelessWidget {
  final List<Map<String, dynamic>> cartItems = [
    {
      'name': 'Summer Dress',
      'price': 49.99,
      'image': 'https://images.unsplash.com/photo-1515372039744-b8f02a3ae446',
      'quantity': 1,
    },
    {
      'name': 'Running Shoes',
      'price': 89.99,
      'image': 'https://images.unsplash.com/photo-1542291026-7eec264c27ff',
      'quantity': 1,
    },
  ];

  CartScreen({super.key});

  double get totalPrice {
    return cartItems.fold(0, (sum, item) => sum + (item['price'] * item['quantity']));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping Cart', style: GoogleFonts.poppins()),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: const EdgeInsets.all(8),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 80,
                          height: 80,
                          child: Image.network(
                            cartItems[index]['image'],
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                cartItems[index]['name'],
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                '\$${cartItems[index]['price']}',
                                style: GoogleFonts.poppins(
                                  color: Colors.green,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            IconButton(
                              icon: Icon(Icons.remove),
                              onPressed: () {
                                // Decrease quantity
                              },
                            ),
                            Text(
                              '${cartItems[index]['quantity']}',
                              style: GoogleFonts.poppins(),
                            ),
                            IconButton(
                              icon: Icon(Icons.add),
                              onPressed: () {
                                // Increase quantity
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: Offset(0, -2),
                ),
              ],
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total:',
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '\$${totalPrice.toStringAsFixed(2)}',
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      // Checkout functionality
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Proceeding to checkout...'),
                          duration: Duration(seconds: 2),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        'Checkout',
                        style: GoogleFonts.poppins(fontSize: 16),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
