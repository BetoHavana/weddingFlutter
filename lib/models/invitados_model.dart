import 'dart:convert';

class InvitadosModel {
    InvitadosModel({
        required this.id,
        required this.nombre,
        required this.telefono,
        required this.confirmacion,
        required this.parteEvento,
        required this.notas,
    });

    String id;
    String nombre;
    String telefono;
    String confirmacion;
    String parteEvento;
    String notas;

    //factory InvitadosModel.fromJson(String str) => InvitadosModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory InvitadosModel.fromMap(Map<String, dynamic> json) => InvitadosModel(
        id: json["Id"],
        nombre: json["nombre"],
        telefono: json["telefono"],
        confirmacion: json["confirmacion"],
        parteEvento: json["parte_evento"],
        notas: json["notas"],
    );

    factory InvitadosModel.fromJson(Map<String, dynamic> json) {
    return InvitadosModel(
      id: json["Id"],
      nombre: json["nombre"],
      telefono: json["telefono"],
      confirmacion: json["confirmacion"],
      parteEvento: json["parte_evento"],
      notas: json["notas"],
    );
  }


    Map<String, dynamic> toMap() => {
        "Id": id,
        "nombre": nombre,
        "telefono": telefono,
        "confirmacion": confirmacion,
        "parte_evento": parteEvento,
        "notas": notas,
    };
}
