import 'package:flutter/material.dart';

class BeritaPage extends StatelessWidget {
  final List<Map<String, String>> beritaList;

  BeritaPage({required this.beritaList});

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