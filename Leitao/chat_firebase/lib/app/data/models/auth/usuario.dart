class Usuario {
  final String idUsuario;
  final String nome;
  final String email;
  final String? cpf;
  final String? telefone;
  final String urlImagem;

  const Usuario({
    required this.idUsuario,
    required this.nome,
    required this.email,
    this.cpf,
    this.telefone,
    required this.urlImagem,
  });

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'idUsuario': idUsuario,
      'nome': nome,
      'email': email,
      'cpf': cpf,
      'telefone': telefone,
      'urlImagem': urlImagem,
    };
    return map;
  }
}
