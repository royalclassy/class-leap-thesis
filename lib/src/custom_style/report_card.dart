import 'package:flutter/material.dart';
import 'package:class_leap/src/screens/pelaporan/detail_kendala_screen.dart';
import 'package:class_leap/src/utils/data/dummy_data.dart';
import 'package:class_leap/src/custom_style/status_accept.dart';
import 'package:class_leap/src/custom_style/status_pending.dart';
import 'package:class_leap/src/custom_style/status_reject.dart';

class ReportCard extends StatelessWidget {
  final String studentName;
  final String studentNim;
  final String inputDate;
  final String ruangan;
  final String jenis;
  final String bentuk;
  final String deskripsi;
  final String status;

  const ReportCard({
    Key? key,
    required this.studentName,
    required this.studentNim,
    required this.inputDate,
    required this.ruangan,
    required this.jenis,
    required this.bentuk,
    required this.deskripsi,
    required this.status,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailkendalaPage(
              studentName: studentName,
              studentNim: studentNim,
              inputDate: inputDate,
              ruangan: ruangan,
              jenis: jenis,
              bentuk: bentuk,
              deskripsi: deskripsi,
              status: status, // Pass the status parameter here
            ),
          ),
        );
      },
      child: Card(
        elevation: 4,
        child: Container(
          margin: EdgeInsets.all(8.0),
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      studentName,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(inputDate, style: TextStyle(fontSize: 14),),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.access_time, size: 18,),
                          SizedBox(width: 12),
                          Text(jenis, style: TextStyle(fontSize: 14),),
                        ],
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(Icons.location_pin, size: 18,),
                          SizedBox(width: 12),
                          Text(ruangan, style: TextStyle(fontSize: 14),),
                        ],
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(Icons.description, size: 18,),
                          SizedBox(width: 12),
                          Text(bentuk, style: TextStyle(fontSize: 14),),
                        ],
                      ),
                    ],
                  ),
                  if (status == 'Selesai')
                    ButtonAccept(
                      label: 'Selesai',
                      onPressed: () {},
                    ),
                  if (status == 'Dibatalkan')
                    ButtonReject(
                      label: 'Dibatalkan',
                      onPressed: () {},
                    ),
                  if (status == 'Diproses')
                    ButtonPending(
                      label: 'Diproses',
                      onPressed: () {},
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}