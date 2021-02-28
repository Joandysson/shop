class AuthException implements Exception {
  static const Map<String, String> errors = {
    "EMAIL_EXISTS": "E-mail existente",
    "TOO_MANY_ATTEMPTS_TRY_LATER": "Muitas tentativas, tente mas tarde",
    "EMAIL_NOT_FOUND  ": "E-mail não encontrado",
    "INVALID_PASSWORD": "Senha invalida",
    "USER_DISABLED": "Usuario desabilitado",
    "OPERATION_NOT_ALLOWED": "Operação não permitida",
  };

  final key;
  const AuthException(this.key);

  @override
  String toString() {
    if (errors.containsKey(key)) {
      return errors[key];
    } else {
      return 'Ocorreu um erro na authenticação';
    }
  }
}
