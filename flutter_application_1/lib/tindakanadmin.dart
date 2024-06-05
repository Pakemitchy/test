import 'package:flutter/material.dart';
import 'testimonial.dart'; // Import the shared testimonial section
import 'berita.dart'; // Import the BeritaPage

class TindakanAdminPage extends StatefulWidget {
  @override
  _TindakanAdminPageState createState() => _TindakanAdminPageState();
}

class _TindakanAdminPageState extends State<TindakanAdminPage> {
  final List<Map<String, String>> _beritaList = [
    {
      'title': 'Hari Notaris Nasional',
      'date': '1 Maret 2024',
      'description': 'Merayakan Hari Notaris Nasional dengan berbagai kegiatan dan seminar.'
    },
    {
      'title': 'Seminar Hukum Properti',
      'date': '15 Mei 2024',
      'description': 'Seminar tentang perkembangan terbaru dalam hukum properti.'
    },
    // Add other initial news items here
  ];

  final _titleController = TextEditingController();
  final _dateController = TextEditingController();
  final _descriptionController = TextEditingController();

  void _addBerita() {
    final String title = _titleController.text;
    final String date = _dateController.text;
    final String description = _descriptionController.text;

    if (title.isNotEmpty && date.isNotEmpty && description.isNotEmpty) {
      setState(() {
        _beritaList.add({
          'title': title,
          'date': date,
          'description': description,
        });
      });

      _titleController.clear();
      _dateController.clear();
      _descriptionController.clear();
    }
  }

  void _deleteBerita(int index) {
    setState(() {
      _beritaList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tindakan Admin'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Selamat datang di Halaman Tindakan Admin',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Text(
                'Anda memiliki akses untuk melakukan berbagai tindakan administratif di aplikasi ini.',
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Image.asset(
                'assets/images/admin.png', // Ganti dengan path gambar yang sesuai
                width: 200,
                height: 200,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 20),
              TextField(
                controller: _titleController,
                decoration: InputDecoration(labelText: 'Judul Berita'),
              ),
              TextField(
                controller: _dateController,
                decoration: InputDecoration(labelText: 'Tanggal'),
              ),
              TextField(
                controller: _descriptionController,
                decoration: InputDecoration(labelText: 'Deskripsi'),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: _addBerita,
                child: Text('Tambah Berita'),
              ),
              SizedBox(height: 20),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: _beritaList.length,
                itemBuilder: (context, index) {
                  final berita = _beritaList[index];
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
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      subtitle: Text(
                        '${berita['date']}\n${berita['description']}',
                        style: TextStyle(color: Colors.grey[800]),
                      ),
                      isThreeLine: true,
                      trailing: IconButton(
                        icon: Icon(Icons.delete, color: Colors.red),
                        onPressed: () => _deleteBerita(index),
                      ),
                    ),
                  );
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => BeritaPage(beritaList: _beritaList)),
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
              SizedBox(height: 20),
              TestimonialSection(
                allowDelete: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
