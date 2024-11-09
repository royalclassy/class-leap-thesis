import 'package:flutter/material.dart';
import 'package:class_leap/src/custom_style/notification_card.dart'; // Import the NotificationCard widget
import 'package:class_leap/src/screens/peminjaman/detail_peminjaman_screen.dart'; // Import the NotificationCard widget
import 'package:class_leap/src/screens/pelaporan/detail_kendala_screen.dart'; // Import the NotificationCard widget

class NotificationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Notifications',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Color(0xFFFF5833),
      ),
      body: Container(
        color: Colors.grey[200],
        padding: EdgeInsets.all(16),
        child: ListView(
          children: [
            NotificationCard(
              title: 'Peminjaman Labmu Diterima',
              description: 'Lab KHD 201 telah diterima untuk peminjaman.',
              onTap: () {
                // Navigate to the detail page
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailpeminjamanPage(
                      studentName: 'John Doe',
                      studentNim: '123456789',
                      inputDate: '2023-10-01',
                      ruangan: 'KHD 201',
                      bookDate: '2023-10-01',
                      jamMulai: '08:00',
                      jamSelesai: '10:00',
                      jumlahPengguna: '5',
                      keterangan: 'Lab usage for project',
                      status: 'Accepted',
                      alasan: 'All requirements met',
                    ),
                  ),
                );
              },
            ),
            NotificationCard(
              title: 'Peminjaman Labmu Ditolak',
              description: 'Lab KHD 201 ditolak untuk peminjaman.',
              onTap: () {
                // Navigate to the detail page
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailpeminjamanPage(
                      studentName: 'John Doe',
                      studentNim: '123456789',
                      inputDate: '2023-10-01',
                      ruangan: 'KHD 201',
                      bookDate: '2023-10-01',
                      jamMulai: '08:00',
                      jamSelesai: '10:00',
                      jumlahPengguna: '5',
                      keterangan: 'Lab usage for project',
                      status: 'Rejected',
                      alasan: 'Lab is under maintenance',
                    ),
                  ),
                );
              },
            ),
            NotificationCard(
              title: 'Kendala Labmu Sedang Diproses',
              description: 'Kendala di Lab KHD 201 sedang diproses.',
              onTap: () {
                // Navigate to the detail page
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailkendalaPage(
                      studentName: 'John Doe',
                      studentNim: '123456789',
                      inputDate: '2023-10-01',
                      ruangan: 'KHD 201',
                      jenis: 'Hardware',
                      bentuk: 'Broken projector',
                      deskripsi: 'The projector is not working',
                    ),
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