import 'package:catatan_tugas/model/tugas_model.dart';
import 'package:shared_preferences/shared_preferences.dart';


class SharedPreferencesService {
  Future<List<Tugas>> getTugas() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? tugasStringList = prefs.getStringList('tugasList');

    if (tugasStringList == null) {
      return [];
    }

    List<Tugas> tugasList = tugasStringList.map((tugasString) {
      return Tugas.fromJson(tugasString);
    }).toList();

    return tugasList;
  }

  Future<void> addTugas(Tugas tugas) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<Tugas> tugasList = await getTugas();
    tugasList.add(tugas);
    List<String> tugasStringList = tugasList.map((tugas) {
      return tugas.toJson(); // Menyimpan sebagai JSON string
    }).toList();
    prefs.setStringList('tugasList', tugasStringList);
  }

  Future<void> deleteTugas(int index) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<Tugas> tugasList = await getTugas();
    tugasList.removeAt(index);
    List<String> tugasStringList = tugasList.map((tugas) {
      return tugas.toJson(); // Menyimpan sebagai JSON string
    }).toList();
    prefs.setStringList('tugasList', tugasStringList);
  }
}