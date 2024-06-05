import 'package:flutter/material.dart';
import 'login.dart'; // Import halaman login admin jika ada
import 'tindakanadmin.dart'; // Import halaman tindakan admin

class AdminPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Halaman Admin'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.green.shade200, Colors.green.shade400],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage(
                    'assets/images/admin1.jpg'), // Ganti dengan path ke gambar admin
              ),
              SizedBox(height: 20),
              Text(
                'Selamat datang, Admin!',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Tambahkan navigasi ke halaman TindakanAdminPage di sini
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TindakanAdminPage()),
                  );
                },
                child: Text('Lakukan Tindakan Admin'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Tambahkan logika untuk logout di sini
                  _logout(context);
                },
                child: Text('Logout'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _logout(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => LoginPage(),
      ),
    );
  }
}