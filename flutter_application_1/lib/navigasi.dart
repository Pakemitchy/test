import 'package:flutter/material.dart';
import 'home.dart';
import 'notaris.dart';
import 'ppat.dart';
import 'profile.dart';
import 'tentangkami.dart';
import 'profileuser.dart'; // Import halaman ProfileUser

class Navigasi extends StatelessWidget {
  final bool showSnackbar;

  Navigasi({this.showSnackbar = false});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 110, 174, 115),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Digital Notary Services'),
              IconButton(
                icon: Icon(Icons.person),
                onPressed: () {
                  // Navigasi ke halaman profile
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProfileUserPage()),
                  );
                },
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            HomePage(showSnackbar: showSnackbar),
            NotarisPage(),
            PPATPage(),
            TentangKamiPage(),
            ProfilePage(),
          ],
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 110, 174, 115),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 7,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: TabBar(
            tabs: [
              Tab(
                text: 'Home',
                icon: Icon(Icons.home),
              ),
              Tab(
                text: 'Notaris',
                icon: Icon(Icons.account_balance),
              ),
              Tab(
                text: 'PPAT',
                icon: Icon(Icons.business),
              ),
              Tab(
                text: 'Tentang Kami',
                icon: Icon(Icons.info),
              ),
              Tab(
                text: 'Profile',
                icon: Icon(Icons.person),
              ),
            ],
            labelColor: Colors.white,
            unselectedLabelColor: Colors.grey[300],
            indicatorSize: TabBarIndicatorSize.label,
            indicator: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              color: Colors.green,
            ),
          ),
        ),
      ),
    );
  }
}