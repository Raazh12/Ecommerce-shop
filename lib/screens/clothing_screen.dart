import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ClothingScreen extends StatelessWidget {
  final List<Map<String, dynamic>> clothingItems = [
    {
      'name': 'Summer Dress',
      'price': 49.99,
      'image': 'https://images.unsplash.com/photo-1515372039744-b8f02a3ae446',
    },
    {
      'name': 'Denim Jacket',
      'price': 79.99,
      'image': 'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d',
    },
    {
      'name': 'Classic T-Shirt',
      'price': 24.99,
      'image': 'https://images.unsplash.com/photo-1521572163474-6864f9cf17ab',
    },
    {
      'name': 'Winter Coat',
      'price': 129.99,
      'image': 'https://images.unsplash.com/photo-1539533018447-63fcce2678e3',
    },
  ];

  ClothingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Clothing', style: GoogleFonts.poppins()),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.75,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemCount: clothingItems.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: SizedBox(
                    width: double.infinity,
                    child: Image.network(
                      clothingItems[index]['image'],
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        clothingItems[index]['name'],
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '\$${clothingItems[index]['price']}',
                        style: GoogleFonts.poppins(
                          color: Colors.green,
                        ),
                      ),
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
              ],
            ),
          );
        },
      ),
    );
  }
}
