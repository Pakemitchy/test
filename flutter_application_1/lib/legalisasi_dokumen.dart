import 'package:flutter/material.dart';

class LegalisasiDokumenPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Legalisasi Dokumen'),
        backgroundColor: Color.fromARGB(255, 110, 174, 115),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Legalisasi Dokumen',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Image.asset('assets/images/tanah.jpeg'),
              SizedBox(height: 20),
              Text(
                'Apa itu Legalisasi Dokumen?',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'Legalisasi dokumen adalah proses untuk mengesahkan suatu dokumen agar memiliki kekuatan hukum. Proses ini biasanya dilakukan oleh notaris yang berwenang.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              Text(
                'Proses Legalisasi Dokumen',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
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
                        '1. Persiapan Dokumen',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Pastikan semua dokumen yang diperlukan sudah lengkap dan sesuai dengan persyaratan yang ditentukan.',
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 10),
                      Text(
                        '2. Kunjungan ke Notaris',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Datanglah ke kantor notaris terdekat untuk melakukan proses legalisasi. Bawa semua dokumen yang sudah dipersiapkan.',
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 10),
                      Text(
                        '3. Penandatanganan dan Verifikasi',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Notaris akan memverifikasi keabsahan dokumen dan meminta tanda tangan dari pihak yang terkait.',
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 10),
                      Text(
                        '4. Legalisasi',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Setelah verifikasi, notaris akan memberikan stempel dan tanda tangan untuk mengesahkan dokumen tersebut.',
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 10),
                      Text(
                        '5. Pengambilan Dokumen',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Dokumen yang sudah dilegalisasi bisa diambil setelah proses selesai.',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Dokumen yang Bisa Dilegalisasi',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                '1. Akta kelahiran\n2. Surat nikah\n3. Sertifikat tanah\n4. Ijazah\n5. Dokumen perusahaan',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Implementasi logika lebih lanjut
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text('Pelajari Lebih Lanjut'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}