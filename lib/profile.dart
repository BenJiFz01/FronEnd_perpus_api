import 'package:fe_perpus/cpass.dart';
import 'package:flutter/material.dart';
import 'bookmark_page.dart';
import 'login.dart';
import 'cemel.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int _currentIndex = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text('Profile', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20), // Mengatur radius melengkung
          ),
        ),
        backgroundColor: Colors.blue[900],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 16),
            Text(
              'Latif Faqih',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 64),
            ProfileActionWidget(
              title: 'Change Password',
              onPressed: () {
                // Add logic for changing password
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChangePasswordPage(),
                  ),
                );
              },
            ),
            ProfileActionWidget(
              title: 'Change Email',
              onPressed: () {
                // Navigasi ke halaman ChangeEmailPage
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChangeEmailPage(),
                  ),
                );
              },
            ),
            ProfileActionWidget(
              title: 'Support Us',
              onPressed: () {
                // Add logic for supporting
              },
            ),
            ProfileActionWidget(
              title: 'Logout',
              onPressed: () {
                // Add logic for logout
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginPage(),
                  ),
                  (route) => false,
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
          if (index == 0) {
            Navigator.popUntil(context, (route) => route.isFirst);
          } else if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BookmarkPage(),
              ),
            );
          } else if (index == 2) {
            // No action needed as we are already on the Profile page
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Trending',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Profile',
          ),
        ],
        backgroundColor:
            Colors.blue.shade900, // Mengatur warna latar belakang menu bawah
        selectedItemColor:
            Colors.white, // Mengatur warna ikon dan teks item yang aktif
        unselectedItemColor: const Color.fromARGB(255, 111, 209,
            255), // Mengatur warna ikon dan teks item yang tidak aktif
      ),
    );
  }
}

class ProfileActionWidget extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  ProfileActionWidget({required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Colors.grey.shade300),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 16),
            ),
            Icon(Icons.arrow_forward),
          ],
        ),
      ),
    );
  }
}
