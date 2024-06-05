import 'package:flutter/material.dart';

class JadwalPertemuanUserPage extends StatefulWidget {
  @override
  _JadwalPertemuanUserPageState createState() =>
      _JadwalPertemuanUserPageState();
}

class _JadwalPertemuanUserPageState extends State<JadwalPertemuanUserPage> {
  List<Map<String, String>> _meetingList = [
    {
      'nama': 'Asep',
      'email': 'asep1@example.com',
      'telepon': '123-456-7890',
      'tanggal': '10 Juni 2024',
      'catatan': 'Harap membawa dokumen-dokumen yang diperlukan.'
    },
    {
      'nama': 'Budi',
      'email': 'budi2@example.com',
      'telepon': '987-654-3210',
      'tanggal': '15 Juni 2024',
      'catatan': 'Pertemuan untuk membahas proyek A.'
    },
    {
      'nama': 'Citra',
      'email': 'citra3@example.com',
      'telepon': '111-222-3333',
      'tanggal': '20 Juni 2024',
      'catatan': 'Pertemuan untuk presentasi produk baru.'
    },
    {
      'nama': 'Diana',
      'email': 'diana4@example.com',
      'telepon': '444-555-6666',
      'tanggal': '25 Juni 2024',
      'catatan': 'Diskusi tentang strategi pemasaran.'
    },
    // Add other meetings here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Jadwal Pertemuan Pengguna'),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.green[900], // Mengatur warna background hijau gelap
        ),
        child: ListView.builder(
          itemCount: _meetingList.length,
          itemBuilder: (context, index) {
            final meeting = _meetingList[index];
            return Card(
              margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: ListTile(
                title: Text(meeting['nama']!),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Email: ${meeting['email']}'),
                    Text('Telepon: ${meeting['telepon']}'),
                    Text('Tanggal Pertemuan: ${meeting['tanggal']}'),
                    Text('Catatan: ${meeting['catatan']}'),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}