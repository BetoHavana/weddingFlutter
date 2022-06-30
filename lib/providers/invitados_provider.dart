import 'dart:convert';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:wedding/models/flags.dart';
import 'package:wedding/models/invitados_model.dart';

class InvitadosProvider extends ChangeNotifier {
  String nombre = '';
  String telefono = '';
  String confirmacion = '';
  String parteEvento = '';
  String notas = '';
  final _baseUrl = 'https://emmanuelybrenda.ruffsstudios.com';

  String? Id = '';
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  InvitadosProvider() {
    print('InvitadosProvider starts');
  }
  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<InvitadosModel> _postJsonData(String endpoint) async {
    final url = Uri.parse(_baseUrl + endpoint);
    final response = await http.post(url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'v1': nombre,
          'v2': telefono,
          'v3': confirmacion,
          'v4': parteEvento,
          'v5': notas
        }));
    return InvitadosModel.fromJson(jsonDecode(response.body));
    //return InvitadosModel.fromJson(jsonDecode(response.body));
  }

  Future<List<InvitadosModel>> downloadJSON(String endpoint) async {
    final url = Uri.parse(_baseUrl + endpoint);
    final response = await http.post(url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'v1': nombre,
          'v2': telefono,
          'v3': confirmacion,
          'v4': parteEvento,
          'v5': notas
        }));

    if (response.statusCode == 200) {
      List spacecrafts = json.decode(response.body);
      return spacecrafts
          .map((spacecraft) => new InvitadosModel.fromJson(spacecraft))
          .toList();
    } else {
      throw Exception(
          'We were not able to successfully download the json data.');
    }
  }

  postData() async {
    confirmacion = Flags.conf;
    parteEvento = Flags.parteEv;
    List<InvitadosModel> invitadoResponse =
        await this.downloadJSON('/webService/WebServiceQueries.php');
    Id = invitadoResponse[0].id;
    if (Id != null) {
      print('Id funciona ' + Id!);
    } else {
      print('no data');
    }
    notifyListeners();
  }
}
