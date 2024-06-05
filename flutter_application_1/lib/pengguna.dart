import 'package:flutter/material.dart';
import 'json.dart';

class PenggunaPage extends StatefulWidget {
  @override
  _PenggunaPageState createState() => _PenggunaPageState();
}

class _PenggunaPageState extends State<PenggunaPage> {
  final JsonHandler jsonHandler = JsonHandler('testimonials.json');
  List<Map<String, String>> testimonials = [];

  @override
  void initState() {
    super.initState();
    _loadTestimonials();
  }

  Future<void> _loadTestimonials() async {
    final loadedTestimonials = await jsonHandler.readTestimonials();
    setState(() {
      testimonials = loadedTestimonials;
    });
  }

  Future<void> _addTestimonial() async {
    final newTestimonial = {
      'name': 'New User',
      'testimonial': 'This is a new testimonial.',
      'imagePath': 'assets/images/avatar.png',
    };
    testimonials.add(newTestimonial);
    await jsonHandler.writeTestimonials(testimonials);
    _loadTestimonials();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pengguna'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: _addTestimonial,
              child: Text('Tambah Testimonial'),
            ),
            SizedBox(height: 20),
            ListView.builder(
              shrinkWrap: true,
              itemCount: testimonials.length,
              itemBuilder: (context, index) {
                final testimonial = testimonials[index];
                return ListTile(
                  title: Text(testimonial['name'] ?? ''),
                  subtitle: Text(testimonial['testimonial'] ?? ''),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(testimonial['imagePath'] ?? ''),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}