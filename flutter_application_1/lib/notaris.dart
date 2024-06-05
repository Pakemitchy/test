import 'package:flutter/material.dart';

class NotarisPage extends StatelessWidget {
  final Color customColor = Color.fromARGB(255, 110, 174, 115);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200], // Tambahkan latar belakang abu-abu
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(16.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  'assets/images/ppat.jpeg',
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
                height:
                    20), // Berikan jarak antara gambar dan teks// Berikan jarak antara gambar dan teks

            // Kotak dengan teks Persyaratan Pendirian PT
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey[300]!),
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Pendirian PT',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: customColor,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'PERSYARATAN PENDIRIAN PT:',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: customColor,
                      ),
                    ),
                    SizedBox(height: 10),
                    ..._buildRequirementList(),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20), // Berikan jarak antara konten dan tombol

            // Tombol Berita di bagian bawah
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BeritaPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 50),
              ),
              child: Text(
                'Berita',
                style: TextStyle(fontSize: 18),
              ),
            ),
            SizedBox(height: 20), // Berikan jarak di bawah tombol
          ],
        ),
      ),
    );
  }

  List<Widget> _buildRequirementList() {
    List<String> requirements = [
      '1. Menyiapkan 3 (tiga) pilihan nama Perusahaan. Tidak boleh dalam Bahasa lain selain Bahasa Indonesia. Tiap nama harus terdiri dari 3 suku kata.',
      '2. Fotokopi KTP dan NPWP Pendiri/Pemegang Saham.',
      '3. Surat Keterangan Sewa Kantor dan fotokopi IMB (bila kantor berbentuk ruko) *wilayah kabupaten/kotamadya lokasi kantor akan dipakai sebagai Domisili Perusahaan pada Anggaran Dasar.',
      '4. Email Perusahaan (mohon disiapkan).',
      '5. Nomor telepon salah satu Direksi penanggung jawab/Dirut/Nomor telepon Perusahaan.',
      '6. Menentukan besaran Modal Dasar Perusahaan *lihat keterangan mengenai Modal Dasar di bawah.',
      '7. Menentukan besaran Modal Disetor, Minimum 25% dari Modal Dasar.',
      '8. Menentukan besaran prosentase saham yang dimiliki masing-masing pemegang saham, dihitung dari besaran Modal Disetor.',
      '9. Menentukan Nama-nama Pengurus PT yaitu: Dewan Direksi dan Dewan Komisaris.',
      '10. Pemegang saham boleh merangkap mengisi jabatan sebagai Direktur atau Komisaris. Tapi satu orang tidak boleh menjabat menjadi Direktur sekaligus Komisaris.',
      '11. Menentukan Modal Dasar berdasarkan ketentuan mengenai SIUP:',
      '      - PT di bidang SIUP umum maupun jasa:',
      '      - SIUP mikro min. Rp. 50.000.000,-.',
      '      - SIUP kecil 51.000.000,- s/d Rp. 500.000.000,-.',
      '      - SIUP Menengah Rp. 501.000.000,- s/d Rp. 10 M.',
      '      - SIUP Besar ≥ 10 M.',
    ];
    return requirements
        .map((item) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                item,
                style: TextStyle(fontSize: 16, color: Colors.grey[800]),
              ),
            ))
        .toList();
  }
}

class BeritaPage extends StatelessWidget {
  final List<Map<String, String>> beritaList = [
    {
      'title': 'Hari Notaris Nasional',
      'date': '1 Maret 2024',
      'description':
          'Merayakan Hari Notaris Nasional dengan berbagai kegiatan dan seminar.'
    },
    {
      'title': 'Seminar Hukum Properti',
      'date': '15 Mei 2024',
      'description':
          'Seminar tentang perkembangan terbaru dalam hukum properti.'
    },
    {
      'title': 'Workshop Kontrak Bisnis',
      'date': '30 Juni 2024',
      'description':
          'Workshop untuk memahami pembuatan kontrak bisnis yang efektif.'
    },
    {
      'title': 'Peringatan HUT Kemerdekaan',
      'date': '17 Agustus 2024',
      'description':
          'Kegiatan memperingati Hari Kemerdekaan dengan upacara dan lomba.'
    },
    {
      'title': 'Pelatihan Digitalisasi Notaris',
      'date': '5 September 2024',
      'description':
          'Pelatihan tentang penggunaan teknologi digital dalam pekerjaan notaris.'
    },
    {
      'title': 'Simposium Internasional Notaris',
      'date': '20 Oktober 2024',
      'description':
          'Simposium internasional yang membahas isu-isu global dalam notaris.'
    },
  ];

  @override
  Widget build(BuildContext context) {
    final Color customColor = Color.fromARGB(255, 110, 174, 115);

    return Scaffold(
      appBar: AppBar(
        title: Text('Berita Notaris'),
        backgroundColor: customColor,
      ),
      body: ListView.builder(
        itemCount: beritaList.length,
        itemBuilder: (context, index) {
          final berita = beritaList[index];
          return Card(
            margin: EdgeInsets.all(10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListTile(
              title: Text(
                berita['title']!,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: customColor,
                ),
              ),
              subtitle: Text(
                '${berita['date']}\n${berita['description']}',
                style: TextStyle(color: Colors.grey[800]),
              ),
              isThreeLine: true,
            ),
          );
        },
      ),
    );
  }
}