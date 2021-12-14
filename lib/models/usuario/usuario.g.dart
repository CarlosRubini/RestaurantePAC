// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'usuario.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Usuario _$UsuarioFromJson(Map<String, dynamic> json) {
  return Usuario(
    json['existe'] as bool,
    json['codUsuario'] as int,
    json['nomeUsuario'] as String,
    json['senhaUsuario'] as String,
    json['emailUsuario'] as String,
    json['tipoUsuario'] as String,
  );
}

Map<String, dynamic> _$UsuarioToJson(Usuario instance) => <String, dynamic>{
      'existe': instance.existe,
      'codUsuario': instance.codUsuario,
      'nomeUsuario': instance.nomeUsuario,
      'senhaUsuario': instance.senhaUsuario,
      'emailUsuario': instance.emailUsuario,
      'tipoUsuario': instance.tipoUsuario,
    };
