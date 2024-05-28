import 'package:flutter/material.dart';
import 'package:library_manager/about.dart';
import 'package:library_manager/adherents.dart';
import 'package:library_manager/livres.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Home Page',
          style: TextStyle(
            fontSize: 30,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/home_image.png',
              width: 200,
              height: 200,
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Bienvenue à la Bibliothèque publique. Nous offrons une vaste collection de livres, magazines et ressources numériques. Venez découvrir un monde de connaissances et d\'inspiration.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
            )
            ),
          ],
          ),
      ),
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: ListView(
          children: [
            DrawerHeader(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/library_logo.png'),
                    radius: 35,
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Wail koundi',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Bibliothèque publique',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    ),
                  )
                ],
              ),
            ),
            ListTile(
              title: Text('Home'),
              leading: Icon(Icons.home, color: Colors.blueAccent),
              onTap: () {},
            ),
            ListTile(
              title: Text('Livres'),
              leading: Icon(Icons.book, color: Colors.blueAccent),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BooksPage()),
                );
              },
            ),
            ListTile(
              title: Text('Adherents'),
              leading: Icon(Icons.people, color: Colors.blueAccent),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AdherentsPage()),
                );
              },
            ),
            ListTile(
              title: Text('About'),
              leading: Icon(Icons.info, color: Colors.blueAccent),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AboutPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
