import 'package:flutter/material.dart';
import 'login.dart'; // Pastikan Anda mengimpor halaman login

class ProfileUserPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profil Pengguna'),
        backgroundColor: Color.fromARGB(255, 110, 174, 115),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              _logout(context);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Avatar pengguna
              CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage('assets/images/kita.jpeg'), // Ganti dengan path gambar avatar Anda
              ),
              SizedBox(height: 20),
              // Nama pengguna
              Text(
                'ardowal',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 110, 174, 115),
                ),
              ),
              SizedBox(height: 10),
              // Email pengguna
              Text(
                '@ardowalemail.com',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[600],
                ),
              ),
              SizedBox(height: 30),
              // Informasi tambahan
              Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Informasi Tambahan',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 110, 174, 115),
                        ),
                      ),
                      SizedBox(height: 10),
                      ListTile(
                        leading: Icon(Icons.phone, color: Color.fromARGB(255, 110, 174, 115)),
                        title: Text('Nomor Telepon'),
                        subtitle: Text('+62 812-3456-7890'),
                      ),
                      ListTile(
                        leading: Icon(Icons.location_on, color: Color.fromARGB(255, 110, 174, 115)),
                        title: Text('Alamat'),
                        subtitle: Text('Jl. No. 123, Kota, Negara'),
                      ),
                      ListTile(
                        leading: Icon(Icons.date_range, color: Color.fromARGB(255, 110, 174, 115)),
                        title: Text('Tanggal Lahir'),
                        subtitle: Text('01 Januari 1990'),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 30),
              // Tombol pengaturan profil
              ElevatedButton.icon(
                onPressed: () {
                  // Aksi untuk mengedit profil
                },
                icon: Icon(Icons.edit),
                label: Text('Edit Profil'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  textStyle: TextStyle(fontSize: 18),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              SizedBox(height: 20),
              // Tombol logout
              ElevatedButton.icon(
                onPressed: () {
                  _logout(context);
                },
                icon: Icon(Icons.logout),
                label: Text('Logout'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  textStyle: TextStyle(fontSize: 18),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
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
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }
}