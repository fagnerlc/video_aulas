class UsuarioModel {
  String idUsuario;
  String nome;
  String email;
  String cpf;
  String senha;
  String urlImagem;

  UsuarioModel(
    this.idUsuario,
    this.nome,
    this.email,
    this.cpf,
    this.senha, {
    this.urlImagem = '',
  });

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      'idUsuario': idUsuario,
      'nome': nome,
      'email': email,
      'cpf': cpf,
      'urlImagem': urlImagem,
    };
    return map;
  }
}
