import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class LaporLab extends StatefulWidget {
  @override
  _LaporLabState createState() => _LaporLabState();
}

class _LaporLabState extends State<LaporLab> {
  final _formKey = GlobalKey<FormState>();
  String? _selectedRoom;
  String? _selectedIssueType;
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;
  int? _numberOfParticipants;
  String? _purpose;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Form Pelaporan Kendala Lab',
          style: TextStyle(
            color: Color(0xFFFFFFFF),
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Color(0xFFFF5833),
        iconTheme: IconThemeData(
          color: Colors.white, // Set all icons to white
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Ruangan', style: TextStyle(fontWeight: FontWeight.bold)),
                      DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          hintText: 'Pilih ruangan',
                          hintStyle: TextStyle(fontSize: 14),
                        ),
                        value: _selectedRoom,
                        items: [
                          'KHD 201', 'KHS 202', 'KHS 203', 'DS 201', 'DS 202', 'DS 203',
                          'DS 301', 'DS 302', 'DS 303', 'DS 401', 'DS 402', 'DS 403'
                        ].map((room) {
                          return DropdownMenuItem(
                            value: room,
                            child: Text(room),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            _selectedRoom = value;
                          });
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Ruangan tidak boleh kosong';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20),
                      Text('Jenis Kendala', style: TextStyle(fontWeight: FontWeight.bold)),
                      DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          hintText: 'Pilih jenis kendala',
                          hintStyle: TextStyle(fontSize: 14),
                        ),
                        value: _selectedIssueType,
                        items: [
                          'Hardware', 'Software', 'Jaringan', 'Lainnya'
                        ].map((issue) {
                          return DropdownMenuItem(
                            value: issue,
                            child: Text(issue),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            _selectedIssueType = value;
                          });
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Jenis kendala tidak boleh kosong';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20),
                      Text('Waktu Peminjaman', style: TextStyle(fontWeight: FontWeight.bold)),
                      TextFormField(
                        readOnly: true,
                        decoration: InputDecoration(
                          hintText: _selectedTime == null
                              ? 'Pilih waktu'
                              : _selectedTime!.format(context),
                          hintStyle: TextStyle(fontSize: 14),
                        ),
                        onTap: () async {
                          TimeOfDay? pickedTime = await showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.now(),
                          );
                          if (pickedTime != null) {
                            setState(() {
                              _selectedTime = pickedTime;
                            });
                          }
                        },
                        validator: (value) {
                          if (_selectedTime == null) {
                            return 'Waktu peminjaman tidak boleh kosong';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20),
                      Text('Kode Perangkat', style: TextStyle(fontWeight: FontWeight.bold)),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: 'Masukkan Kode Perangkat',
                          hintStyle: TextStyle(fontSize: 14),
                        ),
                        onChanged: (value) {
                          _numberOfParticipants = int.tryParse(value);
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Kode perangkat tidak boleh kosong';
                          }
                          if (int.tryParse(value) == null) {
                            return 'Kode perangkat harus berupa angka';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20),
                      Text('Bentuk Kerusakan atau Kendala', style: TextStyle(fontWeight: FontWeight.bold)),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Masukkan bentuk kerusakan atau kendala',
                          hintStyle: TextStyle(fontSize: 14),
                        ),
                        onChanged: (value) {
                          _purpose = value;
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Bentuk kerusakan atau kendala tidak boleh kosong';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20),
                      Text('Deskripsi Kerusakan atau Kendala', style: TextStyle(fontWeight: FontWeight.bold)),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Masukkan deskripsi dengan lengkap',
                          hintStyle: TextStyle(fontSize: 14),
                        ),
                        onChanged: (value) {
                          _purpose = value;
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Deskripsi tidak boleh kosong';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState?.validate() ?? false) {
                                // Process the form submission
                              }
                            },
                            child: Text(
                              'Kirim',
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                              backgroundColor: Color(0xFF2F4858), // Set the button color here
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}