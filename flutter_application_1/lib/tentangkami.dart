import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: TentangKamiPage(),
  ));
}

class TentangKamiPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tentang Kami'),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: <Widget>[
                      CircleAvatar(
                        radius: 80,
                        backgroundImage: AssetImage('assets/images/mak.jpg'),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Notaris Sri Nilawati Mustika',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 20),
                      _buildSubtitle('Visi'),
                      _buildText(
                        'Menjadi perusahaan terdepan dalam industri dengan memberikan layanan terbaik kepada pelanggan.',
                      ),
                      SizedBox(height: 20),
                      _buildSubtitle('Misi'),
                      _buildText(
                        '1. Memberikan produk dan layanan berkualitas tinggi.\n'
                        '2. Menjaga kepercayaan dan kepuasan pelanggan.\n'
                        '3. Mengembangkan inovasi untuk masa depan yang lebih baik.',
                      ),
                      SizedBox(height: 20),
                      _buildSubtitle('Tim Kami'),
                      _buildText(
                        'Kami memiliki tim yang terdiri dari profesional berpengalaman di berbagai bidang untuk memastikan kualitas terbaik dari setiap layanan yang kami berikan.',
                      ),
                      SizedBox(height: 20),
                      ElevatedButton.icon(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HubungiKamiPage(),
                            ),
                          );
                        },
                        icon: Icon(Icons.phone),
                        label: Text('Hubungi Kami'),
                        style: ElevatedButton.styleFrom(
                          textStyle: TextStyle(fontSize: 18),
                          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          elevation: 3,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSubtitle(String text) {
    return Text(
      text,
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      textAlign: TextAlign.center,
    );
  }

  Widget _buildText(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Text(
        text,
        style: TextStyle(fontSize: 18),
        textAlign: TextAlign.center,
      ),
    );
  }
}

class HubungiKamiPage extends StatelessWidget {
  final TextEditingController _pesanController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hubungi Kami'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(16.0),
              children: <Widget>[
                _buildChatBubble(
                  text: 'Halo! Ada yang bisa kami bantu?',
                  isSent: false,
                ),
                _buildChatBubble(
                  text: 'Ya, saya ingin menanyakan tentang layanan Anda.',
                  isSent: true,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: _pesanController,
                    decoration: InputDecoration(
                      hintText: 'Ketik pesan...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                FloatingActionButton(
                  onPressed: () {
                    // Aksi ketika tombol kirim ditekan
                  },
                  child: Icon(Icons.send),
                  backgroundColor: Colors.blue,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChatBubble({required String text, required bool isSent}) {
    return Align(
      alignment: isSent ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5),
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        decoration: BoxDecoration(
          color: isSent ? Colors.blue[100] : Colors.grey[300],
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(
          text,
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}