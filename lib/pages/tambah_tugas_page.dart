import 'package:flutter/material.dart';
import '../model/tugas_model.dart';

class TambahTugasPage extends StatelessWidget {
  final Function(Tugas) onSubmit;

  TambahTugasPage({super.key, required this.onSubmit});

  final _formKey = GlobalKey<FormState>();
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
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _judulController,
                decoration: const InputDecoration(labelText: 'Judul'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "judul harus diisi";
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _deskripsiController,
                decoration: const InputDecoration(labelText: 'Deskripsi'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "deskripsi harus diisi";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Tugas tugas = Tugas(
                        judul: _judulController.text,
                        deskripsi: _deskripsiController.text);
                    onSubmit(tugas);
                    Navigator.pop(context);
                  }
                },
                child: const Text('Simpan'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
