import 'package:flutter/material.dart';
import 'legalisasi_dokumen.dart';
import 'tahapan_proses.dart';

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

class TestimonialSection extends StatefulWidget {
  @override
  _TestimonialSectionState createState() => _TestimonialSectionState();
}

class _TestimonialSectionState extends State<TestimonialSection> {
  final List<Map<String, String>> testimonials = [
    {
      'name': 'Arepp',
      'testimonial': 'Pelayanan sangat memuaskan dan profesional!',
      'imagePath': 'assets/images/kita.jpeg',
    },
    {
      'name': 'Wall',
      'testimonial': 'Proses cepat dan mudah, sangat direkomendasikan!',
      'imagePath': 'assets/images/kita.jpeg',
    },
    {
      'name': 'Predo',
      'testimonial': 'Pengalaman yang luar biasa!',
      'imagePath': 'assets/images/kita.jpeg',
    },
  ];

  void _addTestimonial(String name, String testimonial, String imagePath) {
    setState(() {
      testimonials.add({
        'name': name,
        'testimonial': testimonial,
        'imagePath': imagePath,
      });
    });
  }

  void _removeTestimonial(int index) {
    setState(() {
      testimonials.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center, // Centering the testimonial text
      children: [
        Text(
          'Testimonial',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 20),
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: testimonials.length,
          itemBuilder: (context, index) {
            return TestimonialCard(
              name: testimonials[index]['name']!,
              testimonial: testimonials[index]['testimonial']!,
              imagePath: testimonials[index]['imagePath']!,
              onDelete: () => _removeTestimonial(index),
            );
          },
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            _showAddTestimonialDialog(context);
          },
          child: Text('Tambah Testimonial'),
        ),
      ],
    );
  }

  void _showAddTestimonialDialog(BuildContext context) {
    final nameController = TextEditingController();
    final testimonialController = TextEditingController();
    final imagePathController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Tambah Testimonial'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'Nama'),
              ),
              TextField(
                controller: testimonialController,
                decoration: InputDecoration(labelText: 'Testimonial'),
              ),
              TextField(
                controller: imagePathController,
                decoration: InputDecoration(labelText: 'Path Gambar'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Batal'),
            ),
            TextButton(
              onPressed: () {
                _addTestimonial(
                  nameController.text,
                  testimonialController.text,
                  imagePathController.text,
                );
                Navigator.of(context).pop();
              },
              child: Text('Tambah'),
            ),
          ],
        );
      },
    );
  }
}

class TestimonialCard extends StatelessWidget {
  final String name;
  final String testimonial;
  final String imagePath;
  final VoidCallback onDelete;

  TestimonialCard({
    required this.name,
    required this.testimonial,
    required this.imagePath,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(imagePath),
              radius: 30,
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    testimonial,
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ),
            IconButton(
              icon: Icon(Icons.delete, color: Colors.red),
              onPressed: onDelete,
            ),
          ],
        ),
      ),
    );
  }
}