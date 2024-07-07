class KaderAuthentication {
  Future<bool> login(String email, String password) async {
    // Simulate network request
    await Future.delayed(Duration(seconds: 1));
    return email == '';
  }
}
