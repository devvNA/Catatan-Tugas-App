import 'package:catatan_tugas/model/tugas_model.dart';
import 'package:flutter/material.dart';

class DaftarTugasPage extends StatelessWidget {
  final List<Tugas> daftarTugas;
  final Function(int) onDelete;

  const DaftarTugasPage(this.daftarTugas, {super.key, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: daftarTugas.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(daftarTugas[index].judul),
          subtitle: Text(daftarTugas[index].deskripsi),
          trailing: IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              onDelete(index);
            },
          ),
        );
      },
    );
  }
}
