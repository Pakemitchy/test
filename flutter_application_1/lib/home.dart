import 'package:flutter/material.dart';
import 'testimonial.dart';

class HomePage extends StatelessWidget {
  final bool showSnackbar;

  HomePage({this.showSnackbar = false});

  @override
  Widget build(BuildContext context) {
    if (showSnackbar) {
      Future.delayed(Duration.zero, () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Anda sudah login'),
            duration: Duration(seconds: 2),
          ),
        );
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              // Menambahkan gambar di paling atas
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    'assets/images/kantor.png',
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'INFORMASI',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              // Menambahkan 2 foto di bawah header dengan teks
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    // Gambar dan teks pertama
                    infoCard(
                      'assets/images/tanah.jpeg',
                      'Legalisasi Dokumen',
                    ),
                    SizedBox(width: 10),
                    // Gambar dan teks kedua
                    infoCard(
                      'assets/images/tanah2.webp',
                      'Tahapan Proses Jual Beli Tanah',
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              // Menambahkan baris kedua dengan 2 foto lagi
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    // Gambar ketiga
                    infoCard(
                      'assets/images/tanah.jpeg',
                      'Legalisasi Dokumen',
                    ),
                    SizedBox(width: 10),
                    // Gambar keempat
                    infoCard(
                      'assets/images/tanah2.webp',
                      'Tahapan Proses Jual Beli Tanah',
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              // Menambahkan tombol Testimonial
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TestimonialPage()), // Navigasi ke halaman testimoni
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text('Testimonial'),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget infoCard(String imagePath, String title) {
    return Column(
      children: <Widget>[
        Container(
          width: 150,
          height: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 7,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(height: 5),
        Text(
          title,
          style: TextStyle(fontSize: 12),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
