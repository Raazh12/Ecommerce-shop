import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fashion Store', style: GoogleFonts.poppins()),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () => Navigator.pushNamed(context, '/cart'),
          ),
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () => Navigator.pushNamed(context, '/profile'),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildFeaturedImage(),
            _buildCategoryButtons(context),
            _buildFeaturedItems(),
          ],
        ),
      ),
    );
  }

  Widget _buildFeaturedImage() {
    return SizedBox(
      height: 200,
      width: double.infinity,
      child: Image.network(
        'https://images.unsplash.com/photo-1441986300917-64674bd600d8',
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildCategoryButtons(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(
            onPressed: () => Navigator.pushNamed(context, '/clothing'),
            child: Text('Clothing', style: GoogleFonts.poppins()),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pushNamed(context, '/shoes'),
            child: Text('Shoes', style: GoogleFonts.poppins()),
          ),
        ],
      ),
    );
  }

  Widget _buildFeaturedItems() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'Featured Items',
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          height: 200,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(
              5,
              (index) => Container(
                width: 150,
                margin: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    Expanded(
                      child: Image.network(
                        'https://picsum.photos/150/150?random=$index',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Text(
                      'Item ${index + 1}',
                      style: GoogleFonts.poppins(),
                    ),
                    Text(
                      '\$${(index + 1) * 10}.99',
                      style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
