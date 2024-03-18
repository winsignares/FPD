import 'dart:convert';
import 'dart:io';

class Post {
  // necesarios para el registro de usuarios y para login
  final String Email;
  final String Password;
  final String Phone_number;

  // necesarios para tipo de crimen y tipo de arma
  final String GunType;
  final String CrimeType;

  // necesarios para actualizar datos de los usuarios

  final String Nombre;
  final String Apellido;
  final String Usuario;

  Post({
    required this.Email,
    required this.Password,
    required this.Phone_number,
    required this.GunType,
    required this.CrimeType,
    required this.Nombre,
    required this.Apellido,
    required this.Usuario,
  });

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        Email: json['correo'],
        Password: json['contraseña'],
        Phone_number: json['telefono'],
        GunType: json['nombre'],
        CrimeType: json['nombre'],
        Nombre: json['nombre'],
        Apellido: json['apellido'],
        Usuario: json['usuario'],
      );
}
