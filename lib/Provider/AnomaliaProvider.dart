import 'dart:convert';

import 'package:gestionresidencial/Models/Anomalia.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod/riverpod.dart';

class AdministradorProvider extends StateNotifier<List<AnomaliaModel>> {
  final String endpoint = "https://backendmovil2-default-rtdb.firebaseio.com/";
  AdministradorProvider(List<AnomaliaModel> state) : super(state);

  Future<bool> save(AnomaliaModel data) async {
    try {
      final url = "$endpoint/Anomalia.json";
      final response = await http.post(Uri.parse(url), body: data.toJson());
      if (response.statusCode == 200) {
        state = [...state, data];
        return true;
      } else {
        return false;
      }
    } catch (e) {
      Exception(e);
      return false;
    }
  }

  Future<List<AnomaliaModel>> getAll() async {
    try {
      final url = "$endpoint/Anomalia.json";
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        String body = utf8.decode(response.bodyBytes);
        final jsonData = jsonDecode(body);
        final listData = Anomalia.fromJsonList(jsonData);
        state = listData.anomaliaList;
        return listData.anomaliaList;
      } else {
        throw Exception("Ocurrió algo ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Error $e");
    }
  }

  Future<int> delete(String id) async {
    try {
      final url = '$endpoint/Anomalia/$id.json';

      final response = await http.delete(Uri.parse(url));

      if (response.statusCode == 200) {
        state.removeWhere((anomalia) => anomalia.idAnomalia == id);
        return 1;
      } else {
        throw Exception("Error ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Error $e");
    }
  }

  Future<bool> update(AnomaliaModel data) async {
    try {
      final url = "$endpoint/Anomalia.json";
      final response = await http.put(Uri.parse(url), body: data.toJson());
      if (response.statusCode == 200) {
        //final decodeData = jsonDecode(response.body);
        state[state.indexWhere(
            (anomalia) => anomalia.idAnomalia == data.idAnomalia)] = data;
        return true;
      } else {
        throw ("Error ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("Error $e");
    }
  }
}

//1 estado (StateNotifier), 2 tipo de estado(List<AdministradorModel>)
final administradorProvider =
    StateNotifierProvider<AdministradorProvider, List<AnomaliaModel>>((ref) {
  return AdministradorProvider([]);
});