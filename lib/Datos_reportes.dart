import 'dart:convert';
import 'dart:io';


class Datos_reportes {
  String Barrio = "";
  int Estrato = 0;
  String Municipio = "";
  String Coordenadas = "";
  String Fecha = "";
  String Hora = "";
  String Direccion = "";
  int Afectados = 0;
  String Genero_victima = "";
  String Tipo_zona = "";
  String Archivo_evidencia = "";
  String descripcion = "";
  String Tipo_arma = "";
  String Modalidad_delito = "";
  int id_usuario = 0;

  Datos_reportes(
      this.Barrio,
      this.Estrato,
      this.Fecha,
      this.Hora,
      this.Afectados,
      this.Genero_victima,
      this.Tipo_arma,
      this.Archivo_evidencia,
      this.Tipo_zona,
      this.Municipio,
      this.Coordenadas,
      this.descripcion,
      this.Direccion,
      this.id_usuario,
      this.Modalidad_delito,
      );

  Datos_reportes.fromJson(Map<String, dynamic> json) {
    Barrio = json["barrio"] ?? "";
    Estrato = json["estrato"] ?? 0;
    Municipio = json["municipio"] ?? "";
    Coordenadas = json["coordenadas"] ?? "";
    Fecha = json["fecha"] ?? "";
    Hora = json["hora"] ?? "";
    Direccion = json["direccion"] ?? "";
    Afectados = json["afectados"] ?? 0;
    Genero_victima = json["genero_victima"] ?? "";
    Tipo_zona = json["tipo_zona"] ?? "";
    Archivo_evidencia = json["archivo_evidencia"] ?? "";
    descripcion = json["descripcion"] ?? "";
    Tipo_arma = json["tipo_arma"] ?? "";
    Modalidad_delito = json["tipo_modalidad_delito"] ?? "";
    id_usuario = json["id_usuario"] ?? 0;
  }
}
