import 'package:flutter/material.dart';
import 'login.dart';

class MeetingSchedulePage extends StatelessWidget {
  final Color customColor;

  MeetingSchedulePage({required this.customColor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Jadwal Pertemuan'),
        backgroundColor: customColor,
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey[200], // background color
              borderRadius: BorderRadius.circular(10), // rounded corners
            ),
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Center(
                  child: Text(
                    'Jadwalkan Pertemuan',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Nama',
                    prefixIcon: Icon(Icons.person),
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                    prefixIcon: Icon(Icons.email),
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Telepon',
                    prefixIcon: Icon(Icons.phone),
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  readOnly: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Tanggal Pertemuan',
                    prefixIcon: Icon(Icons.calendar_today),
                  ),
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2101),
                    );
                    if (pickedDate != null) {
                      // Handle the picked date
                    }
                  },
                ),
                SizedBox(height: 10),
                TextField(
                  maxLines: 4,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Catatan',
                    alignLabelWithHint: true,
                  ),
                ),
                SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      // Tambahkan fungsi untuk submit jadwal pertemuan di sini
                    },
                    style: ElevatedButton.styleFrom(
                      padding:
                          EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      backgroundColor: customColor,
                    ),
                    child: Text('Submit'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}