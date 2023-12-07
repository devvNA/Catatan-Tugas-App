import 'package:flutter/material.dart';
import '../model/tugas_model.dart';

class TambahTugasPage extends StatelessWidget {
  final Function(Tugas) onSubmit;

  TambahTugasPage({super.key, required this.onSubmit});

  final TextEditingController _judulController = TextEditingController();
  final TextEditingController _deskripsiController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Tugas'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _judulController,
              decoration: const InputDecoration(labelText: 'Judul'),
            ),
            TextField(
              controller: _deskripsiController,
              decoration: const InputDecoration(labelText: 'Deskripsi'),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                Tugas tugas = Tugas(
                    judul: _judulController.text,
                    deskripsi: _deskripsiController.text);
                onSubmit(tugas);
                Navigator.pop(context);
              },
              child: const Text('Simpan'),
            ),
          ],
        ),
      ),
    );
  }
}