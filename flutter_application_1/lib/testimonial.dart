import 'package:flutter/material.dart';

class TestimonialSection extends StatefulWidget {
  final bool allowDelete;

  TestimonialSection({this.allowDelete = false});

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
      crossAxisAlignment: CrossAxisAlignment.center,
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
              onDelete: widget.allowDelete ? () => _removeTestimonial(index) : null,
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
                decoration: InputDecoration(labelText: 'Gambar'),
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
  final VoidCallback? onDelete;

  TestimonialCard({
    required this.name,
    required this.testimonial,
    required this.imagePath,
    this.onDelete,
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
            if (onDelete != null)
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