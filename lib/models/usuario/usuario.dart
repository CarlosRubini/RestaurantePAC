import 'package:json_annotation/json_annotation.dart';

part 'usuario.g.dart';

@JsonSerializable()
class Usuario {
  bool existe;
  int codUsuario;
  String nomeUsuario;
  String senhaUsuario;
  String emailUsuario;
  String tipoUsuario;

  Usuario(this.existe, this.codUsuario, this.nomeUsuario, this.senhaUsuario,
      this.emailUsuario, this.tipoUsuario);

  factory Usuario.fromJson(Map<String, dynamic> json) =>
      _$UsuarioFromJson(json);
  Map<String, dynamic> toJson() => _$UsuarioToJson(this);
}
