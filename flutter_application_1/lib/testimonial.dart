import 'package:flutter/material.dart';

class TestimonialPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Testimoni Pelanggan'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              testimonialContainer(
                image: 'assets/images/kita.jpeg',
                testimonial: 'Pelayananannya ramah dan cepat, "recommended".',
                author: '- Budi Hartono, PT. Abadi Jaya',
              ),
              SizedBox(height: 20),
              testimonialContainer(
                image: 'assets/images/kita.jpeg',
                testimonial:
                    'Kami sudah melakukan kerjasama lebih dari 4 tahun, selama kerjasama tidak pernah mengecewakan dalam pengurusan sertifikat jual beli properti, terimakasih pa ari.',
                author: '- Raharjo',
              ),
              SizedBox(height: 20),
              testimonialContainer(
                image: 'assets/images/kita.jpeg',
                testimonial: 'Mantap bagus pelayanan, good rating 9/10',
                author: '- John Doe',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget testimonialContainer({
    required String image,
    required String testimonial,
    required String author,
  }) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          CircleAvatar(
            backgroundImage: AssetImage(image),
            radius: 30,
          ),
          SizedBox(width: 20),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  testimonial,
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 5),
                Text(
                  author,
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}