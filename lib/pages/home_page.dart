import 'package:catatan_tugas/model/tugas_model.dart';
import 'package:catatan_tugas/pages/daftar_tugas_page.dart';
import 'package:catatan_tugas/pages/tambah_tugas_page.dart';
import 'package:catatan_tugas/services/shared_preferences_services.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  SharedPreferencesService sharedPreferencesService =
      SharedPreferencesService();
  List<Tugas> daftarTugas = [];

  @override
  void initState() {
    super.initState();
    loadTugas();
  }

  void loadTugas() async {
    List<Tugas> tugas = await sharedPreferencesService.getTugas();
    setState(() {
      daftarTugas = tugas;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Tugas'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => TambahTugasPage(onSubmit: addTugas)),
          );
        },
        child: const Icon(Icons.add),
      ),
      body: DaftarTugasPage(daftarTugas, onDelete: deleteTugas),
    );
  }

  void addTugas(Tugas tugas) async {
    await sharedPreferencesService.addTugas(tugas);
    loadTugas();
  }

  void deleteTugas(int index) async {
    await sharedPreferencesService.deleteTugas(index);
    loadTugas();
  }
}