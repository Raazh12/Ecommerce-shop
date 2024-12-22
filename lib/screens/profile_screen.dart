import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile', style: GoogleFonts.poppins()),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(
                'https://images.unsplash.com/photo-1438761681033-6461ffad8d80',
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Jane Doe',
              style: GoogleFonts.poppins(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'jane.doe@example.com',
              style: GoogleFonts.poppins(
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 32),
            _buildProfileSection(
              'Personal Information',
              [
                _buildListTile(Icons.person, 'Edit Profile'),
                _buildListTile(Icons.location_on, 'Shipping Address'),
                _buildListTile(Icons.payment, 'Payment Methods'),
              ],
            ),
            const SizedBox(height: 16),
            _buildProfileSection(
              'Orders',
              [
                _buildListTile(Icons.shopping_bag, 'Order History'),
                _buildListTile(Icons.local_shipping, 'Track Orders'),
                _buildListTile(Icons.refresh, 'Returns'),
              ],
            ),
            const SizedBox(height: 16),
            _buildProfileSection(
              'Settings',
              [
                _buildListTile(Icons.notifications, 'Notifications'),
                _buildListTile(Icons.security, 'Privacy & Security'),
                _buildListTile(Icons.help, 'Help & Support'),
              ],
            ),
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Logout functionality
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding: const EdgeInsets.all(16),
                ),
                child: Text(
                  'Logout',
                  style: GoogleFonts.poppins(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileSection(String title, List<Widget> children) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            ...children,
          ],
        ),
      ),
    );
  }

  Widget _buildListTile(IconData icon, String title) {
    return ListTile(
      leading: Icon(icon),
      title: Text(
        title,
        style: GoogleFonts.poppins(),
      ),
      trailing: const Icon(Icons.arrow_forward_ios),
      onTap: () {
        // Navigate to respective screens
      },
    );
  }
}
