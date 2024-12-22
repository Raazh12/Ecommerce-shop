import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ShoesScreen extends StatelessWidget {
  final List<Map<String, dynamic>> shoesItems = [
    {
      'name': 'Running Shoes',
      'price': 89.99,
      'image': 'https://images.unsplash.com/photo-1542291026-7eec264c27ff',
    },
    {
      'name': 'Casual Sneakers',
      'price': 69.99,
      'image': 'https://images.unsplash.com/photo-1549298916-b41d501d3772',
    },
    {
      'name': 'Formal Shoes',
      'price': 99.99,
      'image': 'https://images.unsplash.com/photo-1478186014277-46f56cc2d08e',
    },
    {
      'name': 'Sport Shoes',
      'price': 79.99,
      'image': 'https://images.unsplash.com/photo-1562183241-b937e95585b6',
    },
  ];

  ShoesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shoes', style: GoogleFonts.poppins()),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: shoesItems.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.only(bottom: 16),
            child: Row(
              children: [
                SizedBox(
                  width: 120,
                  height: 120,
                  child: Image.network(
                    shoesItems[index]['image'],
                    fit: BoxFit.cover,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          shoesItems[index]['name'],
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          '\$${shoesItems[index]['price']}',
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            color: Colors.green,
                          ),
                        ),
                        const SizedBox(height: 8),
                        ElevatedButton(
                          onPressed: () {
                            // Add to cart functionality
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Added to cart'),
                                duration: Duration(seconds: 1),
                              ),
                            );
                          },
                          child: Text('Add to Cart'),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
