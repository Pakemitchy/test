import 'package:flutter/material.dart';
import 'legalisasi_dokumen.dart';
import 'tahapan_proses.dart';
import 'testimonial.dart'; // Import the shared testimonial section

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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              // Header Image
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

              // Header Text
              Text(
                'INFORMASI',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),

              // Info Cards
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LegalisasiDokumenPage()),
                      );
                    },
                    child: infoCard(
                      'assets/images/tanah.jpeg',
                      'Legalisasi Dokumen',
                    ),
                  ),
                  SizedBox(width: 10),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => TahapanProsesPage()),
                      );
                    },
                    child: infoCard(
                      'assets/images/tanah2.webp',
                      'Tahapan Proses Jual Beli Tanah',
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),

              // Testimonial Section
              TestimonialSection(),
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